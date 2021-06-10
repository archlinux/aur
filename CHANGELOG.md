### Bug Fixes
- update list of JRE modules for appimage
- untranslatable strings, fixes [#356](https://gitlab.com/langurmonkey/gaiasky/issues/356) [#356](https://gitlab.com/langurmonkey/gaiasky/issues/356)
- music module omited if initialization fails, fixes [#360](https://gitlab.com/langurmonkey/gaiasky/issues/360), [#362](https://gitlab.com/langurmonkey/gaiasky/issues/362) [#360](https://gitlab.com/langurmonkey/gaiasky/issues/360)
- appimage not using bundled JRE. Fixes [#361](https://gitlab.com/langurmonkey/gaiasky/issues/361) [#361](https://gitlab.com/langurmonkey/gaiasky/issues/361)
- readme docs URL
- attitude navigator ball UI scaling
- free camera stops when very close to stars
- particle passing parent translation to children instead of its own
- minimap crash due to shader version not found on some macOS systems
- free mode coordinate command gets doubles instead of floats
- float/double errors and little bugs
- reformulate plx/plx_e > crti
- pad catalog num in launch script
- fix metadata binary verson 1 with long children ids
- wee typos and fixes
- keyframes arrow caps, leftover focus when exiting keyframe mode
- dataset highlight size factor  limits consolidated across UI and scripting
- 'make all particles visible' fix in highlighted datasets
- loading particle datasets crashed sometimes
- STIL loader fails if stars have no extra attributes
- octant id determination in creator
- typo 'camrecorder' -> 'camcorder'

### Build System
- upgrade to install4j 9.0.3
- use jlink instead of manual method to build packaged JRE (appimage)
- remove vamdc repo, add jsoup target version
- add metadata to appimage
- switch to local jsmap library, as vamdc repo looks down
- upgrade libgdx to 1.10.0, bump gs version in build script
- upgrade build system to gradle 7.0
- jsamp maven is down, adding jar to lib

### Documentation
- clean up javadoc comments
- add missing acknowledgements and contributors

### Features
- add first implementation of new component: location log
- add „“ characters to font files, remove unused fonts
- improve logging in shader loader
- increase font size of dataset name in catalog selection and data manager windows
- multiple directional lights in per-pixel-lighting shader
- do not render -Z in cubemap mode if mode is planetarium and aperture > 180
- add dynamic resolution flag to configuration file - for testing purposes only!
- update docs ref
- spacecraft GUI is now a table with a background
- expose backbuffer scale factor to configuration
- add new logo to README file
- separate max num of billboards, labels and velocity vectors in config
- new mwsc description
- improve error dialog, saner default properties
- bump source and config version numbers
- replace BigDecimal with faster Apfloat
- first use of bigdecimal vector to model sgn translation
- add arbitrary precision floating point vector
- add RGB color channels to filter attributes, add XOR operation
- condense date/time in control panel into a single line
- add transition control to dataset settings window
- add number of objects and size to datasets pane
- add support for versioning in metadata binary files
- max octree depth set to 19
- add per-object visibility API calls
- add per-object vis to focus info panel
- add per-object visibility controls
- move visibility property from fade nodes to scene graph nodes

### Style
- migrate missing strings to i18n system, move all I18n.bundle to new I18n.txt
- rename some variables and format some files
- clean up and refactor render code, organize imports in whole project
- some shader formatting
