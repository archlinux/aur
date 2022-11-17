# Changelog

* [1.3.0](#1-3-0)
* [1.2.1](#1-2-1)
* [1.2.0](#1-2-0)
* [1.1.2](#1-1-2)
* [1.1.1](#1-1-1)
* [1.1.0](#1-1-0)
* [1.0.1](#1-0-1)
* [1.0.0](#1-0-0)


## 1.3.0

### Added

* Support for a “progress” hints, `notify-send -h int:value:20 ...`,
  ([#51][51]).
* `title-format`, `summary-format` and `body-format` options, allowing
  you to customize the rendered strings. In this release, the `%a`,
  `%s`, `%b` and `%%` formatters, as well as `\n`, are
  recognized. ([#39][39]).
* Added configuration option `layer` to specify the layer on which notifications
  are displayed. Values include `background`, `top`, `bottom`, and `overlay`
  ([#71][71]).

[51]: https://codeberg.org/dnkl/fnott/issues/51
[39]: https://codeberg.org/dnkl/fnott/issues/39
[71]: https://codeberg.org/dnkl/fnott/issues/71


### Changed

* Minimum required meson version is now 0.58.
* Notification text is now truncated instead of running into, and
  past, the vertical padding ([#52][52]).
* All color configuration options have been changed from (A)RGB
  (i.e. ARGB, where the alpha component is optional), to RGBA. This
  means **all** color values **must** be specified with 8 digits
  ([#47][47]).

[52]: https://codeberg.org/dnkl/fnott/issues/52
[47]: https://codeberg.org/dnkl/fnott/issues/47


### Removed

* `$XDG_CONFIG_HOME/fnottrc` and `~/.config/fnottrc`. Use
  `$XDG_CONFIG_HOME/fnott/fnott.ini` (defaulting to
  `~/.config/fnott/fnott.ini`) instead ([#7][7]).

[7]: https://codeberg.org/dnkl/fnott/issues/7


### Fixed

* Scale not being applied to the notification’s size when first
  instantiated ([#54][54]).
* Fallback to `/etc/xdg` if `XDG_CONFIG_DIRS` is unset.
* Icon lookup is now better at following the XDG specification
  ([#64][64]).
* Setting `max-width` and/or `max-height` to 0 no longer causes fnott
  to crash. Instead, a zero max-width/height means there is no limit
  ([#66][66]).

[54]: https://codeberg.org/dnkl/fnott/issues/54
[64]: https://codeberg.org/dnkl/fnott/issues/64
[66]: https://codeberg.org/dnkl/fnott/issues/66


### Contributors

* bagnaram
* Humm
* Leonardo Hernández Hernández
* Mark Stosberg
* merkix


## 1.2.1

### Fixed

* Crash when receiving notification with inline image data
  ([#44][44]).

[44]: https://codeberg.org/dnkl/fnott/issues/44


## 1.2.0

### Added

* Configurable padding of notification text. New `fnottrc` options:
  `padding-vertical` and `padding-horizontal` ([#35][35]).

[35]: https://codeberg.org/dnkl/fnott/issues/35


### Changed

* Default padding is now fixed at 20, instead of depending on the font
  size. This is due to the new `padding-horizontal|vertical` options.


### Fixed

* `fnottctl actions` exiting without receiving a reply.
* Fnott is now much better at surviving monitors being disabled and
  re-enabled ([#25][25]).
* Wrong font being used when the body and summary (or title and body,
  or title and summary) is set to the same text ([#36][36]).
* Fnott no longer allocates the vertical padding space between summary
  and body text, if the body text is empty ([#41][41]).

[25]: https://codeberg.org/dnkl/fnott/issues/25
[36]: https://codeberg.org/dnkl/fnott/issues/36
[41]: https://codeberg.org/dnkl/fnott/issues/41


### Contributors

* fauxmight
* Rishabh Das


## 1.1.2

### Fixed

* `max-timeout` not having any effect when the timeout is 0
  ([#32][32]).

[32]: https://codeberg.org/dnkl/fnott/issues/32


## 1.1.1

### Added

* `default-timeout` option, to adjust the timeout when applications
  ask us to pick the timeout ([#27][27]).
* `max-timeout` option ([#29][29]).

[27]: https://codeberg.org/dnkl/fnott/issues/27
[29]: https://codeberg.org/dnkl/fnott/issues/29


### Changed

* Updated nanosvg to ccdb1995134d340a93fb20e3a3d323ccb3838dd0
  (20210903).


### Removed

* `timeout` option (replaced with `max-timeout`, [#29][29]).


### Fixed

* Icons not being searched for in all icon theme instances
  ([#17][17]).
* fnott crashing when a notification was received while no monitor was
  attached to the wayland session.
* Wrong colors in (semi-)transparent areas of SVG icons.

[17]: https://codeberg.org/dnkl/fnott/issues/17


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
  `notification-margin` ([#4][4]).
* `-c,--config=PATH` command line option ([#10][10]).
* Text shaping support ([#13][13]).
* `play-sound` to `fnott.ini`, specifying the command to execute to
  play a sound ([#12][12]).
* `sound-file`, a per-urgency option in `fnott.ini`, specifying the
  path to an audio file to play when a notification is received
  ([#12][12]).

[4]: https://codeberg.org/dnkl/fnott/issues/4
[10]: https://codeberg.org/dnkl/fnott/issues/10
[13]: https://codeberg.org/dnkl/fnott/issues/13
[12]: https://codeberg.org/dnkl/fnott/issues/12


### Changed

* Fnott now searches for its configuration in
  `$XDG_DATA_DIRS/fnott/fnott.ini`, if no configuration is found in
  `$XDG_CONFIG_HOME/fnott/fnott.ini` or in `$XDG_CONFIG_HOME/fnottrc`
  ([#7][7]).
* Assume a DPI of 96 if the monitor’s DPI is 0 (seen on certain
  emulated displays).
* There is now an empty line between the ‘summary’ and ‘body’.

[7]: https://codeberg.org/dnkl/fnott/issues/7


### Deprecated

* `$XDG_CONFIG_HOME/fnottrc` and `~/.config/fnottrc`. Use
  `$XDG_CONFIG_HOME/fnott/fnott.ini` (defaulting to
  `~/.config/fnott/fnott.ini`) instead ([#7][7]).

[7]: https://codeberg.org/dnkl/fnott/issues/7


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
  ([#2][2]).
* FreeBSD port ([#1][1]).

[1]: https://codeberg.org/dnkl/fnott/issues/1


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
