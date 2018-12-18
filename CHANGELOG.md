<a name="unreleased"></a>
## [Unreleased](https://github.com/langurmonkey/gaiasky/tree/master)
[Full changelog](https://github.com/langurmonkey/gaiasky/compare/2.1.6...HEAD)


<a name="2.1.6"></a>
## [2.1.6](https://github.com/langurmonkey/gaiasky/tree/2.1.5) (2018-12-18)
[Full changelog](https://github.com/langurmonkey/gaiasky/compare/2.1.5...2.1.6)

### Bug Fixes

- update static light in models with no texture (meshes) 
- leftover code 
- remove buggy separators between some controls windows widgets 
- add 4 extra directions to FXAA, effect now much nicer on stars 
- width of tabs in prefs window lo-dpi mode 
- integer snapping in downl. mgr + part. effect 
- add cubemap edge fix to particle group 

### Build system

- update server datasets descriptor 
- minor issues 
- environment variable to skip java version check 
- minor fixes 
- script to convert usual RA[HH:MM:SS] and DEC[deg:arcmin:arcsec] to degrees 
- minify json descriptor files before pushing 
- update data descriptor with new nbg catalog 

### Code Refactoring

- variable name change: font3d -> fontDistanceField 
- removed data and assets-bak folders from repository 
- moved text utils methods and classes around 

### Documentation

- remove confusing line 
- environment variable to skip java version check 
- update readme with some extra info on download manager 
- extra documentation line in fxaa code 

### Features

- catalog chooser widget rewritten to make it easier to understand 
- improve disabled check box representation 
- add log to stil provider and more 
- add support for links (references) in download manager 
- performance improvements in octree, reimplement octant frustum culling 
- slash key bound to search dialog 
- add notice in catalog chooser 
- star size affects particle groups 
- update criteria to show catalog chooser 

### Style

- nbg loader to manage distances better 

<a name="2.1.5"></a>
## [2.1.5](https://github.com/langurmonkey/gaiasky/tree/2.1.4) (2018-12-03)
[Full changelog](https://github.com/langurmonkey/gaiasky/compare/2.1.4...2.1.5)

### Bug Fixes

- null pointer when unloading stars [#322](https://github.com/langurmonkey/gaiasky/issues/322) 

### Build system

- remove rpm deps as they depend on distro 
- update build scripts to install4j 7.0.8 
- update to libgdx 1.9.9 
- update data with new dr2-verylarge catalog 

### Code Refactoring

- regular textures to tex/base 
- cleaned up logger situation 

### Documentation

- update changelog 
- update rpm install command [#317](https://github.com/langurmonkey/gaiasky/issues/317) 

### Features

- LMC, SMC, datasets can require min gs version 
- add support for nebulae 
- non-jsonloader autoload files 
- billboard galaxies 
- passive update notifier [#321](https://github.com/langurmonkey/gaiasky/issues/321) 
- add download speed and progress in downloaded/total to download manager 
- add progress MB data to downloader 

### Style

- fix info message 

<a name="2.1.4"></a>
## [2.1.4](https://github.com/langurmonkey/gaiasky/tree/2.1.3) (2018-11-23)
[Full changelog](https://github.com/langurmonkey/gaiasky/compare/2.1.3...2.1.4)

### Bug Fixes

- locale index overflow 
- german translation and locale initialisation [#320](https://github.com/langurmonkey/gaiasky/issues/320) 
- do not preselect default dataset, only base data 
- sizing of download manager window 
- data download url log message 
- null pointer when updating scroll focus, slash at end 
- multiple scroll focus objects [#319](https://github.com/langurmonkey/gaiasky/issues/319) 
- octree generator 
- emission shader code 

### Build system

- add xorg-xrandr as dep in aur pkg 

### Features

- improve usability of download manager 
- ensure correct java version before building 
- dataset versioning [#318](https://github.com/langurmonkey/gaiasky/issues/318) [#316](https://github.com/langurmonkey/gaiasky/issues/316) 
- STIL provider adds HIP indices 
- name support and more for STIL loader 
- script to query HIP names in simbad 
- add optional output folder to csv process 
- script to process dr2 csv files 

### Style

- wee reformatting 

<a name="2.1.3"></a>
## [2.1.3](https://github.com/langurmonkey/gaiasky/tree/2.1.2-vr) (2018-10-31)
[Full changelog](https://github.com/langurmonkey/gaiasky/compare/2.1.2-vr...2.1.3)

### Bug Fixes

- octree rendering muted 
- minimap window 
- accents and umlauts in user folder path (win) [#314](https://github.com/langurmonkey/gaiasky/issues/314) 
- start button status update [#313](https://github.com/langurmonkey/gaiasky/issues/313) 

### Code Refactoring

- startup log 
- shader include directive changed 

### Documentation

- remove old references to `gaiasandbox` 

### Features

- new shader init & various improvements 
- add proper motions to stil data provider 
- initial support for proper motions over SAMP 
- individual constellation selectors [#275](https://github.com/langurmonkey/gaiasky/issues/275) 

### Style

- GaiaSky.java to use LF instead of CRLF 
- remove leftover variables in full gui 

<a name="2.1.2-vr"></a>
## [2.1.2-vr](https://github.com/langurmonkey/gaiasky/tree/2.1.2) (2018-09-28)
[Full changelog](https://github.com/langurmonkey/gaiasky/compare/2.1.2...2.1.2-vr)

### Bug Fixes

- remove version from window title 
- assets location in install4j template 
- heap sizes in build script 
- macOS -XstartOnFirstThread flag 
- macos builds tweaks 
- global key bindings affect invisible GUIs [#311](https://github.com/langurmonkey/gaiasky/issues/311) 
- fix `p` double-mapping [#310](https://github.com/langurmonkey/gaiasky/issues/310) 

### Build system

- installer detects and removes previous versions 
- new gradle 5 compile dep format 
- update to lwjgl 3.2.3 
- missing flag in rund, fix caps in ruler 
- new gradle 5 compile dep format 
- add javadoc generator and publisher 

### Code Refactoring

- bin to scripts, now settled 
- scripts moved to bin, bin in git 

### Documentation

- small tweak to changelog template 
- improve git-chglog configuration 
- update changelog 

### Features

- update to lwjgl3 backend 
- cosmic ruler [#296](https://github.com/langurmonkey/gaiasky/issues/296) 
- API calls to disable and enable the GUI [#312](https://github.com/langurmonkey/gaiasky/issues/312) 

### Style

- fix issues with merge to bring it back to a working state 
- add ruler component type 
- general code cleanup 
- minor style issues 

<a name="2.1.2"></a>
## [2.1.2](https://github.com/langurmonkey/gaiasky/tree/2.1.1) (2018-09-18)
[Full changelog](https://github.com/langurmonkey/gaiasky/compare/2.1.1...2.1.2)

### Bug Fixes

- fix for windows paths [#309](https://github.com/langurmonkey/gaiasky/issues/309) 
- fix run script and play camera windows 
- update changelog 

### Features

- add quit confirmation dialog 
- add new key bindings for simple actions 

<a name="2.1.1"></a>
## [2.1.1](https://github.com/langurmonkey/gaiasky/tree/2.1.0) (2018-09-14)
[Full changelog](https://github.com/langurmonkey/gaiasky/compare/2.1.0...2.1.1)

### Bug Fixes

- crash if no internet connection present [#308](https://github.com/langurmonkey/gaiasky/issues/308) 
- fix description of very large catalog 

### Documentation

- update changelog 
- mended submodule init and update 

<a name="2.1.0"></a>
## [2.1.0](https://github.com/langurmonkey/gaiasky/tree/2.0.3) (2018-09-11)
[Full changelog](https://github.com/langurmonkey/gaiasky/compare/2.0.3...2.1.0)

### Bug Fixes

- fix previous fix of search dialog [#307](https://github.com/langurmonkey/gaiasky/issues/307) 
- search dialog crash if starts with number [#307](https://github.com/langurmonkey/gaiasky/issues/307) 
- fix error loading lens dirt hi res texture 
### Build system

- new changelog generator in release script 
- add changelog generator script 
### Documentation

- updated changelog 
- add gaiasky-docs submodule 
- add commit message style guidelines 
- Fix download helper docs 
### Features

- add download manager and infrastructure [#291](https://github.com/langurmonkey/gaiasky/issues/291) [#303](https://github.com/langurmonkey/gaiasky/issues/303) 
### Style

- fix style of contributing once and for all 
- fix style in contributing.md 

## [2.0.3](https://github.com/langurmonkey/gaiasky/tree/2.0.3) (2018-08-28)
[Full Changelog](https://github.com/langurmonkey/gaiasky/compare/2.0.2-vr...2.0.3)

**Implemented enhancements:**

- Clean up logging code [\#299](https://github.com/langurmonkey/gaiasky/issues/299)
- Improve debug info [\#298](https://github.com/langurmonkey/gaiasky/issues/298)
- Handle vertex data more efficiently [\#297](https://github.com/langurmonkey/gaiasky/issues/297)
- API: Provide a way to hook into main loop thread [\#294](https://github.com/langurmonkey/gaiasky/issues/294)
- Add support for different line widths [\#293](https://github.com/langurmonkey/gaiasky/issues/293)
- API call: lines between arbitrary positions [\#292](https://github.com/langurmonkey/gaiasky/issues/292)
- Add Top/Bottom to the mode profiles for 3DTV [\#268](https://github.com/langurmonkey/gaiasky/issues/268)

**Merged pull requests:**

- REST server static files use assets.location [\#300](https://github.com/langurmonkey/gaiasky/pull/300) ([vga101](https://github.com/vga101))
- Re-introduce REST API [\#281](https://github.com/langurmonkey/gaiasky/pull/281) ([vga101](https://github.com/vga101))

## [2.0.2-vr](https://github.com/langurmonkey/gaiasky/tree/2.0.2-vr) (2018-07-25)
[Full Changelog](https://github.com/langurmonkey/gaiasky/compare/2.0.2...2.0.2-vr)

## [2.0.2](https://github.com/langurmonkey/gaiasky/tree/2.0.2) (2018-07-06)
[Full Changelog](https://github.com/langurmonkey/gaiasky/compare/2.0.1...2.0.2)

**Implemented enhancements:**

- Add controls to manage datasets [\#290](https://github.com/langurmonkey/gaiasky/issues/290)
- Separate base texture from clouds texture [\#289](https://github.com/langurmonkey/gaiasky/issues/289)
- Add gamma correction [\#288](https://github.com/langurmonkey/gaiasky/issues/288)
- Add label size control [\#287](https://github.com/langurmonkey/gaiasky/issues/287)
- Rearrange graphical settings into preferences dialog [\#286](https://github.com/langurmonkey/gaiasky/issues/286)

**Fixed bugs:**

- Fix objects pane minimize button disappearing [\#285](https://github.com/langurmonkey/gaiasky/issues/285)

**Merged pull requests:**

- Fix broken link to DR2 default catalog [\#280](https://github.com/langurmonkey/gaiasky/pull/280) ([vga101](https://github.com/vga101))

## [2.0.1](https://github.com/langurmonkey/gaiasky/tree/2.0.1) (2018-06-14)
[Full Changelog](https://github.com/langurmonkey/gaiasky/compare/2.0.0-vr...2.0.1)

**Implemented enhancements:**

- Lazy mesh initialization [\#284](https://github.com/langurmonkey/gaiasky/issues/284)
- Improve DR2 catalogs [\#283](https://github.com/langurmonkey/gaiasky/issues/283)
- Add support for new galaxy meshes [\#282](https://github.com/langurmonkey/gaiasky/issues/282)
- Fix Gaia Sky logo resolution [\#279](https://github.com/langurmonkey/gaiasky/issues/279)
- Add utility to see logs [\#278](https://github.com/langurmonkey/gaiasky/issues/278)
- Improve grid rendering [\#277](https://github.com/langurmonkey/gaiasky/issues/277)
- Add maximum FPS option [\#273](https://github.com/langurmonkey/gaiasky/issues/273)
- Create contributing.md files with guidelines as to how to contribute [\#272](https://github.com/langurmonkey/gaiasky/issues/272)
- Only Xbox 360 controls, no XBone [\#199](https://github.com/langurmonkey/gaiasky/issues/199)

**Fixed bugs:**

- Fix Windows 32-bit build [\#274](https://github.com/langurmonkey/gaiasky/issues/274)

**Closed issues:**

- Maximum time reached [\#271](https://github.com/langurmonkey/gaiasky/issues/271)

## [2.0.0-vr](https://github.com/langurmonkey/gaiasky/tree/2.0.0-vr) (2018-05-09)
[Full Changelog](https://github.com/langurmonkey/gaiasky/compare/2.0.0...2.0.0-vr)

**Implemented enhancements:**

- Add night theme [\#270](https://github.com/langurmonkey/gaiasky/issues/270)

**Fixed bugs:**

- Fix SAMP issues when loading [\#266](https://github.com/langurmonkey/gaiasky/issues/266)
- Fix constellation name flickering when planets are turned off [\#264](https://github.com/langurmonkey/gaiasky/issues/264)

**Closed issues:**

- Is it possible to extend the size of the user interface [\#269](https://github.com/langurmonkey/gaiasky/issues/269)

## [2.0.0](https://github.com/langurmonkey/gaiasky/tree/2.0.0) (2018-04-24)
[Full Changelog](https://github.com/langurmonkey/gaiasky/compare/1.5.0...2.0.0)

**Implemented enhancements:**

- Add hue and saturation to levels [\#263](https://github.com/langurmonkey/gaiasky/issues/263)
- Add support for asteroind positions additionally to orbits [\#262](https://github.com/langurmonkey/gaiasky/issues/262)
- Add Hammer-Aitoff and cylindrical projections to cubemap mode [\#260](https://github.com/langurmonkey/gaiasky/issues/260)
- Expose dataset chooser to prefs window [\#259](https://github.com/langurmonkey/gaiasky/issues/259)
- Add projection minimaps [\#255](https://github.com/langurmonkey/gaiasky/issues/255)
- Add image format and quality for screenshots and frames to config [\#253](https://github.com/langurmonkey/gaiasky/issues/253)
- Add reset time hotkey [\#252](https://github.com/langurmonkey/gaiasky/issues/252)
- Apply graphics quality without restart [\#251](https://github.com/langurmonkey/gaiasky/issues/251)
- Add gravitational wave model [\#249](https://github.com/langurmonkey/gaiasky/issues/249)
- Add CMB [\#248](https://github.com/langurmonkey/gaiasky/issues/248)
- Add SAMP support [\#246](https://github.com/langurmonkey/gaiasky/issues/246)
- Use memory mapped files for speed-critical read operations [\#245](https://github.com/langurmonkey/gaiasky/issues/245)
- Remove android/html/desktop infrastructure [\#244](https://github.com/langurmonkey/gaiasky/issues/244)
- Add relativistic aberration [\#242](https://github.com/langurmonkey/gaiasky/issues/242)
- Add flag to enable dataset chooser dialog at startup [\#240](https://github.com/langurmonkey/gaiasky/issues/240)
- Improve occlusion test in light glow algorithm [\#239](https://github.com/langurmonkey/gaiasky/issues/239)
- Add pure GPU line renderer for orbits [\#232](https://github.com/langurmonkey/gaiasky/issues/232)
- Add star opacity setter to API [\#231](https://github.com/langurmonkey/gaiasky/issues/231)
- Add visual effects controls to API [\#230](https://github.com/langurmonkey/gaiasky/issues/230)
- Add stereo and 360 modes to API [\#229](https://github.com/langurmonkey/gaiasky/issues/229)
- Add star size setter to API [\#228](https://github.com/langurmonkey/gaiasky/issues/228)
- Add 'stop time' to scripting API [\#226](https://github.com/langurmonkey/gaiasky/issues/226)
- Add setPlanetariumMode\(\) API call [\#225](https://github.com/langurmonkey/gaiasky/issues/225)
- Add API call to control brightness and contrast [\#221](https://github.com/langurmonkey/gaiasky/issues/221)
- Add a reload default settings button [\#220](https://github.com/langurmonkey/gaiasky/issues/220)
- Add getSimulationTime\(\) to scripting [\#219](https://github.com/langurmonkey/gaiasky/issues/219)
- Add frame output state indicator [\#218](https://github.com/langurmonkey/gaiasky/issues/218)
- Set crosshair visibility API call [\#215](https://github.com/langurmonkey/gaiasky/issues/215)
- Add setSimulationTime with comprehensive params to scripting [\#214](https://github.com/langurmonkey/gaiasky/issues/214)
- Add 'Back to Earth' key mapping [\#209](https://github.com/langurmonkey/gaiasky/issues/209)
- Add pointer coordinates toggle in preferences [\#208](https://github.com/langurmonkey/gaiasky/issues/208)
- Constellations with proper motions [\#203](https://github.com/langurmonkey/gaiasky/issues/203)
- Add controller debug mode to help create mappings [\#202](https://github.com/langurmonkey/gaiasky/issues/202)
- Add support for emissive colors and textures [\#201](https://github.com/langurmonkey/gaiasky/issues/201)
- Upgrade to libgdx 1.9.7 [\#200](https://github.com/langurmonkey/gaiasky/issues/200)
- Adapt normal lighting shader to accept no directional lights [\#197](https://github.com/langurmonkey/gaiasky/issues/197)
- Update Jython to 2.7.0 [\#194](https://github.com/langurmonkey/gaiasky/issues/194)
- Feature request - scripting functions [\#192](https://github.com/langurmonkey/gaiasky/issues/192)
- Add distance to Sol in focus info interface [\#191](https://github.com/langurmonkey/gaiasky/issues/191)
- Look for ways to prevent time overflow [\#190](https://github.com/langurmonkey/gaiasky/issues/190)
- Add star clusters [\#188](https://github.com/langurmonkey/gaiasky/issues/188)
- Enable proper motions [\#185](https://github.com/langurmonkey/gaiasky/issues/185)
- Allow arbitrary meshes in json data files [\#184](https://github.com/langurmonkey/gaiasky/issues/184)
- Add 'pause background loading' action [\#181](https://github.com/langurmonkey/gaiasky/issues/181)
- Fix action buttons \(stop script, stop camera path\) [\#180](https://github.com/langurmonkey/gaiasky/issues/180)
- Add titles to data with i18n [\#179](https://github.com/langurmonkey/gaiasky/issues/179)
- Crosshair when in free camera + target mode [\#178](https://github.com/langurmonkey/gaiasky/issues/178)
- Crosshair to point to focus direction when off-screen [\#177](https://github.com/langurmonkey/gaiasky/issues/177)
- Problem loading many asteroid orbits [\#98](https://github.com/langurmonkey/gaiasky/issues/98)
- Shadow mapping [\#60](https://github.com/langurmonkey/gaiasky/issues/60)

**Fixed bugs:**

- Fix position discrepancy of stars in stereo mode \(points vs billboards\) [\#258](https://github.com/langurmonkey/gaiasky/issues/258)
- Screenshot and frame mode switch from simple to advanced produces null pointer [\#257](https://github.com/langurmonkey/gaiasky/issues/257)
- Refactor time [\#256](https://github.com/langurmonkey/gaiasky/issues/256)
- Streaming catalog loader never attempts previously discarded pages [\#241](https://github.com/langurmonkey/gaiasky/issues/241)
- Fix returning from panorama mode through stereo mode [\#238](https://github.com/langurmonkey/gaiasky/issues/238)
- Add object scaling to scripting API [\#227](https://github.com/langurmonkey/gaiasky/issues/227)
- Fix atmosphere flickering due to z fighting [\#224](https://github.com/langurmonkey/gaiasky/issues/224)
- Fix Gaia FoV detection and projection [\#223](https://github.com/langurmonkey/gaiasky/issues/223)
- Fixed errors not logging correctly during init [\#222](https://github.com/langurmonkey/gaiasky/issues/222)
- Remove wrong \[h/sec\] units in time warp label [\#217](https://github.com/langurmonkey/gaiasky/issues/217)
- Star label positioning does not react to fov setting [\#216](https://github.com/langurmonkey/gaiasky/issues/216)
- Fix focus issue using shift in objects component input [\#213](https://github.com/langurmonkey/gaiasky/issues/213)
- Fix NUMPAD4/5/6 to acces FOV camera modes [\#212](https://github.com/langurmonkey/gaiasky/issues/212)
- Fix star min opacity initialisation [\#207](https://github.com/langurmonkey/gaiasky/issues/207)
- Crash when selecting NBG galaxy with the time on [\#206](https://github.com/langurmonkey/gaiasky/issues/206)
- goToObject\(name, angle\) not zooming out if current angle is larger than target [\#195](https://github.com/langurmonkey/gaiasky/issues/195)
- NullPointerException in DesktopNetworkChecker [\#193](https://github.com/langurmonkey/gaiasky/issues/193)
- Look for ways to prevent time overflow [\#190](https://github.com/langurmonkey/gaiasky/issues/190)
- Fix visibility of date/time and time warp factor [\#189](https://github.com/langurmonkey/gaiasky/issues/189)
- Fix `facingFocus` state issue [\#187](https://github.com/langurmonkey/gaiasky/issues/187)
- Fix MAS\_TO\_DEG conversion in AstroUtils [\#186](https://github.com/langurmonkey/gaiasky/issues/186)
- Fix 'run script' window handling of scripts with same name [\#182](https://github.com/langurmonkey/gaiasky/issues/182)
- Motion blur causes problems with 360 mode [\#87](https://github.com/langurmonkey/gaiasky/issues/87)

**Closed issues:**

- Is this update also coming? [\#261](https://github.com/langurmonkey/gaiasky/issues/261)
- Enable particle effects [\#254](https://github.com/langurmonkey/gaiasky/issues/254)
- Add-ons [\#250](https://github.com/langurmonkey/gaiasky/issues/250)
- Crash with TGAS GPU dataset [\#236](https://github.com/langurmonkey/gaiasky/issues/236)
- Preferences window shows wrong version number [\#234](https://github.com/langurmonkey/gaiasky/issues/234)
- Cannot build desktop:dist [\#233](https://github.com/langurmonkey/gaiasky/issues/233)
- Feature request: galactic cartesian coordinates [\#211](https://github.com/langurmonkey/gaiasky/issues/211)
- Adding meshes [\#205](https://github.com/langurmonkey/gaiasky/issues/205)
- On Windows, install fails with "Could not determine java version from '9.0.1' [\#204](https://github.com/langurmonkey/gaiasky/issues/204)
- Docs don't mention where record data appears [\#198](https://github.com/langurmonkey/gaiasky/issues/198)
- So....I...uhh...broke it in the most beautiful way I could think...ever. [\#196](https://github.com/langurmonkey/gaiasky/issues/196)
- Javadocs no longer available [\#183](https://github.com/langurmonkey/gaiasky/issues/183)
- Not truly compatible with Oculus Rift [\#44](https://github.com/langurmonkey/gaiasky/issues/44)

**Merged pull requests:**

- Add REST API for remote control [\#237](https://github.com/langurmonkey/gaiasky/pull/237) ([vga101](https://github.com/vga101))
- DE translation and minor formatting update [\#235](https://github.com/langurmonkey/gaiasky/pull/235) ([vga101](https://github.com/vga101))

## [1.5.0](https://github.com/langurmonkey/gaiasky/tree/1.5.0) (2017-08-02)
[Full Changelog](https://github.com/langurmonkey/gaiasky/compare/1.0.4...1.5.0)

**Implemented enhancements:**

- Integrate particle groups with levels of detail [\#170](https://github.com/langurmonkey/gaiasky/issues/170)
- Set up renderer using asset manager [\#167](https://github.com/langurmonkey/gaiasky/issues/167)
- Set up post processor through the asset manager [\#166](https://github.com/langurmonkey/gaiasky/issues/166)
- Scale point primitives by ratio to default [\#163](https://github.com/langurmonkey/gaiasky/issues/163)
- Implement GPU-based implementation for star catalogs [\#162](https://github.com/langurmonkey/gaiasky/issues/162)
- Additive blending [\#160](https://github.com/langurmonkey/gaiasky/issues/160)
- Enable star particle groups [\#159](https://github.com/langurmonkey/gaiasky/issues/159)
- Expose high accuracy positons setting in the GUI [\#157](https://github.com/langurmonkey/gaiasky/issues/157)
- Allow high accuracy in VSOP87 model [\#156](https://github.com/langurmonkey/gaiasky/issues/156)
- Front end to manage game controller mappings [\#155](https://github.com/langurmonkey/gaiasky/issues/155)
- Add nearby galaxies, NBG [\#154](https://github.com/langurmonkey/gaiasky/issues/154)
- Add Oort cloud [\#152](https://github.com/langurmonkey/gaiasky/issues/152)
- Add Pluto [\#151](https://github.com/langurmonkey/gaiasky/issues/151)
- Abstract controller mappings, use files to define them [\#150](https://github.com/langurmonkey/gaiasky/issues/150)
- Add target mode in free camera [\#148](https://github.com/langurmonkey/gaiasky/issues/148)
- Add 'land on object' function [\#147](https://github.com/langurmonkey/gaiasky/issues/147)
- On-demand catalog loading from disk [\#146](https://github.com/langurmonkey/gaiasky/issues/146)
- French translation [\#145](https://github.com/langurmonkey/gaiasky/issues/145)
- Allow for controller look y-axis to be inverted [\#143](https://github.com/langurmonkey/gaiasky/issues/143)
- Support lazy texture initialisation for faster startup [\#140](https://github.com/langurmonkey/gaiasky/issues/140)
- Add Saturn moons [\#139](https://github.com/langurmonkey/gaiasky/issues/139)
- Revamp debug info [\#138](https://github.com/langurmonkey/gaiasky/issues/138)
- Add non cinematic camera mode [\#135](https://github.com/langurmonkey/gaiasky/issues/135)
- Discard current star shader based on noise and use texture instead [\#134](https://github.com/langurmonkey/gaiasky/issues/134)
- Apply screen mode without restart [\#128](https://github.com/langurmonkey/gaiasky/issues/128)
- Make network checker \(simbad, wiki\) asynchronous [\#127](https://github.com/langurmonkey/gaiasky/issues/127)
- Deprecate current swing-based preferences [\#125](https://github.com/langurmonkey/gaiasky/issues/125)
- Apply skin change without restarting [\#124](https://github.com/langurmonkey/gaiasky/issues/124)
- Colour code proper motion vectors with direction/magnitude [\#123](https://github.com/langurmonkey/gaiasky/issues/123)
- Fix layout of controls window [\#121](https://github.com/langurmonkey/gaiasky/issues/121)
- Add context menu with some options [\#120](https://github.com/langurmonkey/gaiasky/issues/120)
- Rearrange UI, fix HiDPI themes [\#119](https://github.com/langurmonkey/gaiasky/issues/119)
- Add button to stop current camera play session [\#117](https://github.com/langurmonkey/gaiasky/issues/117)
- UI animations [\#116](https://github.com/langurmonkey/gaiasky/issues/116)
- Add Slovene language [\#109](https://github.com/langurmonkey/gaiasky/issues/109)
- Add new Parallel View stereoscopic profile [\#105](https://github.com/langurmonkey/gaiasky/issues/105)
- Upgrade to Lwjgl 3 [\#103](https://github.com/langurmonkey/gaiasky/issues/103)

**Fixed bugs:**

- Fix eye separation in spacecraft+stereoscopic modes [\#168](https://github.com/langurmonkey/gaiasky/issues/168)
- Random crash at startup [\#165](https://github.com/langurmonkey/gaiasky/issues/165)
- Fix postprocessing framebuffer resize issue [\#164](https://github.com/langurmonkey/gaiasky/issues/164)
- Scale point primitives by ratio to default [\#163](https://github.com/langurmonkey/gaiasky/issues/163)
- Milky Way texture off when rotated [\#158](https://github.com/langurmonkey/gaiasky/issues/158)
- Fix controller input in non-cinematic mode [\#142](https://github.com/langurmonkey/gaiasky/issues/142)
- Fix smooth transitions in multithread mode [\#141](https://github.com/langurmonkey/gaiasky/issues/141)
- Fixe Quad line renderer artifacts [\#137](https://github.com/langurmonkey/gaiasky/issues/137)
- Make network checker \\(simbad, wiki\\) asynchronous [\#127](https://github.com/langurmonkey/gaiasky/issues/127)
- Fix cast error when multithreading is on [\#126](https://github.com/langurmonkey/gaiasky/issues/126)
- Label flickering when star is perfectly aligned with camera direction [\#122](https://github.com/langurmonkey/gaiasky/issues/122)
- Fix main controls window alignments [\#118](https://github.com/langurmonkey/gaiasky/issues/118)
- Fix gaia scan mode [\#114](https://github.com/langurmonkey/gaiasky/issues/114)
- Add timeout to version check [\#112](https://github.com/langurmonkey/gaiasky/issues/112)
- Fix config file lookup crash when running from source [\#111](https://github.com/langurmonkey/gaiasky/issues/111)
- Fix focus issue with objects text field [\#106](https://github.com/langurmonkey/gaiasky/issues/106)
- Fix stereoscopic mode for large distances/eye separations [\#89](https://github.com/langurmonkey/gaiasky/issues/89)
- Gaia Sky crashes on Windows 10 32bit - JRE 8u102 [\#77](https://github.com/langurmonkey/gaiasky/issues/77)
- Fix octant detection in very low fov angles [\#70](https://github.com/langurmonkey/gaiasky/issues/70)

**Closed issues:**

- Incorrect size of "Sol" via scripting interface [\#174](https://github.com/langurmonkey/gaiasky/issues/174)
- Parsing of version string breaks when custom git tags are used [\#173](https://github.com/langurmonkey/gaiasky/issues/173)
- Test script "getobject-test.py" crashes [\#172](https://github.com/langurmonkey/gaiasky/issues/172)
- Constellation "Antlia" misspelled as "Antila" [\#153](https://github.com/langurmonkey/gaiasky/issues/153)
- Closest object and camera speed in scripting interface [\#149](https://github.com/langurmonkey/gaiasky/issues/149)
- Cinematic camera setting not saved [\#144](https://github.com/langurmonkey/gaiasky/issues/144)
- Running Gaia Sky in Oculus Rift [\#136](https://github.com/langurmonkey/gaiasky/issues/136)
- Scripting interface: asynchronous mode? [\#133](https://github.com/langurmonkey/gaiasky/issues/133)
- Scripting interface: issues with setCameraPostion method [\#132](https://github.com/langurmonkey/gaiasky/issues/132)
- Scripting interface: calling setStarBrightness\(\) seems to change the ambient light [\#131](https://github.com/langurmonkey/gaiasky/issues/131)
- Scripting interface: calling setVisibility toggles independent of parameter [\#130](https://github.com/langurmonkey/gaiasky/issues/130)
- Scripting interface: calling setCameraLock\(\) causes Exception in thread "LWJGL Application" [\#129](https://github.com/langurmonkey/gaiasky/issues/129)
- Translation [\#107](https://github.com/langurmonkey/gaiasky/issues/107)

**Merged pull requests:**

- Fix ARI url [\#176](https://github.com/langurmonkey/gaiasky/pull/176) ([vga101](https://github.com/vga101))
- Fix method comment for displayTextObject [\#175](https://github.com/langurmonkey/gaiasky/pull/175) ([vga101](https://github.com/vga101))
- Fix customobjects-test.py [\#171](https://github.com/langurmonkey/gaiasky/pull/171) ([vga101](https://github.com/vga101))
- Suggested improvements for German translation [\#169](https://github.com/langurmonkey/gaiasky/pull/169) ([vga101](https://github.com/vga101))
- Fix URL to home page [\#161](https://github.com/langurmonkey/gaiasky/pull/161) ([vga101](https://github.com/vga101))
- Fix README rendering [\#115](https://github.com/langurmonkey/gaiasky/pull/115) ([rogersachan](https://github.com/rogersachan))
- Fix links to scripting documentation [\#113](https://github.com/langurmonkey/gaiasky/pull/113) ([vga101](https://github.com/vga101))
- Fix TGAS extraction path in running instructions [\#110](https://github.com/langurmonkey/gaiasky/pull/110) ([vga101](https://github.com/vga101))
- Slovene translation [\#108](https://github.com/langurmonkey/gaiasky/pull/108) ([kcotar](https://github.com/kcotar))

## [1.0.4](https://github.com/langurmonkey/gaiasky/tree/1.0.4) (2016-12-07)
[Full Changelog](https://github.com/langurmonkey/gaiasky/compare/1.0.3...1.0.4)

**Implemented enhancements:**

- Improve loading times [\#102](https://github.com/langurmonkey/gaiasky/issues/102)
- Config window HiDPI mode [\#101](https://github.com/langurmonkey/gaiasky/issues/101)
- Dependent visibility for orbits [\#100](https://github.com/langurmonkey/gaiasky/issues/100)
- Map and calibrate Milky Way panorama [\#94](https://github.com/langurmonkey/gaiasky/issues/94)
- Add option to capture frames while camera path is playing [\#71](https://github.com/langurmonkey/gaiasky/issues/71)

**Fixed bugs:**

- Fix crosshair issues when resizing [\#104](https://github.com/langurmonkey/gaiasky/issues/104)
- Dependent visibility for orbits [\#100](https://github.com/langurmonkey/gaiasky/issues/100)
- Stars disappear for a while when camera approaches [\#97](https://github.com/langurmonkey/gaiasky/issues/97)
- Version `1.0.3` fills memory with frame output [\#96](https://github.com/langurmonkey/gaiasky/issues/96)
- Light glow sampling spiral should adapt to fov angle [\#95](https://github.com/langurmonkey/gaiasky/issues/95)
- Debug and spacecraft GUIs do not resize correctly [\#93](https://github.com/langurmonkey/gaiasky/issues/93)
- Resizing during loading screen causes buffer size problems [\#40](https://github.com/langurmonkey/gaiasky/issues/40)

**Merged pull requests:**

- Fixed broken download links in README.md [\#99](https://github.com/langurmonkey/gaiasky/pull/99) ([adamkewley](https://github.com/adamkewley))

## [1.0.3](https://github.com/langurmonkey/gaiasky/tree/1.0.3) (2016-11-15)
[Full Changelog](https://github.com/langurmonkey/gaiasky/compare/1.0.2...1.0.3)

**Fixed bugs:**

- Fix FoV modes [\#92](https://github.com/langurmonkey/gaiasky/issues/92)
- Run tutorial runs pointer [\#91](https://github.com/langurmonkey/gaiasky/issues/91)

## [1.0.2](https://github.com/langurmonkey/gaiasky/tree/1.0.2) (2016-11-14)
[Full Changelog](https://github.com/langurmonkey/gaiasky/compare/1.0.1...1.0.2)

## [1.0.1](https://github.com/langurmonkey/gaiasky/tree/1.0.1) (2016-11-11)
[Full Changelog](https://github.com/langurmonkey/gaiasky/compare/1.0.0...1.0.1)

**Implemented enhancements:**

- Add brightness and contrast controls [\#88](https://github.com/langurmonkey/gaiasky/issues/88)
- Improve search functionality [\#85](https://github.com/langurmonkey/gaiasky/issues/85)
- Spacecraft camera mode - Game on! [\#84](https://github.com/langurmonkey/gaiasky/issues/84)
- Update planets and moons textures [\#82](https://github.com/langurmonkey/gaiasky/issues/82)
- Add an optional crosshair in focus mode [\#81](https://github.com/langurmonkey/gaiasky/issues/81)
- Implement 360 deg mode for 360 VR videos [\#80](https://github.com/langurmonkey/gaiasky/issues/80)

**Fixed bugs:**

- Configuration dialog should appear at the center of focused screen [\#90](https://github.com/langurmonkey/gaiasky/issues/90)
- Fix resizing and fullscreen toggle [\#86](https://github.com/langurmonkey/gaiasky/issues/86)
- Crash - Vector pool null pointer when multithreading is on [\#83](https://github.com/langurmonkey/gaiasky/issues/83)
- Fix connection to archive for DR1 sources [\#78](https://github.com/langurmonkey/gaiasky/issues/78)
- error 1114 [\#76](https://github.com/langurmonkey/gaiasky/issues/76)
- New Version 1.0.0 doesn`t work on OSX 10.10.5 [\#75](https://github.com/langurmonkey/gaiasky/issues/75)

**Closed issues:**

- Gaia Sky crashes on Windows 10, Java 1.8.0\_101 [\#79](https://github.com/langurmonkey/gaiasky/issues/79)

## [1.0.0](https://github.com/langurmonkey/gaiasky/tree/1.0.0) (2016-09-13)
[Full Changelog](https://github.com/langurmonkey/gaiasky/compare/0.800b...1.0.0)

**Implemented enhancements:**

- Add orientation lock [\#74](https://github.com/langurmonkey/gaiasky/issues/74)
- Fix frame rate when recording camera [\#73](https://github.com/langurmonkey/gaiasky/issues/73)
- Add planetarium mode [\#72](https://github.com/langurmonkey/gaiasky/issues/72)
- Add sliders for star point size and minimum opacity [\#68](https://github.com/langurmonkey/gaiasky/issues/68)
- Add LOD sliders [\#67](https://github.com/langurmonkey/gaiasky/issues/67)
- Implement anaglyphic 3D [\#65](https://github.com/langurmonkey/gaiasky/issues/65)
- Add distortion to VR\_HEADSET stereoscopic mode [\#64](https://github.com/langurmonkey/gaiasky/issues/64)
- Add data source selection to Preferences [\#63](https://github.com/langurmonkey/gaiasky/issues/63)
- Add support for proper motion vectors [\#62](https://github.com/langurmonkey/gaiasky/issues/62)
- Add interface to data loaders in config dialog [\#15](https://github.com/langurmonkey/gaiasky/issues/15)

**Fixed bugs:**

- Add ambient light to persisted properties [\#69](https://github.com/langurmonkey/gaiasky/issues/69)
- GUI should be hidden when stereoscopic is on at startup [\#66](https://github.com/langurmonkey/gaiasky/issues/66)
- Fix mouse input in stereoscopic mode [\#61](https://github.com/langurmonkey/gaiasky/issues/61)
- app won't start [\#13](https://github.com/langurmonkey/gaiasky/issues/13)

## [0.800b](https://github.com/langurmonkey/gaiasky/tree/0.800b) (2016-04-28)
[Full Changelog](https://github.com/langurmonkey/gaiasky/compare/0.707b...0.800b)

**Implemented enhancements:**

- Add playback music system [\#59](https://github.com/langurmonkey/gaiasky/issues/59)
- Improve render time, use points for all stars [\#52](https://github.com/langurmonkey/gaiasky/issues/52)
- Add smooth transitions between levels of detail [\#51](https://github.com/langurmonkey/gaiasky/issues/51)
- Use view angle as priority for click-selections [\#50](https://github.com/langurmonkey/gaiasky/issues/50)
- Get the Gaia Sanbox ready for proper motions [\#48](https://github.com/langurmonkey/gaiasky/issues/48)

**Fixed bugs:**

- Fix scritping interface timing with frame output system [\#55](https://github.com/langurmonkey/gaiasky/issues/55)
- Fix Gaia scan code [\#49](https://github.com/langurmonkey/gaiasky/issues/49)

**Closed issues:**

- Set time pace to a factor of real time [\#58](https://github.com/langurmonkey/gaiasky/issues/58)
- Add graphics mode selector [\#57](https://github.com/langurmonkey/gaiasky/issues/57)
- Fix the looks for HiDPI screens [\#56](https://github.com/langurmonkey/gaiasky/issues/56)
- App fails to start OS X [\#54](https://github.com/langurmonkey/gaiasky/issues/54)

## [0.707b](https://github.com/langurmonkey/gaiasky/tree/0.707b) (2015-09-14)
[Full Changelog](https://github.com/langurmonkey/gaiasky/compare/0.706b...0.707b)

**Implemented enhancements:**

- Simplify loading mechanism of data files [\#46](https://github.com/langurmonkey/gaiasky/issues/46)
- Add sample image when choosing theme [\#38](https://github.com/langurmonkey/gaiasky/issues/38)
- Drop old manual lo-res/hi-res texture loading and implement mipmapping [\#35](https://github.com/langurmonkey/gaiasky/issues/35)
- Update project to libgdx 1.6.0 [\#34](https://github.com/langurmonkey/gaiasky/issues/34)
- Add simple screenshot mode [\#32](https://github.com/langurmonkey/gaiasky/issues/32)
- Move default location of screenshots to `$HOME/.gaiasandbox/screenshots` [\#31](https://github.com/langurmonkey/gaiasky/issues/31)
- Add new Ceres texture from Dawn spacecraft [\#30](https://github.com/langurmonkey/gaiasky/issues/30)
- New command to travel to focus object instantly [\#29](https://github.com/langurmonkey/gaiasky/issues/29)
- Support for location info [\#28](https://github.com/langurmonkey/gaiasky/issues/28)
- Migrate build system to gradle [\#2](https://github.com/langurmonkey/gaiasky/issues/2)

**Fixed bugs:**

- Linux launcher not working if spaces in path [\#47](https://github.com/langurmonkey/gaiasky/issues/47)
- Fix labels in Gaia Fov mode [\#45](https://github.com/langurmonkey/gaiasky/issues/45)
- Last update date is sensible to running locale [\#43](https://github.com/langurmonkey/gaiasky/issues/43)
- RA and DEC are wrong in binary version of HYG catalog [\#42](https://github.com/langurmonkey/gaiasky/issues/42)
- Keyboard focus stays in input texts [\#41](https://github.com/langurmonkey/gaiasky/issues/41)
- Fix new line rendering for perspective lines [\#37](https://github.com/langurmonkey/gaiasky/issues/37)
- Motion blur not working with FXAA or NFAA [\#36](https://github.com/langurmonkey/gaiasky/issues/36)
- Fix night/day blending in shader  [\#33](https://github.com/langurmonkey/gaiasky/issues/33)
- Screenshot action \(F5\) not working well with motion blur [\#27](https://github.com/langurmonkey/gaiasky/issues/27)

## [0.706b](https://github.com/langurmonkey/gaiasky/tree/0.706b) (2015-05-05)
[Full Changelog](https://github.com/langurmonkey/gaiasky/compare/0.705b...0.706b)

**Implemented enhancements:**

- General code style clean-up  [\#25](https://github.com/langurmonkey/gaiasky/issues/25)
- Big performance improvement in star rendering [\#23](https://github.com/langurmonkey/gaiasky/issues/23)
- New pixel renderer [\#22](https://github.com/langurmonkey/gaiasky/issues/22)
- Add controller support [\#21](https://github.com/langurmonkey/gaiasky/issues/21)
- Motion blur effect [\#20](https://github.com/langurmonkey/gaiasky/issues/20)
- Interface overhaul [\#19](https://github.com/langurmonkey/gaiasky/issues/19)
- Better looking lines [\#18](https://github.com/langurmonkey/gaiasky/issues/18)

**Fixed bugs:**

- Handle outdated properties files in $HOME/.gaiasandbox folder [\#26](https://github.com/langurmonkey/gaiasky/issues/26)
- Scripting implementation should reset the colour [\#24](https://github.com/langurmonkey/gaiasky/issues/24)

**Closed issues:**

- deprecated [\#17](https://github.com/langurmonkey/gaiasky/issues/17)

## [0.705b](https://github.com/langurmonkey/gaiasky/tree/0.705b) (2015-04-16)
[Full Changelog](https://github.com/langurmonkey/gaiasky/compare/0.704b...0.705b)

**Fixed bugs:**

- Gaia sandbox current releases do not work on windows [\#16](https://github.com/langurmonkey/gaiasky/issues/16)
- Post-processing causes display output to disappear in frame output mode [\#14](https://github.com/langurmonkey/gaiasky/issues/14)
- Make new PixelBloomRenderSystem work for frame output and screenshots [\#7](https://github.com/langurmonkey/gaiasky/issues/7)
- Make new PixelBloomRenderSystem work in stereoscopic mode [\#6](https://github.com/langurmonkey/gaiasky/issues/6)

## [0.704b](https://github.com/langurmonkey/gaiasky/tree/0.704b) (2015-03-27)
[Full Changelog](https://github.com/langurmonkey/gaiasky/compare/0.703b...0.704b)

**Implemented enhancements:**

- Remove synchronized render lists [\#12](https://github.com/langurmonkey/gaiasky/issues/12)
- Support top speeds in GUI [\#11](https://github.com/langurmonkey/gaiasky/issues/11)
- Show camera info in free mode [\#10](https://github.com/langurmonkey/gaiasky/issues/10)
- Time selector [\#9](https://github.com/langurmonkey/gaiasky/issues/9)
- Add interface tab to configuration [\#8](https://github.com/langurmonkey/gaiasky/issues/8)
- Internationalize the application [\#5](https://github.com/langurmonkey/gaiasky/issues/5)
- Move node data format to JSON [\#1](https://github.com/langurmonkey/gaiasky/issues/1)

**Fixed bugs:**

- Investigate VM crash [\#4](https://github.com/langurmonkey/gaiasky/issues/4)
- Decide fate of desktop/doc/gaiasandbox\_manual.tex [\#3](https://github.com/langurmonkey/gaiasky/issues/3)

## [0.703b](https://github.com/langurmonkey/gaiasky/tree/0.703b) (2014-12-17)
[Full Changelog](https://github.com/langurmonkey/gaiasky/compare/0.700b...0.703b)

## [0.700b](https://github.com/langurmonkey/gaiasky/tree/0.700b) (2014-12-11)


\* *This Change Log was automatically generated by [github_changelog_generator](https://github.com/skywinder/Github-Changelog-Generator)*
