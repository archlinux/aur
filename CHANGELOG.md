# Changelog

* [1.2.1](#1-2-1)
* [1.2.0](#1-2-0)
* [1.1.2](#1-1-2)
* [1.1.1](#1-1-1)
* [1.1.0](#1-1-0)
* [1.0.1](#1-0-1)
* [1.0.0](#1-0-0)


## 1.2.1

### Fixed

* Crash when receiving notification with inline image data
  (https://codeberg.org/dnkl/fnott/issues/44).


## 1.2.0

### Added

* Configurable padding of notification text. New `fnottrc` options:
  `padding-vertical` and `padding-horizontal`
  (https://codeberg.org/dnkl/fnott/issues/35).


### Changed

* Default padding is now fixed at 20, instead of depending on the font
  size. This is due to the new `padding-horizontal|vertical` options.


### Fixed

* `fnottctl actions` exiting without receiving a reply.
* Fnott is now much better at surviving monitors being disabled and
  re-enabled (https://codeberg.org/dnkl/fnott/issues/25).
* Wrong font being used when the body and summary (or title and body,
  or title and summary) is set to the same text
  (https://codeberg.org/dnkl/fnott/issues/36).
* Fnott no longer allocates the vertical padding space between summary
  and body text, if the body text is empty
  (https://codeberg.org/dnkl/fnott/issues/41).


### Contributors

* fauxmight
* Rishabh Das


## 1.1.2

### Fixed

* `max-timeout` not having any effect when the timeout is 0
  (https://codeberg.org/dnkl/fnott/issues/32).


## 1.1.1

### Added

* `default-timeout` option, to adjust the timeout when applications
  ask us to pick the timeout
  (https://codeberg.org/dnkl/fnott/issues/27).
* `max-timeout` option (https://codeberg.org/dnkl/fnott/issues/29).


### Changed

* Updated nanosvg to ccdb1995134d340a93fb20e3a3d323ccb3838dd0
  (20210903).


### Removed

* `timeout` option (replaced with `max-timeout`,
  https://codeberg.org/dnkl/fnott/issues/29).


### Fixed

* Icons not being searched for in all icon theme instances
  (https://codeberg.org/dnkl/fnott/issues/17).
* fnott crashing when a notification was received while no monitor was
  attached to the wayland session.
* Wrong colors in (semi-)transparent areas of SVG icons.


### Contributors

* Julian Scheel
* polykernel
* Stanislav Ochotnický


## 1.1.0

### Added

* Configurable minimal width of notifications. New `fnottrc` option:
  `min-width`
* Configurable anchor point and margins. New `fnottrc` options:
  `anchor=top-left|top-right|bottom-left|bottom-right`,
  `edge-margin-vertical`, `edge-margin-horizontal` and
  `notification-margin` (https://codeberg.org/dnkl/fnott/issues/4).
* `-c,--config=PATH` command line option
  (https://codeberg.org/dnkl/fnott/issues/10).
* Text shaping support (https://codeberg.org/dnkl/fnott/issues/13).
* `play-sound` to `fnott.ini`, specifying the command to execute to
  play a sound (https://codeberg.org/dnkl/fnott/issues/12).
* `sound-file`, a per-urgency option in `fnott.ini`, specifying the
  path to an audio file to play when a notification is received
  (https://codeberg.org/dnkl/fnott/issues/12).


### Changed

* Fnott now searches for its configuration in
  `$XDG_DATA_DIRS/fnott/fnott.ini`, if no configuration is found in
  `$XDG_CONFIG_HOME/fnott/fnott.ini` or in `$XDG_CONFIG_HOME/fnottrc`
  (https://codeberg.org/dnkl/fnott/issues/7).
* Assume a DPI of 96 if the monitor’s DPI is 0 (seen on certain
  emulated displays).
* There is now an empty line between the ‘summary’ and ‘body’.


### Deprecated

* `$XDG_CONFIG_HOME/fnottrc` and `~/.config/fnottrc`. Use
  `$XDG_CONFIG_HOME/fnott/fnott.ini` (defaulting to
  `~/.config/fnott/fnott.ini`) instead
  (https://codeberg.org/dnkl/fnott/issues/7).


### Removed

* `margin` option from `fnottrc`


### Fixed

* Notification sometimes not being rendered with the correct subpixel
  mode, until updated.


### Contributors

- yyp (Alexey Yerin)
- Julian Scheel


## 1.0.1

### Added

* `timeout` option to `fnottrc`. This option can be set on a
  per-urgency basis. If both the user has set a timeout, and the
  notification provides its own timeout, the shortest one is used
  (https://codeberg.org/dnkl/fnott/issues/2).
* FreeBSD port (https://codeberg.org/dnkl/fnott/issues/1).


### Fixed

* PPI being incorrectly calculated.
* Crash due to bug in Sway-1.5 when a notification is dismissed,
  either with `fnottctl` or through its timeout, while the cursor is
  above it.


### Contributors

* jbeich


## 1.0.0

Initial release - no changelog. Rough list of features:

* Application title, summary and body fonts can be configured individually
* Icon support, both inline and name referenced (PNG + SVG).
* Actions (requires a dmenu-like utility to display and let user
  select action - e.g. [fuzzel](https://codeberg.org/dnkl/fuzzel))
* Urgency (custom colors and fonts for different urgency levels)
* Markup (**bold**, _italic_ and underline)
* Timeout (notification is automatically dismissed)
