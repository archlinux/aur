# Changelog

* [1.6.0](#1.6.0)
* [1.5.4](#1-5-4)
* [1.5.3](#1-5-3)
* [1.5.2](#1-5-2)
* [1.5.1](#1-5-1)
* [1.5.0](#1-5-0)
* [1.4.4](#1-4-4)
* [1.4.3](#1-4-3)
* [1.4.2](#1-4-2)
* [1.4.1](#1-4-1)
* [1.4.0](#1-4-0)
* [1.3.0](#1-3-0)
* [1.2.3](#1-2-3)
* [1.2.2](#1-2-2)
* [1.2.1](#1-2-1)
* [1.2.0](#1-2-0)


## 1.6.0

### For packagers

Starting with this release, foot can be PGO:d (compiled using profile
guided optimizations) **without** a running Wayland session. This
means foot can be PGO:d in e.g. sandboxed build scripts. See
[INSTALL.md](INSTALL.md#user-content-performance-optimized-pgo).


### Added

* IME support. This is compile-time optional, see
  [INSTALL.md](INSTALL.md#user-content-options)
  (https://codeberg.org/dnkl/foot/issues/134).
* `DECSET` escape to enable/disable IME: `CSI ? 737769 h` enables IME
  and `CSI ? 737769 l` disables it. This can be used to
  e.g. enable/disable IME when entering/leaving insert mode in vim.
* `dpi-aware` option to `foot.ini`. The default, `auto`, sizes fonts
  using the monitor’s DPI when output scaling has been
  **disabled**. If output scaling has been **enabled**, fonts are
  sized using the scaling factor. DPI-only font sizing can be forced
  by setting `dpi-aware=yes`. Setting `dpi-aware=no` forces font
  sizing to be based on the scaling factor.
  (https://codeberg.org/dnkl/foot/issues/206).
* Implement reverse auto-wrap (_auto\_left\_margin_, _bw_, in
  terminfo). This mode can be enabled/disabled with `CSI ? 45 h` and
  `CSI ? 45 l`. It is **enabled** by default
  (https://codeberg.org/dnkl/foot/issues/150).
* `bell` option to `foot.ini`. Can be set to `set-urgency` to make
  foot render the margins in red when receiving `BEL` while **not**
  having keyboard focus. Applications can dynamically enable/disable
  this with the `CSI ? 1042 h` and `CSI ? 1042 l` escape
  sequences. Note that Wayland does **not** implement an _urgency_
  hint like X11, but that there is a
  [proposal](https://gitlab.freedesktop.org/wayland/wayland-protocols/-/merge_requests/9)
  to add support for this. The value `set-urgency` was chosen for
  forward-compatibility, in the hopes that this proposal eventualizes
  (https://codeberg.org/dnkl/foot/issues/157).
* `bell` option can also be set to `notify`, in which case a desktop
  notification is emitted when foot receives `BEL` in an unfocused
  window.
* `word-delimiters` option to `foot.ini`
  (https://codeberg.org/dnkl/foot/issues/156).
* `csd.preferred` can now be set to `none` to disable window
  decorations. Note that some compositors will render SSDs despite
  this option being used (https://codeberg.org/dnkl/foot/issues/163).
* Terminal content is now auto-scrolled when moving the mouse above or
  below the window while selecting
  (https://codeberg.org/dnkl/foot/issues/149).
* `font-bold`, `font-italic` `font-bold-italic` options to
  `foot.ini`. These options allow custom bold/italic fonts. They are
  unset by default, meaning the bold/italic version of the regular
  font is used (https://codeberg.org/dnkl/foot/issues/169).
* Drag & drop support; text, files and URLs can now be dropped in a
  foot terminal window (https://codeberg.org/dnkl/foot/issues/175).
* `clipboard-paste` and `primary-paste` scrollback search bindings. By
  default, they are bound to `ctrl+v ctrl+y` and `shift+insert`
  respectively, and lets you paste from the clipboard or primary
  selection into the search buffer.
* Support for `pipe-*` actions in mouse bindings. It was previously
  not possible to add a command to these actions when used in mouse
  bindings, making them useless
  (https://codeberg.org/dnkl/foot/issues/183).
* `bold-text-in-bright` option to `foot.ini`. When enabled, bold text
  is rendered in a brighter color
  (https://codeberg.org/dnkl/foot/issues/199).
* `-w,--window-size-pixels` and `-W,--window-size-chars` command line
  options to `footclient` (https://codeberg.org/dnkl/foot/issues/189).
* Short command line options for `--title`, `--maximized`,
  `--fullscreen`, `--login-shell`, `--hold` and `--check-config`.
* `DECSET` escape to modify the `escape` key to send `\E[27;1;27~`
  instead of `\E`: `CSI ? 27127 h` enables the new behavior, `CSI ?
  27127 l` disables it (the default).
* OSC 777;notify: desktop notifications. Use in combination with the
  new `notify` option in `foot.ini`
  (https://codeberg.org/dnkl/foot/issues/224).
* Status line terminfo capabilities `hs`, `tsl`, `fsl` and `dsl`. This
  enables e.g. vim to set the window title
  (https://codeberg.org/dnkl/foot/issues/242).


### Changed

* Blinking text now uses the foreground color, but dimmed down in its
  off state, instead of the background color.
* Sixel default maximum size is now 10000x10000 instead of the current
  window size.
* Graphical glitches/flashes when resizing the window while running a
  fullscreen application, i.e. the 'alt' screen
  (https://codeberg.org/dnkl/foot/issues/221).
* Cursor will now blink if **either** `CSI ? 12 h` or `CSI Ps SP q`
  has been used to enable blinking. **cursor.blink** in `foot.ini`
  controls the default state of `CSI Ps SP q`
  (https://codeberg.org/dnkl/foot/issues/218).
* The sub-parameter versions of the SGR RGB color escapes (e.g
  `\E[38:2...m`) can now be used _without_ the color space ID
  parameter.
* SGR 21 no longer disables **bold**. According to ECMA-48, SGR 21 is
  _”double underline_”. Foot does not (yet) implement that, but that’s
  no reason to implement a non-standard behavior.
* `DECRQM` now returns actual state of the requested mode, instead of
  always returning `2`.


### Removed

* Support for loading configuration from `$XDG_CONFIG_HOME/footrc`.
* `scrollback` option from `foot.ini`.
* `geometry` from `foot.ini`.
* Key binding action `scrollback-up` and `scrollback-down`.


### Fixed

* Error when re-assigning a default key binding
  (https://codeberg.org/dnkl/foot/issues/233).
* `\E[s`+`\E[u` (save/restore cursor) now saves and restores
  attributes and charset configuration, just like `\E7`+`\E8`.
* Report mouse motion events to the client application also while
  dragging the cursor outside the grid.
* Parsing of the sub-parameter versions of indexed SGR color escapes
  (e.g. `\E[38:5...m`)
* Frames occasionally being rendered while application synchronized
  updates is in effect.
* Handling of failures to parse the font specification string.
* Extra private/intermediate characters in escape sequences not being
  ignored.


### Contributors

* [kennylevinsen](https://codeberg.org/kennylevinsen)
* [craigbarnes](https://codeberg.org/craigbarnes)


## 1.5.4

### Changed


* Num Lock by default overrides the keypad mode. See
  **foot.ini**(5)::KEYPAD, or
  [README.md](README.md#user-content-keypad) for details
  (https://codeberg.org/dnkl/foot/issues/194).
* Single-width characters with double-width glyphs are now allowed to
  overflow into neighboring cells by default. Set
  **tweak.allow-overflowing-double-width-glyphs** to ‘no’ to disable
  this.

### Fixed

* Resize very slow when window is hidden
  (https://codeberg.org/dnkl/foot/issues/190).
* Key mappings for key combinations with `shift`+`tab`
  (https://codeberg.org/dnkl/foot/issues/210).
* Key mappings for key combinations with `alt`+`return`.
* `footclient` `-m` (`--maximized`) flag being ignored.
* Crash with explicitly sized sixels with a height less than 6 pixels.
* Key mappings for `esc` with modifiers.


### Contributors

* [craigbarnes](https://codeberg.org/craigbarnes)


## 1.5.3

### Fixed

* Crash when libxkbcommon cannot find a suitable libX11 _compose_
  file. Note that foot will run, but without support for dead keys.
  (https://codeberg.org/dnkl/foot/issues/170).
* Restored window size when window is un-tiled.
* XCursor shape in CSD corners when window is tiled.
* Error handling when processing keyboard input (maybe
  https://codeberg.org/dnkl/foot/issues/171).
* Compilation error _"overflow in conversion from long 'unsigned int'
  to 'int' changes value... "_ seen on platforms where the `request`
  argument in `ioctl(3)` is an `int` (for example: linux/ppc64).
* Crash when using the mouse in alternate scroll mode in an unfocused
  window (https://codeberg.org/dnkl/foot/issues/179).
* Character dropped from selection when "right-click-hold"-extending a
  selection (https://codeberg.org/dnkl/foot/issues/180).


## 1.5.2

### Fixed

* Regression: middle clicking double pastes in e.g. vim
  (https://codeberg.org/dnkl/foot/issues/168)


## 1.5.1

### Changed

* Default value of the **scrollback.multiplier** option in `foot.ini`
  from `1.0` to `3.0`.
* `shift`+`insert` now pastes from the primary selection by
  default. This is in addition to middle-clicking with the mouse.


### Fixed

* Mouse bindings now match even if the actual click count is larger
  than specified in the binding. This allows you to, for example,
  quickly press the middle-button to paste multiple times
  (https://codeberg.org/dnkl/foot/issues/146).
* Color flashes when changing the color palette with OSC 4,10,11
  (https://codeberg.org/dnkl/foot/issues/141).
* Scrollback position is now retained when resizing the window
  (https://codeberg.org/dnkl/foot/issues/142).
* Trackpad scrolling speed to better match the mouse scrolling speed,
  and to be consistent with other (Wayland) terminal emulators. Note
  that it is (much) slower compared to previous foot versions. Use the
  **scrollback.multiplier** option in `foot.ini` if you find the new
  speed too slow (https://codeberg.org/dnkl/foot/issues/144).
* Crash when `foot.ini` contains an invalid section name
  (https://codeberg.org/dnkl/foot/issues/159).
* Background opacity when in _reverse video_ mode.
* Crash when writing a sixel image that extends outside the terminal's
  right margin (https://codeberg.org/dnkl/foot/issues/151).
* Sixel image at non-zero column positions getting sheared at
  seemingly random occasions
  (https://codeberg.org/dnkl/foot/issues/151).
* Crash after either resizing a window or changing the font size if
  there were sixels present in the scrollback while doing so.
* _Send Device Attributes_ to only send a response if `Ps == 0`.
* Paste from primary when clipboard is empty.


### Contributors

* [craigbarnes](https://codeberg.org/craigbarnes)
* [zar](https://codeberg.org/zar)


## 1.5.0

### Deprecated

* `$XDG_CONFIG_HOME/footrc`/`~/.config/footrc`. Use
  `$XDG_CONFIG_HOME/foot/foot.ini`/`~/.config/foot/foot.ini` instead.
* **scrollback** option in `foot.ini`. Use **scrollback.lines**
  instead.
* **scrollback-up** key binding. Use **scrollback-up-page** instead.
* **scrollback-down** key binding. Use **scrollback-down-page**
  instead.


### Added

* Scrollback position indicator. This feature is optional and
  controlled by the **scrollback.indicator-position** and
  **scrollback.indicator-format** options in `foot.ini`
  (https://codeberg.org/dnkl/foot/issues/42).
* Key bindings in _scrollback search_ mode are now configurable.
* `--check-config` command line option.
* **pipe-selected** key binding. Works like **pipe-visible** and
  **pipe-scrollback**, but only pipes the currently selected text, if
  any (https://codeberg.org/dnkl/foot/issues/51).
* **mouse.hide-when-typing** option to `foot.ini`.
* **scrollback.multiplier** option to `foot.ini`
  (https://codeberg.org/dnkl/foot/issues/54).
* **colors.selection-foreground** and **colors.selection-background**
  options to `foot.ini`.
* **tweak.render-timer** option to `foot.ini`.
* Modifier support in mouse bindings
  (https://codeberg.org/dnkl/foot/issues/77).
* Click count support in mouse bindings, i.e double- and triple-click
  (https://codeberg.org/dnkl/foot/issues/78).
* All mouse actions (begin selection, select word, select row etc) are
  now configurable, via the new **select-begin**,
  **select-begin-block**, **select-extend**, **select-word**,
  **select-word-whitespace** and **select-row** options in the
  **mouse-bindings** section in `foot.ini`
  (https://codeberg.org/dnkl/foot/issues/79).
* Implement XTSAVE/XTRESTORE escape sequences, `CSI ? Ps s` and `CSI ?
  Ps r` (https://codeberg.org/dnkl/foot/issues/91).
* `$COLORTERM` is now set to `truecolor` at startup, to indicate
  support for 24-bit RGB colors.
* Experimental support for rendering double-width glyphs with a
  character width of 1. Must be explicitly enabled with
  `tweak.allow-overflowing-double-width-glyphs`
  (https://codeberg.org/dnkl/foot/issues/116).
* **initial-window-size-pixels** options to `foot.ini` and
  `-w,--window-size-pixels` command line option to `foot`. This option
  replaces the now deprecated **geometry** and `-g,--geometry`
  options.
* **initial-window-size-chars** option to `foot.ini` and
  `-W,--window-size-chars` command line option to `foot`. This option
  configures the initial window size in **characters**, and is an
  alternative to **initial-window-size-pixels**.
* **scrollback-up-half-page** and **scrollback-down-half-page** key
  bindings. They scroll up/down half of a page in the scrollback
  (https://codeberg.org/dnkl/foot/issues/128).
* **scrollback-up-line** and **scrollback-down-line** key
  bindings. They scroll up/down a single line in the scrollback.
* **mouse.alternate-scroll-mode** option to `foot.ini`. This option
  controls the initial state of the _Alternate Scroll Mode_, and
  defaults to `yes`. When enabled, mouse scroll events are translated
  to up/down key events in the alternate screen, letting you scroll in
  e.g. `less` and other applications without enabling native mouse
  support in them (https://codeberg.org/dnkl/foot/issues/135).


### Changed

* Renamed man page for `foot.ini` from **foot**(5) to **foot.ini**(5).
* Configuration errors are no longer fatal; foot will start and print
  an error inside the terminal (and of course still log errors on
  stderr).
* Default `--server` socket path to use `$WAYLAND_DISPLAY` instead of
  `$XDG_SESSION_ID` (https://codeberg.org/dnkl/foot/issues/55).
* Trailing empty cells are no longer highlighted in mouse selections.
* Foot now searches for its configuration in
  `$XDG_DATA_DIRS/foot/foot.ini`, if no configuration is found in
  `$XDG_CONFIG_HOME/foot/foot.ini` or in `$XDG_CONFIG_HOME/footrc`.
* Minimum window size changed from four rows and 20 columns, to 1 row
  and 2 columns.
* **scrollback-up/down** renamed to **scrollback-up/down-page**.
* fcft >= 2.3.0 is now required.


### Fixed

* Command lines for **pipe-visible** and **pipe-scrollback** are now
  tokenized (i.e. syntax checked) when the configuration is loaded,
  instead of every time the key binding is executed.
* Incorrect multi-column character spacer insertion when reflowing
  text.
* Compilation errors in 32-bit builds.
* Mouse cursor style in top and left margins.
* Selection is now **updated** when the cursor moves outside the grid
  (https://codeberg.org/dnkl/foot/issues/70).
* Viewport sometimes not moving when doing a scrollback search.
* Crash when canceling a scrollback search and the window had been
  resized while searching.
* Selection start point not moving when the selection changes
  direction.
* OSC 10/11/104/110/111 (modify colors) did not update existing screen
  content (https://codeberg.org/dnkl/foot/issues/94).
* Extra newlines when copying empty cells
  (https://codeberg.org/dnkl/foot/issues/97).
* Mouse events from being sent to client application when a mouse
  binding has consumed it.
* Input events from getting mixed with paste data
  (https://codeberg.org/dnkl/foot/issues/101).
* Missing DPI values for “some” monitors on Gnome
  (https://codeberg.org/dnkl/foot/issues/118).
* Handling of multi-column composed characters while reflowing.
* Escape sequences sent for key combinations with `Return`, that did
  **not** include `Alt`.
* Clipboard (or primary selection) is now cleared when receiving an
  OSC-52 command with an invalid base64 encoded payload.
* Cursor position being set outside the grid when reflowing text.
* CSD buttons to be hidden when window size becomes so small that they
  no longer fit.


### Contributors

* [craigbarnes](https://codeberg.org/craigbarnes)
* [birger](https://codeberg.org/birger)
* [Ordoviz](https://codeberg.org/Ordoviz)
* [cherti](https://codeberg.org/cherti)


## 1.4.4
### Changed

* Mouse cursor is now always a `left_ptr` when inside the margins, to
  indicate it is not possible to start a selection.


### Fixed

* Crash when starting a selection inside the margins.
* Improved font size consistency across multiple monitors with
  different DPI (https://codeberg.org/dnkl/foot/issues/47).
* Handle trailing comments in `footrc`


## 1.4.3
### Added

* Section to [README.md](README.md) describing how to programmatically
  identify foot.
* [LICENSE](LICENSE), [README.md](README.md) and
  [CHANGELOG.md](CHANGELOG.md) are now installed to
  `${datadir}/doc/foot`.
* Support for escaping quotes in **pipe-visible** and
  **pipe-scrollback** commands.


### Changed

* Primary DA to no longer indicate support for _Selective Erase_,
  _Technical Characters_ and _Terminal State Interrogation_.
* Secondary DA to report foot as a VT220 instead of a VT420.
* Secondary DA to report foot's version number in parameter 2, the
  _Firmware Version_. The string is made up of foot's major, minor and
  patch version numbers, always using two digits for each version
  number and without any other separating characters. Thus, _1.4.2_
  would be reported as `010402` (i.e. the full response would be
  `\E[>1;010402;0c`).
* Scrollback search to only move the viewport if the match lies
  outside it.
* Scrollback search to focus match, that requires a viewport change,
  roughly in the center of the screen.
* Extending a selection with the right mouse button now works while
  dragging the mouse.


### Fixed

* Crash in scrollback search.
* Crash when a **pipe-visible** or **pipe-scrollback** command
  contained an unclosed quote
  (https://codeberg.org/dnkl/foot/issues/49).


### Contributors

* [birger](https://codeberg.org/birger)
* [cherti](https://codeberg.org/cherti)


## 1.4.2

### Changed

* Maximum window title length from 100 to 2048.


### Fixed

* Crash when overwriting a sixel and the row being overwritten did not
  cover an entire cell.
* Assertion failure in debug builds when overwriting a sixel image.


## 1.4.1

### Fixed

* Compilation errors in release builds with some combinations of
  compilers and compiler flags.


## 1.4.0

### Added

* `Sync` to terminfo. This is a tmux extension that indicates
  _"Synchronized Updates"_ are supported.
* `--hold` command line option to `footclient`.
* Key mapping for `KP_Decimal`.
* Terminfo entries for keypad keys: `ka1`, `ka2`, `ka3`, `kb1`, `kb3`,
  `kc1`, `kc2`, `kc3`, `kp5`, `kpADD`, `kpCMA`, `kpDIV`, `kpDOT`,
  `kpMUL`, `kpSUB` and `kpZRO`.
* **blink** option to `footrc`; a boolean that lets you control
    whether the cursor should blink or not by default. Note that
    applications can override this.
* Multi-seat support
* Implemented `C0::FF` (form feed)
* **pipe-visible** and **pipe-scrollback** key bindings. These let you
  pipe either the currently visible text, or the entire scrollback to
  external tools (https://codeberg.org/dnkl/foot/issues/29). Example:
  `pipe-visible=[sh -c "xurls | bemenu | xargs -r firefox] Control+Print`


### Changed

* Background transparency to only be used with the default background
  color.
* Copy-to-clipboard/primary-selection to insert a line break if either
  the last cell on the previous line or the first cell on the next
  line is empty.
* Number of lines to scroll is now always clamped to the number of
  lines in the scrolling region..
* New terminal windows spawned with `ctrl`+`shift`+`n` are no longer
  double forked.
* Unicode combining character overflow errors are only logged when
  debug logging has been enabled.
* OSC 4 (_Set Color_) now updates already rendered cells, excluding
  scrollback.
* Mouse cursor from `hand2` to `left_ptr` when client is capturing the
  mouse.
* Sixel images are now removed when the font size is **decreased**.
* `DECSCUSR` (_Set Cursor Style_, `CSI Ps SP q`) now uses `Ps=0`
  instead of `Ps=2` to reset the style to the user configured default
  style. `Ps=2` now always configures a _Steady Block_ cursor.
* `Se` terminfo capability from `\E[2 q` to `\E[ q`.
* Hollow cursor to be drawn when window has lost _keyboard_ focus
  rather than _visual_ focus.


### Fixed

* Do not stop an ongoing selection when `shift` is released. When the
  client application is capturing the mouse, one must hold down
  `shift` to start a selection. This selection is now finalized only
  when the mouse button is released - not as soon as `shift` is
  released.
* Selected cells did not appear selected if programmatically modified.
* Rare crash when scrolling and the new viewport ended up **exactly**
  on the wrap around.
* Selection handling when viewport wrapped around.
* Restore signal mask in the client process.
* Set `IUTF8`.
* Selection of double-width characters. It is no longer possible to
  select half of a double-width character.
* Draw hollow block cursor on top of character.
* Set an initial `TIOCSWINSZ`. This ensures clients never read a
  `0x0` terminal size (https://codeberg.org/dnkl/foot/issues/20).
* Glyphs overflowing into surrounding cells
  (https://codeberg.org/dnkl/foot/issues/21).
* Crash when last rendered cursor cell had scrolled off screen and
  `\E[J3` was executed.
* Assert (debug builds) when an `\e]4` OSC escape was not followed by
  a `;`.
* Window title always being set to "foot" on reset.
* Terminfo entry `kb2` (center keypad key); it is now set to `\EOu`
  (which is what foot emits) instead of the incorrect value `\EOE`.
* Palette re-use in sixel images. Previously, the palette was reset
  after each image.
* Do not auto-resize a sixel image for which the client has specified
  a size. This fixes an issue where an image would incorrectly
  overflow into the cell row beneath.
* Text printed, or other sixel images drawn, on top of a sixel image
  no longer erases the entire image, only the part(s) covered by the
  new text or image.
* Sixel images being erased when printing text next to them.
* Sixel handling when resizing window.
* Sixel handling when scrollback wraps around.
* Foot now issues much fewer `wl_surface_damage_buffer()` calls
  (https://codeberg.org/dnkl/foot/issues/35).
* `C0::VT` to be processed as `C0::LF`. Previously, `C0::VT` would
  only move the cursor down, but never scroll.
* `C0::HT` (_Horizontal Tab_, or `\t`) no longer clears `LCF` (_Last
  Column Flag_).
* `C0::LF` now always clears `LCF`. Previously, it only cleared it
  when the cursor was **not** at the bottom of the scrolling region.
* `IND` and `RI` now clears `LCF`.
* `DECAWM` now clears `LCF`.
* A multi-column character that does not fit on the current line is
  now printed on the next line, instead of only printing half the
  character.
* Font size can no longer be reduced to negative values
  (https://codeberg.org/dnkl/foot/issues/38).


## 1.3.0

### Added

* User configurable key- and mouse bindings. See `man 5 foot` and the
  example `footrc` (https://codeberg.org/dnkl/foot/issues/1)
* **initial-window-mode** option to `footrc`, that lets you control
  the initial mode for each newly spawned window: _windowed_,
  _maximized_ or _fullscreen_.
* **app-id** option to `footrc` and `--app-id` command line option,
  that sets the _app-id_ property on the Wayland window.
* **title** option to `footrc` and `--title` command line option, that
  sets the initial window title.
* Right mouse button extends the current selection.
* `CSI Ps ; Ps ; Ps t` escape sequences for the following parameters:
  `11t`, `13t`, `13;2t`, `14t`, `14;2t`, `15t`, `19t`.
* Unicode combining characters.


### Changed

* Spaces no longer removed from zsh font name completions.
* Default key binding for _spawn-terminal_ to ctrl+shift+n.
* Renderer is now much faster with interactive scrolling
  (https://codeberg.org/dnkl/foot/issues/4)
* memfd sealing failures are no longer fatal errors.
* Selection to no longer be cleared on resize.
* The current monitor's subpixel order (RGB/BGR/V-RGB/V-BGR) is
  preferred over FontConfig's `rgba` property. Only if the monitor's
  subpixel order is `unknown` is FontConfig's `rgba` property used. If
  the subpixel order is `none`, then grayscale antialiasing is
  used. The subpixel order is ignored if antialiasing has been
  disabled.
* The four primary font variants (normal, bold, italic, bold italic)
  are now loaded in parallel. This speeds up both the initial startup
  time, as well as DPI changes.
* Command line parsing no longer tries to parse arguments following
  the command-to-execute. This means one can now write `foot sh -c
  true` instead of `foot -- sh -c true`.


### Removed

* Keyboard/pointer handler workarounds for Sway 1.2.


### Fixed

* Sixel images moved or deleted on window resize.
* Cursor sometimes incorrectly restored on exit from alternate screen.
* 'Underline' cursor being invisible on underlined text.
* Restored cursor position in 'normal' screen when window was resized
  while in 'alt' screen.
* Hostname in OSC 7 URI not being validated.
* OSC 4 with multiple `c;spec` pairs.
* Alt+Return to emit "ESC \r".
* Trackpad sloooow scrolling to eventually scroll a line.
* Memory leak in terminal reset.
* Translation of cursor coordinates on resize
* Scaling color specifiers in OSC sequences.
* `OSC 12 ?` to return the cursor color, not the cursor's text color.
* `OSC 12;#000000` to configure the cursor to use inverted
  foreground/background colors.
* Call `ioctl(TIOCSCTTY)` on the pts fd in the slave process.


## 1.2.3

### Fixed
* Forgot to version bump 1.2.2


## 1.2.2

### Changed

* Changed icon name in `foot.desktop` and `foot-server.desktop` from
  _terminal_ to _utilities-terminal_.
* `XDG_SESSION_ID` is now included in the server/daemon default socket
  path.


### Fixed

* Window size doubling when moving window between outputs with
  different scaling factors (https://codeberg.org/dnkl/foot/issues/3).
* Font being too small on monitors with fractional scaling
  (https://codeberg.org/dnkl/foot/issues/5).


## 1.2.1

### Fixed

* Building AUR package


## 1.2.0

### Added

* Run-time text resize using ctrl-+, ctrl+- and ctrl+0
* Font size adjusts dynamically to outputs' DPI
* Reflow text when resizing window
* **pad** option to `footrc`
* **login-shell** option to `footrc` and `--login-shell` command line
  option
* Client side decorations (CSDs). This finally makes foot usable on
  GNOME.
* Sixel graphics support
* OSC 12 and 112 escape sequences (set/reset text cursor color)
* REP CSI escape sequence
* `oc` to terminfo
* foot-server.desktop file
* Window and cell size reporting escape sequences
* `--hold` command line option
* `--print-pid=FILE|FD` command line option


### Changed

* Subpixel antialiasing is only enabled when background is opaque
* Meta/alt ESC prefix can now be disabled with `\E[?1036l`. In this
  mode, the 8:th bit is set and the result is UTF-8 encoded. This can
  also be disabled with `\E[1024l` (in which case the Alt key is
  effectively being ignored).
* terminfo now uses ST instead of BEL as OSC terminator
* Logging to print to stderr, not stdout
* Backspace now emits DEL (^?), and ctrl+backspace emits BS (^H)


### Removed

* '28' from DA response
