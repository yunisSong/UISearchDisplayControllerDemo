//
//  ViewController.m
//  UISearchDisplayControllerDemo
//
//  Created by Yunis on 3/9/17.
//  Copyright © 2017 Yunis. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate,UISearchDisplayDelegate>
//信息页面
@property (nonatomic,strong) UITableView               *m_taskTab;
//搜索框
@property (nonatomic,strong) UISearchBar               *m_searchBar;
//展示搜索页面
@property (nonatomic,strong) UISearchDisplayController *searchDisCtr;

@end

@implementation ViewController
static NSString *YunisCellIdentifier = @"YunisFirendCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.view addSubview:self.m_taskTab];
    self.m_taskTab.frame = self.view.bounds;

//    self.m_taskTab.tableHeaderView = self.m_searchBar;
    [self.view addSubview:self.m_searchBar];
    // Do any additional setup after loading the view, typically from a nib.
}

#pragma mark UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 64;
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    if (tableView == self.searchDisCtr.searchResultsTableView)
    {
        return 1;
    }
    return 1;
    
}
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (tableView == self.searchDisCtr.searchResultsTableView)
    {
        return 1;
    }
    return 60;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:YunisCellIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:YunisCellIdentifier];
    }

    cell.textLabel.text = @"sadfsadfasd";
    if (tableView == self.searchDisCtr.searchResultsTableView)
    {
        cell.textLabel.text = @"搜索结果！！！！！";
    }
    [cell layoutSubviews];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
    
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (UITableView *)m_taskTab{
    if (_m_taskTab == nil) {
        _m_taskTab                 = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _m_taskTab.showsVerticalScrollIndicator = NO;
        _m_taskTab.delegate        = self;
        _m_taskTab.dataSource      = self;
        _m_taskTab.backgroundColor = [UIColor clearColor];
        _m_taskTab.backgroundView  = nil;
        [_m_taskTab registerClass:[UITableViewCell class] forCellReuseIdentifier:YunisCellIdentifier];
        _m_taskTab.separatorStyle  = UITableViewCellSeparatorStyleNone;
    }
    
    return _m_taskTab;
}
- (UISearchBar *)m_searchBar{
    if (_m_searchBar == nil) {
        _m_searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 64)];
        _m_searchBar.delegate = self;
        [_m_searchBar setAutocapitalizationType:UITextAutocapitalizationTypeNone];
    }
    return _m_searchBar;
}
- (UISearchDisplayController *)searchDisCtr{
    if (_searchDisCtr == nil) {
        _searchDisCtr = [[UISearchDisplayController alloc] initWithSearchBar:self.m_searchBar contentsController:self];
        _searchDisCtr.active = NO;
        [_searchDisCtr setSearchResultsDataSource:self];
        [_searchDisCtr setSearchResultsDelegate:self];
    }
    return _searchDisCtr;
}

@end
