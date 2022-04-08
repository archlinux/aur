
# graphsrv Change Log

## [Unreleased]
### Added
### Fixed
### Changed
### Deprecated
### Removed
### Security

## [2.1.0]

### Fixed
- fix #36: munge 1.2.0 compatibility issue during install
### Changed
- fix #37: upgrade dependencies

## [2.0.0]

### Added
- support for python 3.7, 3.8, 3.9
### Removed
- support for python < 3.6

## [1.6.1]

### Fixed

- vodka requirements pinned to < 3

## [1.6.0]

### Fixed

- issue with visual glitching and lag under heavy load (#33)
- flask version requirements loosened to allow flask >1.0, <2.0
- move to ctl for package management

## [1.5.1]

### Fixed

- issue with loss bar coloring in smokestack graphs (#32)

## [1.5.0]

### Added

- allow setting up of popover fields through server config
- pass server plot config through to front end (ugly and hacky for now)
- support for d3 number formatting from config
- implement `pass` formatter that just passes the value through,
- implement `int` formatter that parser the value into an integer
- allow turning off inspect in graph config
- allow specifying a different inspect layout in graph config

## [1.4.0]

### Added

- stabilize graph order on default index layout throughout restarts

### Fixed

- stabilize x axis tick size
- Bigger window of inactivity before data feed stoppage is reported

## [1.3.0]

### Added

- Better support for adding new graph types and supporting third party modules

### Fixed

- Show gap after data feed stopped (#20)
- Parsing errors on layout.yaml should no be shown

### Changed

- Changed frontend to be d3.js based, upgrade should be seamless for users
- Custom layout file will now be loaded on top of the default layout, so you no longer need to provide the two default configurations in your custom layout file if you want to keep them. Redefining them in your custom layout however will still override.

## [1.2.0]

### Added

- Index layouts can now have manually built layouts

### Fixed

- Fixed (#22) graphserv does not default to "index" layout if any other layout name is present

## [1.1.3]

### Added

- Loss percentage for smokestack graphs (#15)

### Fixed

- Sometimes grid lines are drawn over graph lines (#16)
- When resizing on the y axis, first plot is unaffected (#17)
- First plot in multitarget graph does not scale properly (#18)

## [1.1.2]

### Fixed

- formatting of graph labels during packet loss in smokestack graph (#14)

## [1.1.1]

### Added

- plugin API (#12)

### [Fixed]

- Smokestack graphs always showing 0 / 0 for loss and count (#13)

## [1.1.0]

### Added

- py3 support
- visiual indicator when data feed has stopped
- graphsrv addons may now supply their own media (js / css)

### Fixed

- NaN format issues on ms formatted labels
- legend sorting stabilized to alphapetical sort

### Changed

- removed the black underlay from graph labels and substituted a text shadow effect instead

### Deprecated
### Removed
### Security

## [1.0.6]

### Fixed

- fix remote graph embedding

## [1.0.5]

### Added

- documentation
- graph config attribute size_y: specifies y tick size
- graph config attribute precision_y: specifies y float precision
- graph config attribute sizes_x: specifies valid sizes for the x axis (this is currently not properly
  supported, and currently will only respect the one size that actually matches the timestamp gap in the
  graph data)

### Fixed

- fixed an issue where using an id field other than "avg" would cause the graph not to render

## [1.0.4]

### Changed

- vodka minimum requirement changed to 2.0.3
- updated static urls in templates to work with vodka request env changes

## [1.0.3]

### Changed
- vodka minimum requirement changed to 2.0.2

## [1.0.2]

### Fixed
- fixed issue where graphs would not render on safari
