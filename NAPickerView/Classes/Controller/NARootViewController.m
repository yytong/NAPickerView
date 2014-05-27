//
//  NARootViewController.m
//  NAPickerView
//
//  Created by iNghia on 8/4/13.
//  Copyright (c) 2013 nghialv. All rights reserved.
//

#import "NARootViewController.h"
#import "NAPickerView.h"
#import "NACustomCell.h"

@interface NARootViewController () <NAPickerViewDelegate> {
    NSMutableArray *items;
    NSArray *items2;
    NSMutableArray *items3;
}

@end

@implementation NARootViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    items = [[NSMutableArray alloc] init];
    for (int i = 0; i < 30;  i++) {
        [items addObject:[NSString stringWithFormat:@"%d", i]];
    }
//    // picker 1
//    NAPickerView *pickerView = [[NAPickerView alloc] initWithFrame:CGRectMake(40.f, 10.f, 100.f, 200.f)
//                                                          andItems:items
//                                                       andDelegate:self];
//    [pickerView setIndex:5];
//    pickerView.backgroundColor = [UIColor blackColor];
//    pickerView.cornerRadius = 8.f;
//    pickerView.borderColor = [UIColor orangeColor];
//    pickerView.borderWidth = 3.f;
//    pickerView.showOverlay = NO;
//    [self.view addSubview:pickerView];
    
    UIImage *image = [UIImage imageNamed:@"weibo_share"];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    imageView.userInteractionEnabled = YES;
    imageView.frame = CGRectMake(10, 80, image.size.width, image.size.height);
    [self.view addSubview:imageView];
    
    NSLog(@"imageview.frame : %@", NSStringFromCGRect(imageView.frame));
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, imageView.frame.size.width, 30)];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.text = @"语言识别";
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.font = [UIFont boldSystemFontOfSize:18];
    [imageView addSubview:titleLabel];
    
    // picker 2
    items2 = @[@"普通话", @"粤语", @"英语", @"四川话", @"河南话", @"东北话", @"山东话"];
    NAPickerView *pickerView2 = [[NAPickerView alloc] initWithFrame:CGRectMake(0, 30, imageView.frame.size.width, 112.5)
                                                          andItems:items2
                                                       andDelegate:self];
    [pickerView2 setIndex:2];
    pickerView2.backgroundColor = [UIColor clearColor];
//    pickerView2.cornerRadius = 8.f;
//    pickerView2.borderColor = [UIColor colorWithRed:0.f green:0.5f blue:0.5f alpha:1.f];
//    pickerView2.borderWidth = 3.f;
    pickerView2.configureBlock = ^(NALabelCell *cell, NSString *item) {
        cell.textView.textAlignment = UITextAlignmentCenter;
        cell.textView.font = [UIFont systemFontOfSize:20];
        cell.textView.backgroundColor = [UIColor clearColor];
        cell.textView.textColor = [UIColor whiteColor];
        [cell.textView setText:item];
    };
    pickerView2.highlightBlock = ^(NALabelCell *cell) {
        cell.textView.textColor = [UIColor whiteColor];
    };
    pickerView2.unhighlightBlock = ^(NALabelCell *cell) {
        cell.textView.textColor = [UIColor whiteColor];
    };
//    [self.view addSubview:pickerView2];
    [imageView addSubview:pickerView2];
    
    
    UIButton *okButton = [self createButton:@"weibo_share_big_btn_normal" pressedImg:@"weibo_share_big_btn_pressed" origin:CGPointMake(1.5, pickerView2.frame.origin.y + pickerView2.frame.size.height)];

    CGRect okBtnFrame = okButton.frame;
    okBtnFrame.origin.y = imageView.frame.size.height - okButton.frame.size.height;
    okButton.frame = okBtnFrame;
    
    [okButton setTitle:@"确定" forState:UIControlStateNormal];
    [okButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    okButton.backgroundColor = [UIColor clearColor];
    [imageView addSubview:okButton];
    
    pickerView2.showOverlay = NO;
    pickerView2.showOverlay = YES;
    
//    CGRect pickerView2Frame = pickerView2.frame;
//    pickerView2Frame.size.height = imageView.frame.size.height - titleLabel.frame.size.height - okButton.frame.size.height;
//    pickerView2.frame = pickerView2Frame;
    
    NSLog(@"pickerView2.frame:%@", NSStringFromCGRect(pickerView2.frame));
    
//    // picker3 with custom cell
//    items3 = [[NSMutableArray alloc] init];
//    for (int i = 0; i < 5; i++) {
//        NSString *title = [NSString stringWithFormat:@"Item %d", i];
//        NSArray *obj = @[title, @"image.png"];
//        [items3 addObject:obj];
//    }
//    NAPickerView *pickerView3 = [[NAPickerView alloc] initWithFrame:CGRectMake(40.f, 50, 250.f, 200.f * 2)
//                                                           andItems:items3
//                                                   andCellClassName:@"NACustomCell"
//                                                        andDelegate:self];
//    [pickerView3 setIndex:3];
//    pickerView3.backgroundColor = [UIColor blackColor];
//    pickerView3.cornerRadius = 8.f;
//    pickerView3.borderColor = [UIColor colorWithRed:0.f green:0.5f blue:0.5f alpha:1.f];
//    pickerView3.borderWidth = 3.f;
//    pickerView3.configureBlock = ^(NACustomCell *cell, NSArray *item) {
//        NSString *title = (NSString *)[item objectAtIndex:0];
//        NSString *imageName = (NSString *)[item objectAtIndex:1];
//        [cell.avatar setImage:[UIImage imageNamed:imageName]];
//        [cell.label setText:title];
//    };
//    pickerView3.highlightBlock = ^(NACustomCell *cell) {
//        cell.label.textColor = [UIColor blueColor];
//        cell.avatar.alpha = 1.0;
//    };
//    pickerView3.unhighlightBlock = ^(NACustomCell *cell) {
//        cell.label.textColor = [UIColor grayColor];
//        cell.avatar.alpha = 0.5f;
//    };
//    [self.view addSubview:pickerView3];
}

- (UIButton *)createButton:(NSString *)normalImgName pressedImg:(NSString *)pressedImgName origin:(CGPoint)origin
{
    UIImage *normalImg = [UIImage imageNamed:normalImgName];
    UIImage *pressedImg = [UIImage imageNamed:pressedImgName];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    [btn setImage:normalImg forState:UIControlStateNormal];
//    [btn setImage:pressedImg forState:UIControlStateHighlighted];
    [btn setBackgroundImage:normalImg forState:UIControlStateNormal];
    [btn setBackgroundImage:pressedImg forState:UIControlStateHighlighted];
    btn.frame = CGRectMake(origin.x, origin.y, normalImg.size.width, normalImg.size.height);
    btn.backgroundColor = [UIColor clearColor];
    return btn;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)didSelectedAtIndexDel:(NSInteger)index
{
    NSLog(@"selected: %@", (NSString *)[items objectAtIndex:index]);
}

@end
