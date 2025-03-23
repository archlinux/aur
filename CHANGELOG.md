# Changelog

All notable changes to this project will be documented in this file. See [standard-version](https://github.com/conventional-changelog/standard-version) for commit guidelines.

## [0.3.0](https://github.com/yiktllw/XCMusic/compare/v0.2.8...v0.3.0) (2025-03-21)


### Features

* 可以记忆退出时的播放进度并恢复 ([0eadd9f](https://github.com/yiktllw/XCMusic/commit/0eadd9fffe430f3ce8ebce8ac0a8f39d132a9a75))
* 能够在新歌单界面调整专辑栏宽度 ([3165287](https://github.com/yiktllw/XCMusic/commit/316528713f6daaa048480a29e7ce0460149b2079))
* 实现歌单界面的排序和搜索 ([c460976](https://github.com/yiktllw/XCMusic/commit/c460976d4b68fbcc9662ab0cb45db3e57502ad01))
* 实现设置：列表随机时，是否连续播放同一专辑的歌曲 ([cb779a3](https://github.com/yiktllw/XCMusic/commit/cb779a3762080cde49c686adc0b5d480a9bc0b93))
* 实现http代理的身份验证 ([9de5845](https://github.com/yiktllw/XCMusic/commit/9de5845dd6a086b2ae0c72465e3ca3908082b8ba))
* 使用虚拟滚动列表重写歌单界面和专辑界面 ([135ce35](https://github.com/yiktllw/XCMusic/commit/135ce35d7b3e00343caecd9eeefe7011a41ef86e))
* 添加骨架屏（评论、播放列表、云盘、下载、本地歌曲） ([b33a96d](https://github.com/yiktllw/XCMusic/commit/b33a96d20aaee7842a95de9e797b5def4791794a))
* 添加骨架屏（评论界面、用户界面、歌手界面、听歌排行界面） ([2d5d94a](https://github.com/yiktllw/XCMusic/commit/2d5d94af385dd9dab6fa202532fb695ec828ea2d))
* 添加骨架屏（搜索界面） ([37faf09](https://github.com/yiktllw/XCMusic/commit/37faf096175481d5a6bbe0e6618119cd91c2a096))
* 添加均衡器图标的title提示 ([d4f0404](https://github.com/yiktllw/XCMusic/commit/d4f04049ceb9b5b5035764a130a5c2696a2eccf0))
* 完成虚拟滚动的歌曲列表 ([7596f67](https://github.com/yiktllw/XCMusic/commit/7596f67f785cab3ae6c72c8a54d421403981072b))
* 完善专辑和歌单的评论界面 ([9def456](https://github.com/yiktllw/XCMusic/commit/9def456e0309ad414010000dfe2560a1b1d774fb))
* 为歌单、专辑界面添加骨架屏 ([17b9ef6](https://github.com/yiktllw/XCMusic/commit/17b9ef653b3a915f4b777f0b0aa7f6fbca4ed0de))
* 新增均衡器 ([73aed88](https://github.com/yiktllw/XCMusic/commit/73aed887a4da23465b3a805700bc716260062779))
* 新增均衡器图标 ([a782d6c](https://github.com/yiktllw/XCMusic/commit/a782d6cf7a981b3acd014c4446860dea1a08a988))
* 新增权限说明（设置-关于-介绍-权限说明） ([72d063d](https://github.com/yiktllw/XCMusic/commit/72d063db3b2d73c349976b67148ee070d2f4cbbb))
* 新增虚拟滚动组件 ([aa5b3d8](https://github.com/yiktllw/XCMusic/commit/aa5b3d8c8c0cac6a5db75fc011f560367fee6f99))
* 新增rust的网易云音乐api代码 ([a784a43](https://github.com/yiktllw/XCMusic/commit/a784a43045a9ebaee4533a82ee9c9772978330a2))
* 修复CHANGELOG的错误，更新README ([231d990](https://github.com/yiktllw/XCMusic/commit/231d990ec1140ff86a561099933b0c4e72981af0))
* 修改播放栏-播放模式图标样式 ([f651416](https://github.com/yiktllw/XCMusic/commit/f6514162cf379c26687484ef442bc3934d954aac))
* 修改设置文本 ([00895e9](https://github.com/yiktllw/XCMusic/commit/00895e9ff2625137a61e7616c66579bbc96906bb))
* 在播放栏的播放列表中使用虚拟滚动歌单 ([18a720a](https://github.com/yiktllw/XCMusic/commit/18a720aee924d71a66e3d9bf58ac30b54ff9ef38))
* 在歌曲信息界面，鼠标悬停在歌手、专辑上时，显示下划线以提示可以点击查看更多信息 ([7d6f782](https://github.com/yiktllw/XCMusic/commit/7d6f782b9f55e68d9d0303716620435e5c80e5a0))
* 在键入搜索时不显示搜索历史 ([3eb0dc5](https://github.com/yiktllw/XCMusic/commit/3eb0dc51a3b7fe404ed360c2248efc8325ccfaa7))
* 在均衡器窗口中，添加数字显示 ([8d92566](https://github.com/yiktllw/XCMusic/commit/8d92566a1138dd1436aac269be592868b3f35e8a))
* 在新歌单、专辑界面增加滚动到当前歌曲按钮 ([ee8704d](https://github.com/yiktllw/XCMusic/commit/ee8704d7408455f7246cab51f125e084d5c3a1d0))


### Bug Fixes

* 修复“下一首播放”功能的异常 ([a543425](https://github.com/yiktllw/XCMusic/commit/a543425626d39080bae138544e482aa86ea1be32))
* 修复背景颜色异常 ([4b9051c](https://github.com/yiktllw/XCMusic/commit/4b9051caf7fddab99c2a46a917c087008ee4d8db))
* 修复播放界面切歌时封面比例不同导致的跳动；修改注释 ([b811f7d](https://github.com/yiktllw/XCMusic/commit/b811f7de5c505189096606fcb435f97df408d7d3))
* 修复部分矢量图在某些设备显示异常的问题 ([3e8b99b](https://github.com/yiktllw/XCMusic/commit/3e8b99b557a8057874d01ffc4fba48171e914f2b))
* 修复歌词中的作曲家等信息可能超出单行长度的问题 ([4715af9](https://github.com/yiktllw/XCMusic/commit/4715af966214b86664f79464658e63e48f296d4a))
* 修复歌单界面、专辑界面骨架屏显示问题 ([2631c5f](https://github.com/yiktllw/XCMusic/commit/2631c5f6430636ae02f57965e314580edf2034cd))
* 修复歌单界面布局问题 ([bf031c3](https://github.com/yiktllw/XCMusic/commit/bf031c309ae867522bdb3365e4f38f2f894d6da4))
* 修复列表随机的bug ([34dfd79](https://github.com/yiktllw/XCMusic/commit/34dfd79bb1e3bbb9cb98d680830ff85f32f04825))
* 修复输出搜索时可能不显示搜索面板的bug ([d0c4b28](https://github.com/yiktllw/XCMusic/commit/d0c4b2873749bf5690c124b6a57c944a2698560f))
* 修复新歌单中，专辑按钮的翻译部分无法点击的问题 ([aadad1b](https://github.com/yiktllw/XCMusic/commit/aadad1b252c3db872109548dd427dc0c9ac68b3e))
* 修复音乐云盘可能一直加载的问题([#11](https://github.com/yiktllw/XCMusic/issues/11) , [#13](https://github.com/yiktllw/XCMusic/issues/13)) ([a7006f4](https://github.com/yiktllw/XCMusic/commit/a7006f442b2c885d692e6c1ce8e3c86cafaef8ad))
* 修复英文的设置界面排版问题 ([f81dc10](https://github.com/yiktllw/XCMusic/commit/f81dc100e75dd546a407cdd30e6cfa4881fedc1b))
* 修复云盘歌曲的歌曲信息界面异常 ([07a0d7a](https://github.com/yiktllw/XCMusic/commit/07a0d7a5a115c043e25a8d00033f6ceef20f88f7))
* 修复专辑界面显示问题 ([ec3ad50](https://github.com/yiktllw/XCMusic/commit/ec3ad50309d22ea658c6cc8c78cf36327ab9d79e))
* 修复专辑界面reel文本溢出时的显示问题 ([7db7c81](https://github.com/yiktllw/XCMusic/commit/7db7c81a25974f6a096defaca12f4c2f4ccf1215))
* 修正搜索界面的文本 ([35c043b](https://github.com/yiktllw/XCMusic/commit/35c043b0a2ff3a0f3400db09292f04bb376f39af))
* 修正文本错误（编辑歌单信息窗口） ([f391ca6](https://github.com/yiktllw/XCMusic/commit/f391ca6c0776de0dc2b585dc5785fe952c020c4f))
* fix proxy settings ([80f3948](https://github.com/yiktllw/XCMusic/commit/80f39480cfa9018f82592aa0702baf92f2623101))

### 0.2.9 (2025-01-18)


### Features

* 实现设置代理 ([a19333c](https://github.com/yiktllw/XCMusic/commit/a19333c2245441273ed4ad789e14fbadbd0f85bd))
* 实现下载全部云盘歌曲 ([b50a119](https://github.com/yiktllw/XCMusic/commit/b50a119b02eb8bd937a563587b4789930c533003))
* 收藏的专辑界面添加加载动画 ([d21f699](https://github.com/yiktllw/XCMusic/commit/d21f699526b66c6c1a7d082e3b9dc4f741913378))
* 添加云盘下载当前页功能 ([533cf96](https://github.com/yiktllw/XCMusic/commit/533cf9672d6530bfeaef13cc4198b30af581dc57))
* 为本地音乐界面实现加载动画 ([d8ba630](https://github.com/yiktllw/XCMusic/commit/d8ba630b827534c6d71c58c0b8e1a3cc26a26a38))
* 为搜索界面添加加载动画 ([26a6142](https://github.com/yiktllw/XCMusic/commit/26a6142e55cf79869e82d388eb3c2fdf6fa1e0de))
* 为下载界面添加加载动画 ([d58cee9](https://github.com/yiktllw/XCMusic/commit/d58cee9d0f1764984c316a8c85befc289d8d9da0))
* 下载时添加元数据(封面和lrc歌词) ([49c4df6](https://github.com/yiktllw/XCMusic/commit/49c4df66003c77407545b2d1acdf9edca27da45f))
* 新增点击云盘下载按钮的调试信息 ([6138e23](https://github.com/yiktllw/XCMusic/commit/6138e236d85af8ea32726bb01a376c4ba70f2594))
* 修改音乐云盘单页歌曲数为100 ([7cafa0c](https://github.com/yiktllw/XCMusic/commit/7cafa0c8963d1d57236b4547426e2c6d45ce18de))
* 云盘界面增加加载动画 ([25a00ee](https://github.com/yiktllw/XCMusic/commit/25a00eee018e0802a59dc0424a99cefbb5975312))

### Bug Fixes

* 修复关闭播放界面时，歌词提前消失的bug ([b264faa](https://github.com/yiktllw/XCMusic/commit/b264faa6baf296dacb29e3247c20f28f0c7ce5bb))
* 修复设置界面滚动时导航栏不更新的错误 ([e0cf611](https://github.com/yiktllw/XCMusic/commit/e0cf61128f0bd7675a7ba67c4691f3cf73d8deec))
* 修复无法从歌单中删除歌曲的bug ([036a073](https://github.com/yiktllw/XCMusic/commit/036a073f05d7830768a7b2731d2a76ac159b625d))
* 修复音量均衡默认不开启的问题 ([e0f53ad](https://github.com/yiktllw/XCMusic/commit/e0f53ad3725db801d7a0666bd01d37665f5fb300))
* 修复右键菜单的下载功能失效的问题 ([767b1a5](https://github.com/yiktllw/XCMusic/commit/767b1a5168660d484275d473d4d873907f8e8be7))
* 修正本地文件缺失提示的文本错误 ([e384f66](https://github.com/yiktllw/XCMusic/commit/e384f66a8ef7523792ed74621f15ab6cfeb9ae84))

### [0.2.8](https://github.com/yiktllw/XCMusic/compare/v0.2.7...v0.2.8) (2024-12-01)


### Features

* 柔化部分svg图片 ([825d6f1](https://github.com/yiktllw/XCMusic/commit/825d6f1c038a7849b0e87e243994718b3603a99b))
* 实现收藏专辑和歌单 ([a88d7b2](https://github.com/yiktllw/XCMusic/commit/a88d7b2198bed5c41fb917cb6508e59fa57c3b1a))
* 为音乐云盘界面设置背景颜色 ([3e39a8e](https://github.com/yiktllw/XCMusic/commit/3e39a8ebf971c1389bf466b6662e0ccf95c5ac70))
* 优化播放列表的显示速度 ([4ef372c](https://github.com/yiktllw/XCMusic/commit/4ef372c515e87e012abb48e51ae9d2d333a84afd))
* 优化内存: 限制媒体缓存大小和磁盘缓存大小 ([ce88f2a](https://github.com/yiktllw/XCMusic/commit/ce88f2a653d03b5488703ceb3e74fb68d4fbbcd0))
* 在播放列表图标上显示播放列表的数量 ([0cf077b](https://github.com/yiktllw/XCMusic/commit/0cf077bb1c934dfafcf1dd182a970d8416fd8c03))
* 支持使用tauri后端(前端暂未适配) ([be4f16a](https://github.com/yiktllw/XCMusic/commit/be4f16a16846ad3885c72fb24112ca6c9fb8eca4))
* 重新组织设置-关于，为设置-硬件-GPU加速添加注释 ([3bb94ca](https://github.com/yiktllw/XCMusic/commit/3bb94ca496a98a73016b806243e04d5753532db8))


### Bug Fixes

* 修复切换到云盘歌曲时，歌词不刷新的bug ([adbad34](https://github.com/yiktllw/XCMusic/commit/adbad348a6bb58f7bc0286022d1ee99301d247ca))
* 修复音量均衡默认不启用的问题 ([6b6c2dd](https://github.com/yiktllw/XCMusic/commit/6b6c2dd57c64144180c2db02cc3e0365e3be3bc7))
* 修复逐字歌词第二行进度异常的问题 ([501a752](https://github.com/yiktllw/XCMusic/commit/501a752f4a674cf70ab73392b695c31682605fff))
* 修复逐字歌词闪烁的bug ([b56377b](https://github.com/yiktllw/XCMusic/commit/b56377b4293b5a936afed98fe7d89fb93c844ac6))
* 修复逐字歌词有时失效的bug ([617c724](https://github.com/yiktllw/XCMusic/commit/617c7240b5aa338fa4d91c1ae639221925111d15))
* 修复web端无法播放音频的问题 ([a65beb3](https://github.com/yiktllw/XCMusic/commit/a65beb37c73d7b0a41894bf671a17ed08a3f7e50))

### [0.2.7](https://github.com/yiktllw/XCMusic/compare/v0.2.6...v0.2.7) (2024-11-22)


### Features

* 删除歌曲后刷新歌单 ([34731f4](https://github.com/yiktllw/XCMusic/commit/34731f45e8a44192b09921789d7a0f0df60374e0))
* 实现查看音乐云盘的歌曲 ([1493b68](https://github.com/yiktllw/XCMusic/commit/1493b68a50c0d9c745189eee063cf1a68107f95c))
* 添加音乐云盘api ([2437919](https://github.com/yiktllw/XCMusic/commit/24379196d1dab4be667e2db8fad7a50e6c3decad))
* 统一下载界面和本地音乐界面的样式 ([900fcad](https://github.com/yiktllw/XCMusic/commit/900fcadfcddfab358702a68dd39751d9f12fbab0))
* 优化播放界面的进入和退出动画 ([d1351c8](https://github.com/yiktllw/XCMusic/commit/d1351c80c1f0c35924f4d3cc44308da3b407fde6))
* 优化侧边栏按钮显示 ([f6ec55b](https://github.com/yiktllw/XCMusic/commit/f6ec55bd28c7c6766198917a7c0768754c7db366))
* 优化分页按钮样式 ([e738f8d](https://github.com/yiktllw/XCMusic/commit/e738f8d8e0a040c56819354847972c4dbbfeb976))
* 在生产环境下禁用控制台输出 ([7ace22c](https://github.com/yiktllw/XCMusic/commit/7ace22cd589fca9687ae61c6516e1391c8e1ddc4))


### Bug Fixes

* 修复: 设置-外观-侧边栏不会自动换行的bug ([86bc7d3](https://github.com/yiktllw/XCMusic/commit/86bc7d3cc7fddce861017ad64720f43ef12f466a))
* 修复点击播放栏的喜欢按钮时，状态不会立刻更新的bug ([5084ee6](https://github.com/yiktllw/XCMusic/commit/5084ee6e2a0ab049a2318d70aa396f6db5b5684b))
* 修复歌词消失的bug ([c0bd7fa](https://github.com/yiktllw/XCMusic/commit/c0bd7faf09bd6fb7846aeb08db85e0ab375807c1))
* 修复禁用GPU加速时的性能问题 ([e06284e](https://github.com/yiktllw/XCMusic/commit/e06284e238f437347b5f589e955ac07e2896d972))
* 修复没有歌词时，不会自动切换歌词的bug ([39bd3c7](https://github.com/yiktllw/XCMusic/commit/39bd3c7c77be61452df897b5a3ba38c7a0f45312))
* 修复无法从歌单中删除歌曲的bug ([036a073](https://github.com/yiktllw/XCMusic/commit/036a073f05d7830768a7b2731d2a76ac159b625d))

### [0.2.6](https://github.com/yiktllw/XCMusic/compare/v0.2.5...v0.2.6) (2024-11-19)


### Features

* 实现设置-常规-禁用GPU加速 ([0ecf9f3](https://github.com/yiktllw/XCMusic/commit/0ecf9f39595fd8a1dd674536dcbb49370bc6b9fc))
* 使评论按钮更容易点击 ([1ac018a](https://github.com/yiktllw/XCMusic/commit/1ac018ad54607383f93a16312c591d82ebc7b041))
* 为收藏的专辑、下载、本地、关于界面添加背景颜色 ([8ca609e](https://github.com/yiktllw/XCMusic/commit/8ca609e68679a2fcb757da538988b46a07e23b28))
* 新增没有百科内容时的文字 ([db0fd30](https://github.com/yiktllw/XCMusic/commit/db0fd3038149637817df27860a2fe94843083133))
* 新增没有歌词的文字 ([25b9966](https://github.com/yiktllw/XCMusic/commit/25b996681958736c6f3bc12f1d7d66b267c91d09))
* 修改亮色时，背景颜色的变化程度 ([fe4878f](https://github.com/yiktllw/XCMusic/commit/fe4878fdb175816c83859133b43bb1a427fc8dc9))
* 优化歌词样式，更改默认窗口大小 ([984ee74](https://github.com/yiktllw/XCMusic/commit/984ee74fb482dd7d0c25ab32057c25fa24ad582d))
* 优化进度条动画 ([069fe93](https://github.com/yiktllw/XCMusic/commit/069fe936f39cf9ebd3b11b4d62a16e465060b338))
* 在重新打开歌词时，自动设置缩放 ([a2e296e](https://github.com/yiktllw/XCMusic/commit/a2e296e0efe630287c2c42930d2eb3900c00d8aa))


### Bug Fixes

* 内存优化 ([d660cdd](https://github.com/yiktllw/XCMusic/commit/d660cdd766e76b505ff2bd6ef551c918a184891b))
* 修复导入已下载歌曲信息后，重启程序失效的问题 ([fda1658](https://github.com/yiktllw/XCMusic/commit/fda1658bb4f8eeb730275d5dc5ff71804f43bf19))
* 修复歌曲右键菜单图标错误 ([0efa8fe](https://github.com/yiktllw/XCMusic/commit/0efa8fe87c16846a5be4b5539e60468b2239d24c))
* 修复评论界面中，跳转到另一个评论时不自动刷新数据的bug，加载评论时显示动画 ([b6fbf93](https://github.com/yiktllw/XCMusic/commit/b6fbf93f6701899f1173d5cd50b2eb68f971e1d5))
* 修复搜索内容过长时，历史显示异常的but ([2ac0cad](https://github.com/yiktllw/XCMusic/commit/2ac0cad60654ee3ca4220ee574de7100bff23754))
* 修复在没有设置缩放时，无法显示歌词的bug ([1f99589](https://github.com/yiktllw/XCMusic/commit/1f99589cefe00a4d076543d85a426ced088a983e))

### [0.2.5](https://github.com/yiktllw/XCMusic/compare/v0.2.4...v0.2.5) (2024-11-16)


### Features

* 实现纯js的逐字歌词 ([1349f29](https://github.com/yiktllw/XCMusic/commit/1349f291b1046fde14566c2ce347f63ed067873d))
* 实现鼠标平滑滚动歌词 ([af8273e](https://github.com/yiktllw/XCMusic/commit/af8273ec52709ae417493c5362bfb6908eea2034))
* 用纯js+canvas重写歌词(逐行) ([9da4d92](https://github.com/yiktllw/XCMusic/commit/9da4d9292643aa924fdf45dbeafa650872b248b2))
* 优化播放界面的进度条控制 ([9915ca2](https://github.com/yiktllw/XCMusic/commit/9915ca2d4abb5c31e73b821ccd4864306ffd86cc))
* 优化播放界面显示效果 ([6e7b0e4](https://github.com/yiktllw/XCMusic/commit/6e7b0e45e0fe4a090a6efa87744364cde390d762))
* 优化播放列表的启动 ([1a71b8f](https://github.com/yiktllw/XCMusic/commit/1a71b8fe09d7bf38e441d96ae2d95fab8352285f))
* 优化侧边栏-右键菜单的api调用速度 ([db361ff](https://github.com/yiktllw/XCMusic/commit/db361ff57ab4f0172aeda9404794b844ec46e046))
* 优化设置页面动画 ([a6f3762](https://github.com/yiktllw/XCMusic/commit/a6f37620be79cff0b8ad081407b0abf4b6d0c435))
* 优化搜索-歌词的显示效果 ([36dc66b](https://github.com/yiktllw/XCMusic/commit/36dc66b70d113ccdc1d0467a99979e59998ecce2))
* 优化搜索界面显示效果 ([b9da25c](https://github.com/yiktllw/XCMusic/commit/b9da25c8da4a13c3d2df63040b5afb18b50892a7))
* 优化音量均衡功能 ([0551756](https://github.com/yiktllw/XCMusic/commit/0551756ad3f4ad49502cd87e51bda1f3b55a2e0e))
* 优化用户界面显示效果 ([dda9e56](https://github.com/yiktllw/XCMusic/commit/dda9e5632d1fd025916f25de8a5ead0448d4e7a6))
* 在用户操作时，中断歌词自动滚动 ([a86c51e](https://github.com/yiktllw/XCMusic/commit/a86c51e04a1c3a54622c486a8e0a2852d88e6a4f))
* 只绘制可见范围内的歌词 ([1a6310e](https://github.com/yiktllw/XCMusic/commit/1a6310ecc1809852ae627245302ef55eb120269b))


### Bug Fixes

* 启动时，添加1.6秒的开始播放延迟，以解决音频不稳定问题。 ([bea7081](https://github.com/yiktllw/XCMusic/commit/bea70814ef7995ece95c08e31392d2f4f40cf466))
* 修复开机自启动失效问题 ([1774507](https://github.com/yiktllw/XCMusic/commit/17745074440e278af2a4fd9eab08d82e5ac769bb))
* 修复了搜索歌单时，处理云盘歌曲的错误 ([8aac369](https://github.com/yiktllw/XCMusic/commit/8aac3690a9c285220dddc8538cab9c869f147db5))
* 修复清空搜索时，仍然有搜索建议的bug ([a131308](https://github.com/yiktllw/XCMusic/commit/a1313081f0efccb4192fcaf0059aab96f0ff3c0f))
* 修复搜索时，猜你想搜索结果为空引发的错误 ([559e087](https://github.com/yiktllw/XCMusic/commit/559e0873993293a0790b412a166c22f9facc4979))
* 修复在设置界面打开播放界面时的显示异常 ([b4c9253](https://github.com/yiktllw/XCMusic/commit/b4c9253781be5cb7750e9573920d95c92ba08047))
* 修复自定义主题界面不能正确获取强调色和字体颜色预设异常的bug ([f37b14c](https://github.com/yiktllw/XCMusic/commit/f37b14c7d4ee127522f96c72a6d0863bd1d292e3))
* 修复自动播放失效的问题 ([b85fb2a](https://github.com/yiktllw/XCMusic/commit/b85fb2af07c046e2368160fd46bcebadfe16cf05))
* typo ([138584c](https://github.com/yiktllw/XCMusic/commit/138584cd924f2dd54896ffd813f4a3ed2296105b))

### [0.2.4](https://github.com/yiktllw/XCMusic/compare/v0.2.3...v0.2.4) (2024-11-13)


### Features

* 更改yikt主题的颜色 ([c12f9f8](https://github.com/yiktllw/XCMusic/commit/c12f9f8dad248bfb1a8b2e61b26784214fceb46e))
* 将列表随机的图标颜色更改为强调色 ([7f00140](https://github.com/yiktllw/XCMusic/commit/7f0014062bf4fced8a3bf92d36bd578c8d6ef33f))
* 禁用所有按钮与tab的交互 ([771a2d8](https://github.com/yiktllw/XCMusic/commit/771a2d8f331af257fca21dbbb43b0f484bc36ecc))
* 实现导入、导出已下载歌曲信息 ([ab5e43d](https://github.com/yiktllw/XCMusic/commit/ab5e43db42dd3ad160b65698fdb3e0e8cebcc38a))
* 添加歌单右键菜单的提示 ([8aba7e0](https://github.com/yiktllw/XCMusic/commit/8aba7e0c3f4d4af5df18b7271973b7a9aae8aba9))
* 新增: 设置-关于-作者的github链接； ([83bd9a6](https://github.com/yiktllw/XCMusic/commit/83bd9a634c7f9bffa4894d598f1ebf5e10f4f3b1))
* 新增: 设置-外观-在侧边栏隐藏的功能 ([f16ad9f](https://github.com/yiktllw/XCMusic/commit/f16ad9f75ad2b111d9b72db9c86e7c3675b5136e))
* 优化设置界面背景颜色 ([b7e7360](https://github.com/yiktllw/XCMusic/commit/b7e7360760eb046afcac26d511fe2f58d9cd62a6))
* 优化设置页面交互 ([3d116c0](https://github.com/yiktllw/XCMusic/commit/3d116c00cfcc0daf5ad803ade5585655f9887f5b))
* 增强搜索栏的交互效果 ([ce72813](https://github.com/yiktllw/XCMusic/commit/ce7281340cc6c8e7b520d8af69d1bbc39daad19c))
* 自定义主题: 实现粘贴颜色 ([bad00cf](https://github.com/yiktllw/XCMusic/commit/bad00cf2746a469dab84d9c67adad42dfa619788))


### Bug Fixes

* 修复登录时不会马上显示用户名和头像的bug ([5ad4e92](https://github.com/yiktllw/XCMusic/commit/5ad4e92e49dada4e2db58778d96ed01f34d9f96c))
* 修复登录时用户名没有显示的bug；优化性能 ([87986ab](https://github.com/yiktllw/XCMusic/commit/87986abd53d377c3f94c34a88976db17ad696c9a))
* 修复亮色主题下，喜欢图标颜色异常的bug ([9a7fabc](https://github.com/yiktllw/XCMusic/commit/9a7fabc08159bd010571005ee35160ece083de92))
* 修复设置背景颜色错误 ([5a0edc2](https://github.com/yiktllw/XCMusic/commit/5a0edc26cfa01636a314c1637607dc75a551b9da))
* 修复生产环境下无法获取自定义主题预设的问题 ([1f2c515](https://github.com/yiktllw/XCMusic/commit/1f2c5155a2c72144ed9591d47ce125c4af1c80f9))

### [0.2.3](https://github.com/yiktllw/XCMusic/compare/v0.2.2...v0.2.3) (2024-11-11)

### Features

- 更新主页图片 ([839b641](https://github.com/yiktllw/XCMusic/commit/839b6419298f16b3baf0f944e544c498f6bb5f0c))
- 实现编辑歌单信息 ([420423e](https://github.com/yiktllw/XCMusic/commit/420423e4595e3b541be09d210adff1a06224dfed))
- 实现导入、导出设置为JSON文件 ([93210ea](https://github.com/yiktllw/XCMusic/commit/93210eab217a8c437d683d2ab8d6e90dae0ee9ae))
- 实现开机自启动功能(win & mac) ([39cedf5](https://github.com/yiktllw/XCMusic/commit/39cedf5879229ae9cf893ef997e5821f6542cfd3))
- 实装歌单界面的下载按钮和右键菜单的下载歌单 ([40f2cfe](https://github.com/yiktllw/XCMusic/commit/40f2cfeeaaf029f642022a3290bb39c46bc51dcd))
- 收藏的专辑界面固定为主题色 ([35246f2](https://github.com/yiktllw/XCMusic/commit/35246f2305ad1dec84c06b1cff7d19203577c1e6))
- 为本地音乐界面实现加载动画 ([d8ba630](https://github.com/yiktllw/XCMusic/commit/d8ba630b827534c6d71c58c0b8e1a3cc26a26a38))
- 为设置-下载-本地路径添加有效性检查 ([b6605f3](https://github.com/yiktllw/XCMusic/commit/b6605f36a7f0312fd24d9190f7a9cc8f23c2ddce))
- 为右键菜单阻止默认行为(网页端) ([9febc0b](https://github.com/yiktllw/XCMusic/commit/9febc0b0e4ca381a507a764140a56e3f0ca2bd67))
- 新增: 设置-播放-启动时自动播放 ([f7c14a0](https://github.com/yiktllw/XCMusic/commit/f7c14a08f75d86c86acb94e42c1e0f40f5949ad5))
- 新增下载管理界面 ([e3bd7a2](https://github.com/yiktllw/XCMusic/commit/e3bd7a2b0c82846b01b764e0c54d70922b859453))
- 新增字符串生成颜色方法 ([3ad9dde](https://github.com/yiktllw/XCMusic/commit/3ad9ddec2692ea4b17e01fb15f3d4edb17bc83a0))
- 优化自定义主题界面显示；删除不必要的组件 ([97dbd33](https://github.com/yiktllw/XCMusic/commit/97dbd330cb0825a50b0367a34c216d0745bab445))
- 优化markdown显示效果，更新README.md ([3f847fb](https://github.com/yiktllw/XCMusic/commit/3f847fbfe2cd653c9155d26ecba45bb44d69d0ec))
- 在后端添加下载进度监控功能；添加注释 ([190a750](https://github.com/yiktllw/XCMusic/commit/190a75071e8d8821c27849a445cdfe4ca44af0c2))
- 自定义主题时，可以从文字获取颜色 ([f99d793](https://github.com/yiktllw/XCMusic/commit/f99d79354c5bfbaf44e235bc3d605ccbf71b9700))
- 自定义主题时可以选择所有系统主题作为预设 ([cf256e9](https://github.com/yiktllw/XCMusic/commit/cf256e9da3f7b0967c9032fcf3fc87e01c3f557d))

### Bug Fixes

- 修复评论界面异常 ([1257348](https://github.com/yiktllw/XCMusic/commit/12573483d296a90af8df318f43646e372d6c4286))
- 修复收藏的专辑界面跳转错误 ([4e1faa2](https://github.com/yiktllw/XCMusic/commit/4e1faa2c7df9790b6ecb161bbda367a0f83d2ca2))
- 修复主题色相关错误 ([61a850f](https://github.com/yiktllw/XCMusic/commit/61a850fc07a997f09c96e565e5d6e48511f18518))
- 修复专辑界面reel信息丢失 ([fa4142c](https://github.com/yiktllw/XCMusic/commit/fa4142c60aff3e514d4a97e1005831e648884d4e))

### [0.2.2](https://github.com/yiktllw/XCMusic/compare/v0.2.1...v0.2.2) (2024-11-10)

### Features

- 本地音乐界面显示已添加的文件夹 ([9b35f20](https://github.com/yiktllw/XCMusic/commit/9b35f2065a94723d94f0b6a1972a212c59d1d5e2))
- 禁用播放列表的滚动动画；在获取音量均衡数据时，不再获取所有数据，而是standard和当前音质的数据。 ([6f9d47c](https://github.com/yiktllw/XCMusic/commit/6f9d47c9e1b5b4c510379951a1f3fc741c30456c))
- 实现自定义强调色 ([21b2f02](https://github.com/yiktllw/XCMusic/commit/21b2f02021445ee25af90a6246c7e1c72dc6f078))
- 为SongsTable启用懒加载 ([9980dcd](https://github.com/yiktllw/XCMusic/commit/9980dcd257931b724833cfa446d8b00826af3f11))
- 新增: 设置-下载-本地路径 ([cecd940](https://github.com/yiktllw/XCMusic/commit/cecd940d0afe2b536a54f0b916c6a80360dd0012))
- 新增本地路径无效时的错误处理 ([f1f31a3](https://github.com/yiktllw/XCMusic/commit/f1f31a38120e5ee98d7adf180cb6dacc8cc21e4f))

### Bug Fixes

- 消除key造成的内存泄漏 ([a768df2](https://github.com/yiktllw/XCMusic/commit/a768df2cf5349b1a93df8cf5f3f5a8ae0d41f6b6))
- 新增解决依赖冲突的babel_cmds.js ([cd78b87](https://github.com/yiktllw/XCMusic/commit/cd78b87860aacdf6332da7d09d73aa273e6d1ea8))
- 修复本地音乐错误 ([e39fe15](https://github.com/yiktllw/XCMusic/commit/e39fe15feddd78fec53399e3f3305523938effad))
- 修复播放列表没有删除按钮的问题 ([78cd94f](https://github.com/yiktllw/XCMusic/commit/78cd94fa7112ba6f096328933ab447889d35f8ed))
- 修复图片懒加载造成的内存泄漏 ([c02d070](https://github.com/yiktllw/XCMusic/commit/c02d070d6304b1b337b423a298c25c05796bb7b4))
- 修复主题不存在时的panic，修复若干小错误 ([4d0ae3f](https://github.com/yiktllw/XCMusic/commit/4d0ae3fc66730447f5b07b2a035ed8f1678dc1b6))
- 修复自定义暗色主题的字体颜色错误 ([c9f043c](https://github.com/yiktllw/XCMusic/commit/c9f043cf4d19c5a49bf238dae5ef0abee9e4c8d0))
- 修复anonymous_token相关错误 ([8ec616d](https://github.com/yiktllw/XCMusic/commit/8ec616dc265c95696d4166a7de2ae1a97bde4394))

### [0.2.1](https://github.com/yiktllw/XCMusic/compare/v0.2.0...v0.2.1) (2024-11-06)

### Features

- 创建主题时可以选择预设 ([f2ecdfb](https://github.com/yiktllw/XCMusic/commit/f2ecdfb3c87fccafb216394ddc0a9a81a4e78bea))
- 弹出窗口时背景模糊 ([3adae7d](https://github.com/yiktllw/XCMusic/commit/3adae7d01d542246032aa6a9249f86ddcddda940))
- 实现自定义主题功能 ([8ee708b](https://github.com/yiktllw/XCMusic/commit/8ee708b53955396ec9cf7a809c6b5b858ace1a51))
- 添加歌单右键菜单，实现删除歌单，实现确认窗口 ([38712f6](https://github.com/yiktllw/XCMusic/commit/38712f6875befb05bd14392d814e894b14aa3e2b))
- 新增: 关闭时询问窗口 ([4a2cb16](https://github.com/yiktllw/XCMusic/commit/4a2cb16a767baf6656fff2f8b4856289c1529afd))
- 新增: 设置-外观-全屏时自动缩放 ([fc14b63](https://github.com/yiktllw/XCMusic/commit/fc14b632f990570ea82988abf522baa73c3a8865))
- 新增音频调试界面 ([6ef16f0](https://github.com/yiktllw/XCMusic/commit/6ef16f07e876f1fd38da882e490934233d9ce2b0))
- 新增Dracula主题 ([e27ec08](https://github.com/yiktllw/XCMusic/commit/e27ec08b0b3f6b4643c8b8fa6450f6908071848c))
- 优化自定义主题界面 ([0f1a2c2](https://github.com/yiktllw/XCMusic/commit/0f1a2c23c0cf146f6b661847f9e179b25385c1af))
- 暂停状态下自动重载链接 ([8f7452f](https://github.com/yiktllw/XCMusic/commit/8f7452f988954ee59572638312efe7d9cce88cc0))
- 只允许运行一个实例 ([c56d0db](https://github.com/yiktllw/XCMusic/commit/c56d0dbea0dca6f8a69d7e33405b2b113eab2329))

### Bug Fixes

- 修复播放界面中，从歌曲信息打开歌手/专辑时，不会自动关闭播放界面的bug ([2775699](https://github.com/yiktllw/XCMusic/commit/27756991d3289fcab8e888e49b87ac1aaaebff53))
- 修复播放时间更新错误 ([435e3a7](https://github.com/yiktllw/XCMusic/commit/435e3a7c97df5a1a2cf0f103d79ba2ce45133277))
- 修复设置界面的选项错误 ([ea82bde](https://github.com/yiktllw/XCMusic/commit/ea82bde54f2abefbcc2a231b858e77204a1d5151))
- 修复重载url的错误 ([8519f0e](https://github.com/yiktllw/XCMusic/commit/8519f0e367f5a80836e5b74dc24dc20954414a7c))

## [0.2.0](https://github.com/yiktllw/XCMusic/compare/v0.1.4...v0.2.0) (2024-10-30)

### Features

- 初步实现频谱图 ([5762f94](https://github.com/yiktllw/XCMusic/commit/5762f945a41d726fa2e08b5f740bdd6e3b7bea33))
- 更新欢迎界面 ([6bc7846](https://github.com/yiktllw/XCMusic/commit/6bc784684fdb1c3e2aa2e6c1ffca596f49e7ca7e))
- 更新api到4.24.0 ([a8fd4a8](https://github.com/yiktllw/XCMusic/commit/a8fd4a83aa1b6693e2d5c7e2af9bf9b20efa98d5))
- 可以点击搜索图标搜索 ([3bfc24f](https://github.com/yiktllw/XCMusic/commit/3bfc24fdfe277eb5a8499ae98f11587dcf279d7e))
- 实现播放本地音乐 ([1615fec](https://github.com/yiktllw/XCMusic/commit/1615fec2b6e232be2bb626bb036450562f18d7ce))
- 实现创建歌单功能，修改登录窗口样式 ([a741434](https://github.com/yiktllw/XCMusic/commit/a7414345f631f7ea30ddeae74c4c74004fc55a7e))
- 添加本地音乐页面(未实装) ([5c1a619](https://github.com/yiktllw/XCMusic/commit/5c1a6196cdcdd1f6d9caeadf242b82e61034cd9c))
- 添加创建歌单按钮(未实装) ([a79beb5](https://github.com/yiktllw/XCMusic/commit/a79beb53ff1965bec98abe2887104b5cdf337ccc))
- 为频谱图添加高通和低通滤波器 ([71a7e1e](https://github.com/yiktllw/XCMusic/commit/71a7e1ebd64bd4dbd73f2cfc53b8eec031d12477))
- 新增: 歌曲信息-文件路径； 调整视觉效果 ([128b02e](https://github.com/yiktllw/XCMusic/commit/128b02e5dea6148e8f26a9c22933a0f2f24e629e))
- 新增: 设置-播放-开关频谱图 ([ffd241e](https://github.com/yiktllw/XCMusic/commit/ffd241ee22c25f7fbc61f002b587919799d4ccf9))
- 新增: 设置-常规-关闭按钮行为 ([1e7971e](https://github.com/yiktllw/XCMusic/commit/1e7971e1de18c54e25bb90c5e200b7846ddfa028))
- 新增: 设置-常规-重载窗口 ([915ed50](https://github.com/yiktllw/XCMusic/commit/915ed505e2b0c13b289112f4332de9ca44bb7ff4))
- 新增本地音乐-下载的音乐 ([fd2a660](https://github.com/yiktllw/XCMusic/commit/fd2a66054c2d41a5fc7b0477bcc44cc7c91bef38))
- 新增侧边栏-我喜欢的音乐，侧边栏-收藏的专辑，侧边栏-本地音乐(未实现对应页面) ([2f1e146](https://github.com/yiktllw/XCMusic/commit/2f1e14611e3b131cf97c7aa74acd3e44ff3f8c37))
- 新增收藏的专辑页面 ([806e6d7](https://github.com/yiktllw/XCMusic/commit/806e6d7d769ce3552a1d183da2157f2874a8281d))
- 修改欢迎页面样式，点击logo跳转到欢迎页面。 ([8a0ce72](https://github.com/yiktllw/XCMusic/commit/8a0ce72e184466423e90596e375243e022960677))
- 修改音质选择样式 ([690460c](https://github.com/yiktllw/XCMusic/commit/690460c35f491c7d6106b9dad0118eaff11d0ca2))
- 修改page样式 ([d25e568](https://github.com/yiktllw/XCMusic/commit/d25e5680a02dc197adfbd14ed7ac1abee751c48c))

### Bug Fixes

- 尝试修复player无限触发下一首的错误 ([b0dc4f4](https://github.com/yiktllw/XCMusic/commit/b0dc4f44f3eb9eef8f31092bc6760c42659fe502))
- 修复4.24.0api的歌曲增益为0的问题 ([17f7f24](https://github.com/yiktllw/XCMusic/commit/17f7f24c188867f8543ad37637710eecc863f6d0))
- 修复部分图标可拖动，部分文本可选中的问题 ([c7bbb50](https://github.com/yiktllw/XCMusic/commit/c7bbb5093acbe0cb7a58402dbfc292e18811a91a))
- 修复评论界面的分页按钮显示错误 ([cfd3fb9](https://github.com/yiktllw/XCMusic/commit/cfd3fb9c565acd4dbccd153c25b1f9ef19486cc7))
- 修复音量均衡可能失效的问题 ([873bde4](https://github.com/yiktllw/XCMusic/commit/873bde4d277cce067b5ad20b859662f695e480be))
- 修复音频链接过期无法自动重新加载的问题 ([e381ac6](https://github.com/yiktllw/XCMusic/commit/e381ac6533a5590ddd90d4aaad1cea76b11852e7))
- 修复player中的fs和path错误 ([48fce4b](https://github.com/yiktllw/XCMusic/commit/48fce4b80017371b18113c2d7d13ca0c311a97eb))

### [0.1.4](https://github.com/yiktllw/XCMusic/compare/v0.1.3...v0.1.4) (2024-10-21)

### Features

- 可以使用方向键滚动曲谱 ([0a68861](https://github.com/yiktllw/XCMusic/commit/0a68861570a4482f42db0d0b9d425669de07ada8))
- 实现查看曲谱 ([e3fbd5a](https://github.com/yiktllw/XCMusic/commit/e3fbd5a8df83739cfbbdc6d953effe2c872735ca))
- 实现查看用户关注、粉丝 ([eeb6bc7](https://github.com/yiktllw/XCMusic/commit/eeb6bc71a3eefbcce5c3cedf7f87f2da529112e5))
- 实现选择输出设备(与音量均衡功能有冲突) ([537584b](https://github.com/yiktllw/XCMusic/commit/537584b61366f69b8ed3ba121debb453fedfdecf))
- 新增: 设置-关于-变更日志；设置-关于-介绍 ([22a32e2](https://github.com/yiktllw/XCMusic/commit/22a32e218c3105b22b46704576afb308e023e49c))
- 新增关注/粉丝界面分页功能 ([2fcc859](https://github.com/yiktllw/XCMusic/commit/2fcc859bf1a1908d50ae639511dd147dd6f10e9b))
- 优化播放栏图标显示效果 ([f6d6cfc](https://github.com/yiktllw/XCMusic/commit/f6d6cfcf380a8d9caeb5dcf6d6e4036bd73d7486))

### Bug Fixes

- 尝试修复部署错误 ([0314a5c](https://github.com/yiktllw/XCMusic/commit/0314a5cc1306177d01eb513498825ca1d4108caa))
- 修复播放界面进度条颜色过浅的问题；修复进度条动画延迟问题 ([3f22bb3](https://github.com/yiktllw/XCMusic/commit/3f22bb310dafb26ed27b19bdbafece1b8c66c43a))
- 修复歌曲滚动动画错误 ([e8b99ec](https://github.com/yiktllw/XCMusic/commit/e8b99ecc96fbb9b3a43af73521d113824779b70f))
- 修复滚动歌词位置错误 ([6c9eb74](https://github.com/yiktllw/XCMusic/commit/6c9eb747311bccbed259d8b30fb0a9dcfc081caa))
- 修复曲谱和百科透明度错误 ([7d99dc8](https://github.com/yiktllw/XCMusic/commit/7d99dc845d81b2fd6080d5f782f7378e3901998d))
- 修复网页端下载功能问题 ([9d03bf0](https://github.com/yiktllw/XCMusic/commit/9d03bf051928ed803264542d903da8c0daf56cb7))
- 修复音量均衡与选择输出设备功能的冲突。 ([25b8fbe](https://github.com/yiktllw/XCMusic/commit/25b8fbec88680ba22299171e966a3c9408822ef0))
- 修复音量面板无法打开的问题 ([648e1ee](https://github.com/yiktllw/XCMusic/commit/648e1eeafe24547b930c4a0a33bf589fe9da8599))
- 修复vercel错误 ([5685c68](https://github.com/yiktllw/XCMusic/commit/5685c683f5a90e0f72c47d5e20e2e9fbe625fe43))
- 修复vercel未捕获错误 ([1197fef](https://github.com/yiktllw/XCMusic/commit/1197fef478d4fcd56d1e22533bac469b6651c124))
- 优化歌词动画 ([b8b7251](https://github.com/yiktllw/XCMusic/commit/b8b7251425d3bea26106c509e16c5c594328e6b3))
- 优化歌词动画，修复歌单搜索bug ([940f541](https://github.com/yiktllw/XCMusic/commit/940f54173a37a1286cc24e0945b05c6e1a86ce7e))
- 优化歌曲动画 ([5bcd86e](https://github.com/yiktllw/XCMusic/commit/5bcd86e989efd82a0150c8c6934e43ff1157fbac))

### [0.1.3](https://github.com/yiktllw/XCMusic/compare/v0.1.2...v0.1.3) (2024-10-18)

### Features

- 当页数大于8时，可以跳转到指定页 ([8e0fa66](https://github.com/yiktllw/XCMusic/commit/8e0fa66cf6d2dfdcbfe62cd233c1f04615e3ba25))
- 根据已下载的歌曲调整界面 ([f312711](https://github.com/yiktllw/XCMusic/commit/f312711e78534ea3bb101a4e8ef1639e22e7b95b))
- 可以在设置中选择下载路径 ([f212a4e](https://github.com/yiktllw/XCMusic/commit/f212a4e198418f9e77c9bb2d8b280844f33d4951))
- 能够删除播放列表的歌曲，重写panel逻辑 ([f54c9fa](https://github.com/yiktllw/XCMusic/commit/f54c9fa3e56333fcf211beaa9687ea19e5644e70))
- 删除搜索内容后自动打开搜索面板 ([5d97d14](https://github.com/yiktllw/XCMusic/commit/5d97d141df08716538ddadb0ac9c9f40e1f30a55))
- 设置界面: 新增下载音质选项 ([090a9b4](https://github.com/yiktllw/XCMusic/commit/090a9b440f53d486f8cee9bc2205c7fec0b8fb2b))
- 实现记忆窗口大小 ([00e08d6](https://github.com/yiktllw/XCMusic/commit/00e08d699fb86087b4073bc475f2f594c6350ba0))
- 实现下载音乐，可以播放下载的音乐 ([bba5778](https://github.com/yiktllw/XCMusic/commit/bba5778e236a26f079b0bc43ab15d14fa7489f9f))
- 实装播放栏的下载按钮 ([b650be6](https://github.com/yiktllw/XCMusic/commit/b650be63459c95519b5257827dd786b4c1d5b805))
- 新增: 设置-关于-版本 ([ae76581](https://github.com/yiktllw/XCMusic/commit/ae76581ea963b2e7a4f7cd475b09806c94b493af))
- 新增设置-关于-源代码 ([260c295](https://github.com/yiktllw/XCMusic/commit/260c295263e9a02574353329c1048bad44ad4bf4))
- 新增设置项: 双击歌单歌曲的行为 ([679aa92](https://github.com/yiktllw/XCMusic/commit/679aa92ff47fb302c0601a2137425fa33c9413eb))
- 在后端实现下载功能 ([edbcd7f](https://github.com/yiktllw/XCMusic/commit/edbcd7ff7e84a441363dab2789cf571b9f3635b6))
- 在设置中实现音量均衡 ([2f6cc65](https://github.com/yiktllw/XCMusic/commit/2f6cc654b4a2240fc5523e47b472bfd11547c2b4))
- 支持删除搜索历史 ([b72abed](https://github.com/yiktllw/XCMusic/commit/b72abed7724404dadd1c2e900196fc998b20dce4))

### Bug Fixes

- 修复侧边栏打开的歌单显示错误 ([8d6bab6](https://github.com/yiktllw/XCMusic/commit/8d6bab6800e894603ea14101049c2da399c8c5b1))
- 修复空白搜索内容引起的错误 ([d88b3bb](https://github.com/yiktllw/XCMusic/commit/d88b3bbae5dd8c79c60ebd66cffe73f763eb322c))
- 修复删除播放列表时自动关闭列表的bug ([4072ead](https://github.com/yiktllw/XCMusic/commit/4072ead2a6306d3f2b4fb42fb5d925885721c343))
- 修复文本错误 ([95ac379](https://github.com/yiktllw/XCMusic/commit/95ac3793984bcf3203b538dda722c5d5372e4b8f))
- 修复用户界面错误 ([d297130](https://github.com/yiktllw/XCMusic/commit/d297130a16eea68222108c01ed096f01fddc62c6))

### [0.1.2](https://github.com/yiktllw/XCMusic/compare/v0.1.1...v0.1.2) (2024-10-14)

### Features

- 实现曲谱预览 ([44c9bb2](https://github.com/yiktllw/XCMusic/commit/44c9bb2f5bc5aad9ae122f61de3f507d8e434a5b))
- 新增播放界面进度条时间提示，优化进度条样式 ([f067b4f](https://github.com/yiktllw/XCMusic/commit/f067b4f38df1c1b9acfd676c272184c208a8ca23))
- 在播放无版权音乐时，跳过到下一首 ([7084158](https://github.com/yiktllw/XCMusic/commit/70841582a1e9b0bebdfd1294c4476fc990709e1f))

### Bug Fixes

- 尝试修复部署错误 ([40b20b3](https://github.com/yiktllw/XCMusic/commit/40b20b344ef07b4c6e3291f917e13fdfcd32ecb2))
- 修复评论界面错误，修复背景颜色错误 ([032b7d3](https://github.com/yiktllw/XCMusic/commit/032b7d3a8cf1ab883a38b459ba24e8c3bfdf7ced))

### 0.1.1 (2024-10-12)

### Features

- 播放界面-标题栏、播放栏 ([d2f76f0](https://github.com/yiktllw/XCMusic/commit/d2f76f09c82295d1bcb7806346b4d6a1a0ba8898))
- 播放界面背景颜色自动切换 ([91e124e](https://github.com/yiktllw/XCMusic/commit/91e124e0f798f46bd90b332338596e9a6d8bf095))
- 播放界面初始化 ([a4a467a](https://github.com/yiktllw/XCMusic/commit/a4a467a2d5d8ffb0ed053df5e1e7423cd63f762e))
- 点击搜索项时会将文字同步到文本框；专辑的歌手按钮功能实装 ([ecde07a](https://github.com/yiktllw/XCMusic/commit/ecde07a04a99bdb1dd7328cd684192851b31f209))
- 分离前端代码中的electron部分 ([0eeca79](https://github.com/yiktllw/XCMusic/commit/0eeca79e4689c80f4b8515eb6ba0a39b2e072271))
- 可以记忆播放列表及当前播放的歌曲 ([3d4235c](https://github.com/yiktllw/XCMusic/commit/3d4235c05c2dfea13e536a0dd66f69a1063d12bf))
- 能够记忆歌单中的滚动位置 ([6e6ff40](https://github.com/yiktllw/XCMusic/commit/6e6ff401364d0a988395d35e01b3b5cf8309de15))
- 实现播放栏添加到歌单按钮功能 ([8f1f8cc](https://github.com/yiktllw/XCMusic/commit/8f1f8cce7786df1cba51fca8dbeb1aea509a4960))
- 实现定位到当前歌曲，优化显示效果 ([e670dbb](https://github.com/yiktllw/XCMusic/commit/e670dbbf6dad858d51a959ceba578a27ff349b27))
- 实现逐句歌词，优化歌词动画 ([1eddabd](https://github.com/yiktllw/XCMusic/commit/1eddabd676243446a21b3dcdf406d79b1193d335))
- 使用环境变量存储api url ([ee3873f](https://github.com/yiktllw/XCMusic/commit/ee3873f7d275da18e11b3e0ca9f5f62703b0b994))
- 替换vue默认图标 ([dbb9984](https://github.com/yiktllw/XCMusic/commit/dbb9984c010922f79703c75878f92c01424275a3))
- 添加播放调试信息 ([002b3e9](https://github.com/yiktllw/XCMusic/commit/002b3e92bc9060e5817e1f21ec31de1ce46bab44))
- 完成逐行歌词，确定播放界面布局 ([cfb4b76](https://github.com/yiktllw/XCMusic/commit/cfb4b76002c3967d5adee6136f91b1dff230d440))
- 新建多语言文件 ([d23a9c9](https://github.com/yiktllw/XCMusic/commit/d23a9c97095410a932740233b76b7284c688604e))
- 新增歌曲百科和回忆坐标 ([e92bc71](https://github.com/yiktllw/XCMusic/commit/e92bc718c72f856b9d0fc0b8597ad0f58ff5711f))
- 新增若干主题，完善更改背景颜色功能，优化浅色主题 ([4dae282](https://github.com/yiktllw/XCMusic/commit/4dae282003e5d3abf08705dbe9d4e1fe9c4593a5))
- 新增搜索界面的搜索结果信息 ([273a49a](https://github.com/yiktllw/XCMusic/commit/273a49a356385363445a3885bf30fc17dd269096))
- 修改逐字歌词动画 ([df30f46](https://github.com/yiktllw/XCMusic/commit/df30f4690fc4174bf368444bf0892bf8b36dbdf9))
- 允许改变缩放系数(未在GUI中实现) ([6016095](https://github.com/yiktllw/XCMusic/commit/60160951b1babdea1656d12401aa0531248be144))
- 允许改变缩放系数(未在GUI中实现)，优化代码 ([de9d6eb](https://github.com/yiktllw/XCMusic/commit/de9d6ebfae547868316e1e03fd4136c3edccf8dd))
- 在播放栏上添加歌曲信息按钮 ([5022ddc](https://github.com/yiktllw/XCMusic/commit/5022ddcb0334c5a4723729bea82b0c4fe100984c))
- 增加播放调试信息 ([23cb104](https://github.com/yiktllw/XCMusic/commit/23cb1043cd2861f06d2d034e5161a94d3554585f))
- 支持部署到vercel ([961993c](https://github.com/yiktllw/XCMusic/commit/961993c5fbfc79aee11334974c2ecb5069e967a1))
- 支持部署到vercel ([6fe174f](https://github.com/yiktllw/XCMusic/commit/6fe174f86a6f5fd487d8fc9d5417d9a70c91fb21))
- 支持亮色主题，可以在设置中切换主题 ([d7bccf9](https://github.com/yiktllw/XCMusic/commit/d7bccf9fd331921c5a2714ec53cbe506ff25ddce))
- 支持切换语言，新增英文翻译 ([cf074d9](https://github.com/yiktllw/XCMusic/commit/cf074d945bd7b9c80085746bc49672d0d6c4708f))
- 只使用色表中的背景颜色 ([fff28cc](https://github.com/yiktllw/XCMusic/commit/fff28cc449036b955f2ffcd28a6ec89746e527e8))
- 重写播放界面的进度条样式 ([0a21f1a](https://github.com/yiktllw/XCMusic/commit/0a21f1a70009984f5171a38aff30c8b596783e57))
- vercel test ([aa38e1d](https://github.com/yiktllw/XCMusic/commit/aa38e1d68b40f57bc1d509cd57fea0ee05ede1d4))
- vercel test 2 ([1e1f2da](https://github.com/yiktllw/XCMusic/commit/1e1f2da9f6dab58d5efb0dcc2e53ea39cf65fc98))
- vercel test 2 ([0ba11b1](https://github.com/yiktllw/XCMusic/commit/0ba11b176ed3db954742c3f9fffd145b888a6f5d))
- vercel test 3 ([d7ca347](https://github.com/yiktllw/XCMusic/commit/d7ca34757091c4b76607bb75e6bb73faa9d09c2c))
- vercel test 4 ([ca1b132](https://github.com/yiktllw/XCMusic/commit/ca1b13259c6f81ef3d2eac329e6e2931082ebf46))

### Bug Fixes

- 播放界面进度条颜色异常 ([dae3946](https://github.com/yiktllw/XCMusic/commit/dae394663322bc9aa9142482a089b51ae28c8e85))
- 部署异常 ([048a915](https://github.com/yiktllw/XCMusic/commit/048a91515feeb20c6014153202e7790d2a9a37c5))
- 歌手按钮悬停样式异常 ([3345acb](https://github.com/yiktllw/XCMusic/commit/3345acbc67015531451cc642c1f99abe85b12ad7))
- 更新readme和vercel.example.json ([194c8b8](https://github.com/yiktllw/XCMusic/commit/194c8b80761357ffdf7a988ca2cfb6d25821ce21))
- 环境变量无效 ([600f57c](https://github.com/yiktllw/XCMusic/commit/600f57c1f63659240f3c880e3eaea77b89796ce7))
- 获取用户歌单时的未捕获错误 ([36da134](https://github.com/yiktllw/XCMusic/commit/36da1341e3f39e9eba1a8bce91cfa245c8b30002))
- 进度条圆点位置偏差 ([fad449c](https://github.com/yiktllw/XCMusic/commit/fad449ca8a06d11ed69ee900daf6e1bfa422c2d6))
- 跨域问题 ([638983e](https://github.com/yiktllw/XCMusic/commit/638983ec5fe8c1ac1ef9e35e920e8470594b64c7))
- 跨域问题 ([5432e31](https://github.com/yiktllw/XCMusic/commit/5432e31039549960988b6746ae0be6ba83006356))
- 亮色主题优化 ([e7946c2](https://github.com/yiktllw/XCMusic/commit/e7946c28ef184e19ec2ed2f8de7811ab75ee0381))
- 清理不必要的代码 ([d33124b](https://github.com/yiktllw/XCMusic/commit/d33124ba959e59c5f8694bc3ef40f07c08373143))
- 删除不必要的css变量 ([16baa3d](https://github.com/yiktllw/XCMusic/commit/16baa3d44a78bb590e9ee8b50a26ccac9a7b3065))
- 搜索歌手界面歌手名称超长 ([f182e32](https://github.com/yiktllw/XCMusic/commit/f182e320f54412486cbb47963d6d79689df4e8fe))
- 搜索历史不能正常工作 ([0a3b763](https://github.com/yiktllw/XCMusic/commit/0a3b763c080e25571d53830fef28990c85ad04a2))
- 网页端播放问题 ([ac4b6df](https://github.com/yiktllw/XCMusic/commit/ac4b6dfb08b1dd29f5deae9dc156d737237fc65d))
- 消除vue关于emits的警告 ([de46eb9](https://github.com/yiktllw/XCMusic/commit/de46eb9eac97dcf0b030e9d804fb92a670167151))
- 修复当前歌曲在表头时无法正确滚动的问题 ([d779d63](https://github.com/yiktllw/XCMusic/commit/d779d63c953b4feb200aa3fe894474faa5d2fd02))
- 修复路径不存在的错误 ([639a7cc](https://github.com/yiktllw/XCMusic/commit/639a7cc87ccfe13e07f3b56bcc4c77595e871661))
- 修复音频错误时的高频请求url，更新logo ([fafebc5](https://github.com/yiktllw/XCMusic/commit/fafebc599ce6d110e5e54e2311a3d17621ce188d))
- 修复重新启动时，播放列表没有同步到组件的问题 ([27792d7](https://github.com/yiktllw/XCMusic/commit/27792d749f401f3ee4300ff9157f2a58030c508d))
- 修复vue-i18n的警告 ([1431c39](https://github.com/yiktllw/XCMusic/commit/1431c398209c7933da53799a33b4f3f9058b4f2c))
- 修复vue-i18n的警告 ([8a4193a](https://github.com/yiktllw/XCMusic/commit/8a4193a0be67398b222254c43be7fc50b4bce67a))
- 英文歌词显示异常 ([815065c](https://github.com/yiktllw/XCMusic/commit/815065cdd1e76a90dceb9b6665e44ee9802ef287))
- 优化歌曲动画，修复使用YSongsTable时没有歌曲的错误 ([f8639ad](https://github.com/yiktllw/XCMusic/commit/f8639ad1c425531c780e2bce7400542153e1b6bf))
- 重写进度条组件，修复圆角问题 ([61b3fa1](https://github.com/yiktllw/XCMusic/commit/61b3fa1397d31868978a34211543bb0bd7883081))
- setting中，仅当值改变时触发变动；player中，增加playerReady事件订阅；修复vue-i18n的警告 ([c8ccf35](https://github.com/yiktllw/XCMusic/commit/c8ccf35349722289061f8e26230351e658c08df6))
- type ([73d886e](https://github.com/yiktllw/XCMusic/commit/73d886e502c3013a83873c56b73709378b548018))
- typo ([cc26564](https://github.com/yiktllw/XCMusic/commit/cc265641199d9e6154d83c42965e4a31c9b8c399))
- typo ([639e05c](https://github.com/yiktllw/XCMusic/commit/639e05c92d593fa4d130d89c24175da925f9b45a))
- typo ([6027867](https://github.com/yiktllw/XCMusic/commit/6027867bf041d9c37273a43db50a9a2ac0cf4220))
- typo ([3ebc44e](https://github.com/yiktllw/XCMusic/commit/3ebc44e93e080ecbee04cd587f5f635d15ec0af2))
- vercel 部署问题 ([e5b6ff4](https://github.com/yiktllw/XCMusic/commit/e5b6ff43320d87b9bbb10680d7e05289c4ff8959))
