# Changelog

All the changes made to runa are documented here.

## [0.6.2] - 2026-02-02

### Patch to input mode

### Fixed
- **Input mode**: New `g` prefix keybind now correctly ignores normal input when typing.


---


## [0.6.1] - 2026-02-01

### Patch to keymap

### Fixed
- Keymap: Prefix actions (e.g., `g` + `h` for "Go to home") no longer overwrite or conflict with single-key actions (`h`, `p`, etc.) after removing their insertion into the main keymap. Now you can use the same keys both for navigation and for prefix commands.


---


## [0.6.0] - 2026-02-01

### New overlay and keybindings for easier navigation of directories and entries.

### Added
- **`g` prefix navigation:** Implemented the `"g"` prefix to quickly jump to the first selection (`go_to_top`), to the home (`go_to_home`) or a specific path (`go_to_path`).
- **`go_to_path` function:** Added the ability to jump to a specific path using `fd`-powered auto-complete.
- **Go To Help overlay:** Introduced a smart overlay widget that visualizes available `"g"` prefix navigation options.
- **Configurable `go_to` bindings:** `go_to_top`, `go_to_path`, `go_to_home` actions in `[keys]` config; these are triggered by the `"g"` prefix.
- **Cycling directory autocomplete:** Added stateful, cycling directory autocomplete with Tab in path entry prompts, allowing to cycle and select directory completions from the current input.

### Fixed
- **Empty parent content**: Fixed parent pane being blank when starting runa in a empty directory.
- **Display layout**: Fixed `[display.layout]` being forced to always include all the layout options keys.
- **Broken previews**: Fixed edge case where previews of library/object files (`.a`) could cause the UI to break.

### Changed
- **AUR PKGBUILD**: Moved the PKGBUILD and the aur.yml action workflow into a dedicated [runa-packaging](https://github.com/alexm-dev/runa-packaging).
- **Keymap refactor:** Separated binding helpers and `parse_key` for improved maintainability and clarity.


---


### [0.5.13] - 2026-01-30

Small packaging update.

### Added
- Release assets: Added Windows ARM64 (aarch64) binary to release archives.
- CLI help: Added `--version, -v` to cli `--help` message.

### Changed
- Artifact structure and release workflow: Release archives now always include a top-level folder. Assets include full documentation and license files.
- Release process: All release tags from this version onward are signed
- Branding: Updated terminology to describe `runa` as a `file manager` rather than a `file browser` (no functional changes).


---


## [0.5.12] - 2026-01-29

### Added
- `exe_color`: Added executable coloring to Windows.

### Fixed
- File preview: Correctly update file previews after opening or editing a file and closing the editor.
- `fd` and `bat` checks: Fixed cached checks for `bat` and `fd` to now correctly apply the actually found binary instead of re-checking.
- Preview selection: Selection highlight now synchronizes exactly with directory/file preview changes.

### Changed
- `instant_preview`: Now set to true by default.
- Preview debounce: Reduced debounce interval from 75ms to 50ms for a snappier preview.

### Internal
- Preview directory: Removed legacy directory preview function that was never used by internal preview since the worker threads update.


---


## [0.5.11] - 2026-01-25

Patch and fixes to copy logic.

### Added
- Icons: Added more nerd font icon variants to special folders and files.

### Fixed
- Copy: Hardened copy logic to correctly check paths before attempting a copy action
- Folders: No longer create a destination folder if the copy/move action fails due to a permission error or other failure. This prevents creation of empty or partially-created directories on failed actions.
- Move: Input of move action now accepts `~` as a valid path to the home directory.

### Changed
- Icons: Changed the default file nerd font icon from `\uf0f6` to `\uf15b`
- Initial CLI: Changed initial CLI message after running runa for the first time and no `runa.toml` exists.


---

## [0.5.8], [0.5.9], [0.5.10] - void

**Skipped releases:**  
Versions `v0.5.8`, `v0.5.9`, and `v0.5.10` were not published due to release process issues related to enabling immutable releases on GitHub.
No assets or release notes exist for these versions.

All planned changes and fixes from 0.5.8 are included in `v0.5.11`.

---


## [0.5.7] - 2026-01-24

Improved symlink support, improvements to theming and performance optimizations.  
**Note:** Some settings in your `runa.toml` config **must now be placed under a `[general]` section** (see Breaking Changes).

### Added
- `show_symlink`: Symlinks can be toggled now.
- Symlink coloring: Added coloring for symlinks beyond just the symlink target coloring.
- `exe_color`: Added coloring for executables/binaries on unix.
- `entry_count`: Count of the entries in the current directory. Choose between: `"footer"`, `"header"` or `"none"`, to choose where to show the entry count or to disable it.
- Symlink tracking: Added symlink logic to indicate if links are broken or not.

### Breaking Changes
- `[general]` section in runa.toml: Wrapped the general settings like `dirs_first`, `show_hidden`, etc., to `[general]`.  
If runa feels "reset" after the update, ensure your settings are under the new `[general]` header..
- Before:

    ```toml
    dirs_first = true
    show_hidden = true
    move_to_trash = true
    ```
- Now:

    ```toml
    [general]
    dirs_first = true
    show_hidden = true
    move_to_trash = true
    ```


### Changed
- Symlink sorting: Symlinks now are correctly sorted.
- `bat` preview method: Made `wrap = false` to default.
- `MAX_PREVIEW_SIZE`: Set the maximum file size for previews to 5gb.  
Note: Internal preview reads only pane-visible lines, so RAM usage remains minimal regardless of file size. The limit is a precaution against processing excessively large files.

### Internal
- Performance: `filter_entries` optimized to instead check ASCII stack buffer AND fallback to unicode if file entries are non ascii.
- Performance: `display_path` is now cached in `NavState` to not create a new path string everytime.
- Performance: Removed `readable_path` to instead use `clean_display_path` for a optimized path string.
- Performance: Cache symlink status in FileEntry to avoid recalculating symlink flags during UI rendering.


---


## [0.5.6] - 2026-01-21

Performance improvements and polish.  
Overall improvement of error handling.

### Added
- `alternate_delete`: Keybind to switch between moving files to trash and permanently deleting files. [(#29)](https://github.com/alexm-dev/runa/pull/29)

### Fixed
- No filter result flicker: Fixed a flicker showing `[No results for this filter]` when navigating in and out of a filtered dir. [(1ab1b05)](https://github.com/alexm-dev/runa/commit/1ab1b05a590ea2cc2231470a0d2836fc7365cf10)
- Unfiltered content flash: Fixed a very subtle stale content update when moving **out** of a filtered dir. [(7ce0469)](https://github.com/alexm-dev/runa/commit/7ce0469d56bea0e2db4482f9128d2820c8af01e5)
- Filter selection: Fixed filter removing the selection index after moving out of a filtered entry. [(3d82a31)](https://github.com/alexm-dev/runa/commit/3d82a31566417d7c6da3f251bf606d7d3a630424)

### Changed
- Visibility refactor: Set function visibility to crate only. [(#29)](https://github.com/alexm-dev/runa/pull/29)
- `fd` check: Hardened how runa checks for `fd` and handles errors if not available. [(ea7d9cb)](https://github.com/alexm-dev/runa/commit/ea7d9cb2f074519eac6271f5ebe5a0725d84f014)
- `FileOperation::Copy`: Improved copy error handling. [(ac0e7ed)](https://github.com/alexm-dev/runa/commit/ac0e7ede08cb38b71102f3f8eb7920085f4552ec)
- `open_in_editor`: Hardened open in editor logic to catch false argument errors. [(#29)](https://github.com/alexm-dev/runa/pull/29)
- `handle_go_into_dir`: Hardened handler to catch recursive loop errors via circular links. [(15a258c)](https://github.com/alexm-dev/runa/commit/15a258c5a5ca749c8cf37010efa88b1c824458f0)
- `handle_move`: Hardened move handler to catch potential moving of parent dir into subdir logic error. [(0292897)](https://github.com/alexm-dev/runa/commit/02928972ab824f44c2427b542409cddd267bee6e)

### Internal
- Performance: Improved performance of `preview_with_bat`. [(ea7d9cb)](https://github.com/alexm-dev/runa/commit/ea7d9cb2f074519eac6271f5ebe5a0725d84f014)
- Performance: Removed lowercase_name field from FileEntry resulting in less allocations. [(7c591f9)](https://github.com/alexm-dev/runa/commit/7c591f9dac9feb368367d3e3cb0827719b4d8c15)
- Performance: Changed `sort_entries` to by sort_by_chached_key instead of simple sort_by. [(0d1a8c9)](https://github.com/alexm-dev/runa/commit/0d1a8c9c58db438fee2cda4530721affa108b4bf)
- Performance: Optimized `render_root_and_header` by reducing string allocations. [(fea03f3)](https://github.com/alexm-dev/runa/commit/fea03f3337b7e698f7446e9d1051af009d8f45c9)
- Performance: Optimized `ui/icons` lowercase string checks. [(0d1a8c9)](https://github.com/alexm-dev/runa/commit/0d1a8c9c58db438fee2cda4530721affa108b4bf)
- Performance: Optimized worker threads by removing redundant string conversions during message handling.
- Inline attributes: Added inline attributes to getter functions. [(#29)](https://github.com/alexm-dev/runa/pull/29)
- Tests: Added core/fm and app/state integration tests. [(#29)](https://github.com/alexm-dev/runa/pull/29)

---


## [0.5.5] - 2026-01-19

Quick patch to fix Cargo.toml issue

### Fixed
- Cargo.toml: removed invalid `documentation` field to fix publish issues.
- Pinned exact versions of dependencies to ensure reproducible builds:
  - `crossbeam-channel = "0.5.15"`
  - `chrono = "0.4.43"`

---


## [0.5.4] - 2026-01-19

### Added
- Move function: New move function, by default mapped to `m`, moves files to a directory via input. [(#25)](https://github.com/alexm-dev/runa/pull/25)
- Move widget auto-complete: New move function input has auto-complete, to make it easier to find paths to move into. [(#25)](https://github.com/alexm-dev/runa/pull/25)
- Dialog separators: Added horizontal separators to Delete, Move and Find widgets/dialogs, to visually separate input from the rest of the widget.
- Move to trash: Toggle to enable files to be moved to trash instead of permanent deletion.
- CLI path start: Added a way to start `runa` at a different path via CLI args.

### Fixed
- Preview width truncation: Now correctly requests a initial preview based on the actual pane width of the preview pane

### Changed
- Layout metrics debounce for preview: Added a debounce for layout metrics changes, resulting in fewer preview requests for changing the terminal size.
- Navigation hardening: Navigation is now hardened to correctly stop navigation when a directory is permission denied.
- Integration tests: Moved integration tests to their specific modules instead of a central `tests/` directory.


---


## [0.5.3] - 2026-01-17

Quick fix for selection entry flicker and `"[Empty]"` flicker on terminals like Windows Terminal.

### Fixed
- **Selection flicker**: The set_path function no longer resets the selection index to 0 or clears the entries prematurely.  
This eliminates rapid flickering of the selection highlight and the `[Empty]` label when navigating directories, especially on Windows terminals.


---


## [0.5.2] - 2026-01-16

File entry performance improvements. `runa` should now feel much smoother in larger directories.

### Added
- **New Theme presets**: Added more theme presets. [(#23)](https://github.com/alexm-dev/runa/pull/23)
- **Selection mode**: Added a new toggle to disable or enable the selection coloring modes for the parent and or the preview pane [(#24)](https://github.com/alexm-dev/runa/pull/24)

### Changed
- **FileEntry refactor**: Refactored FileEntry and `core/fm` for substantial performance improvements [(#21)](https://github.com/alexm-dev/runa/pull/21)
- **UI module refactor**: Improved UI modules for better maintainability [(#20)](https://github.com/alexm-dev/runa/pull/20)
- **Theming**: Changed how parent and preview panes now use selection and entry theme fields in ui/render as overrides instead [(#20)](https://github.com/alexm-dev/runa/pull/20)

### Internal
- `runa` is now using dual-license with `MIT` OR `Apache-2.0`


---


## [0.5.1] - 2026-01-11

### Added
- **bat integration**: Added `bat` as an preview option to the internal preview. Can be set in `runa.toml` under `[display.preview_options]`
- **Clear Markers/Filters**: Added a `clear_filters` and `clear_markers` keybind option to clear either.
- **Icons**: Added optional nerd font icons. Is desabled by default.
- **Dynamic find widget**: Made the find widget more customizable by adding a `find_visible_results` option.

### Fixed
- **Parent pane**: Fixed the parent pane stale content update **and** optimized the parent directory selection being reset and redrawn after every directory change.
- **Directory Marker**: Fixed the `dir_marker` option to toggle the `/` for all panes.
- **Internal defaults**: All theme options now correctly respect the internal defaults. Writing `"default"` now correctly applies internal default.

### Breaking Changes
- **Dialog Size Configuration (`DialogSize::Custom`) now uses cells, not percentages:**
  - All custom dialog size values specified as arrays (e.g. `size = [70, 20]`) are now interpreted as exact cell (column/row) counts instead of percentages.
  - **Before:** `size = [70, 20]` meant 70% width and 20% height of the terminal area.
  - **Now:** `size = [70, 20]` means 70 columns wide and 20 rows tall.
  - Presets like `size = "small"` remain percentage-based.
  - **If you had custom dialog sizes or positions configured previously, please review your `runa.toml` and update values for your preferred appearance.**

### Changed
- **fd exclusions**: Switched to using a central exclusion map for `fd` searches. Added multiple default directories (e.g., `.git`, `node_modules`, `target`, `venv`, etc.) to reduce noise and improve relevance when searching. This also makes it easier to maintain and update the exclusion list.

### Internal
- **Core refactor**: Moved `formatter.rs` from utils/ to core/, since formatter now handles all core formatting logic of multiple functions.
- **Renamed file_manager.rs**: `file_manager.rs` is renamed to `rm.rs` to keep it more simple :)
- **Renamed find**: `find.rs` is renamed to `proc.rs` since it now handles all subprocesses spawned by runa.


---


## [0.5.0] - 2026-01-08

UI related additions and more.

### Added
- **Marker coloring**: Added a new `clipboard` config option to color the yanked and selected entries with a different marker color. Now its easier to indicate which entry was yanked.
- **Pane markers**: Added markers to panes. Now persistent markers will be shown/rendered in each preview and parent pane.
- **Toggle Marker jump**: Added `toggle_marker_jump` configuration option to theme.display to toggle if multiselect should jump to the first entry when the selection is at the last entry.
- **Instant Preview**: Added `instant_preview` configuration option to toggle between instant preview (requesting previews on every selection change) and pending previews. Off by default.
- **Empty filter**: Added a `No results for this filter` message when a filter applied shows no entries.

### Breaking Changes
- The keys `selection_fg` / `selection_bg` from `[theme.preview]` / `[theme.parent]` are now replaced by `selection.fg` / `selection.bg` or `[theme.preview.selection]` / `[theme.parent.selection]`
    - **New keys**:
    ```toml
    [theme.preview]
    fg = "default"
    bg = "default"
    selection.fg = "default"
    selection.bg = "default"

    ## Sub tables:

    [theme.preview.selection]
    fg = "default"
    bg = "default"
    ```
- If you set the selection colors for each pane, then these changes are breaking changes for you config.

### Fixed
- **Directory copy**: Fixed directories being unable to be copied.
- **Filter preview update**: Fixed preview data not being cleared when a filter shows no entries.
- **Config defaults:** `RawConfig` now explicitly sets default values for all fields, ensuring core options like `dirs_first` and `show_hidden` are enabled when configuration is omitted.

### Internal
- **Find**: Optimization for the find feature. Now lists the results faster.
- **Cargo update**: Dependencies updated to patch crates.
- **Worker thread API**: Worker thread spawnm functions are now private functions since worker threads are now spawned through `Workers` struct.
- **Preview constants**: Moved preview byte size and line count checks to the top of `core/workers.rs` for better clarity and maintainability.


---


## [0.4.0] - 2026-01-06

New feature update: The fuzzy finder.

### Added
- **Find function**: Added a new (fuzzy) find function to quickly search your directories and files.
    - Note: This feature optionally leverages the external tool [fd](https://github.com/sharkdp/fd) for high-performance recursive traversal.
- **Scrollable find results**: Added a scroll able find result list to the new find function to scroll through the results in the widget.
- **Persistent filters**: Made filters persist for each directory it is applied to.
- **Configurable maximum find results**: Added a new configuration to change the internal defaults for the new find function. (Internal default is 2000).
- **Internal themes**: Added internal themes which can be set in the `runa.toml` config.

### Fixed
- **Parent pane**: Fixed a stale parent content request after initial startup of runa.
- **Pane Requests**: Improved ID handling for pane requests, making request IDs more robust and reliable.

### Internal
- **Code file structure**: Refactored modules and sub-modules for better maintainability. In example: Moved **core** runa modules, like `file_manager`, `worker`, etc. into `core`.
- **Worker thread separation**: Separated worker threads to individual lines for better performance. FileOp, Nav, Find and IO have each their own worker now.
- **External binary detection**: Integrated which for graceful detection of the fd search backend, providing user notifications if the tool is missing.
- **Tests**: Added new `find` related tests.

---


## [0.3.10] - 2025-12-30

Quick configuration generation patch when `runa.toml` is generated with `rn --init-full`

### Fixed
- **Initial configuration**: Fixed full `runa.toml` initial config generation made by cli arg `rn --init-full`. Now generates the correct configuration and honors the internal defaults.


---


## [0.3.9] - 2025-12-30

### Added
- **Path string**: Display `~` for the home directory at the top of the TUI instead of the full absolute path.

### Changed
- **Internal default colors**: Changed internal default colors of `border`, `selection`, `titles` and `directory`.
**show_hidden**: Enabled `show_hidden` by default and is set to enabled internally.
- **Parent Pane**: Removed root indicator `/` in the parent pane, since `path_str` handles that in `ui.rs`.


---


### Changed

## [0.3.8] - 2025-12-30

Quick integration test patch for a more robust testing of runa with `cargo test`.

### Internal
**Testing**: Improved error handling and sandboxing of `nav_tests`, `utils_tests`, `worker_tests`, and `ui_tests`


---


## [0.3.7] - 2025-12-30

Quick patch to fix the cli message to show the correct cli args.

### Fixed
- **CLI message**: Fixed cli initial message to correctly show the cli args. `--init-minimal` to `--init-full`
- **Formatter** Fixed `formatter.rs` warning showing unused import for unix in `format_attributes`.

### Changed
- **Widget Size Default**: Adjusted the default for dialog widgets to DialogSize::Small.


---


## [0.3.6] - 2025-12-30

### Added
- **Overlay widgets**: Added support for overlay widgets to dynamically toggle between widgets. Implemented the ShowInfo overlay as the first one.
- **ShowInfo**: Implemented the new showinfo overlay for file information.
- **Toggle Marker Advance**: Improved marker toggle logic. Now jumps to the next entry to make marking more seamless and easier.
- **Border shape**: Added border shapes to configuration. "square", "rounded" or "double".
- **Status line configuration**: Added status line configuration options.

### Changed
- Refactored dialog position logic for all widgets: Dialogs that use `TopLeft`, `TopRight`, or `Custom()` now appear a few rows lower in unified border mode so they never cover status or title lines

### Fixed
- **Input fields**: Input widgets now dynamically crop/scroll horizontally and keep the widget size during terminal resize.

### Internal
- **Theme/Config Consistency**: Dialog style, position, and size are now fully driven from theme/configuration.
- New `dialog_position_unified` and `adjusted_dialog_position` helpers to help with the widget drawing modes for each border mode.
- **Dependencies**: Added `humansize` and `chrono` crates for ShowInfo overlay widget.


---


## [0.3.5] - 2025-12-28

### Fixed
- **Preview Pane**: Resolved a race condition that caused a brief flash of old directory entries when rapidly navigating between folders immediately after startup.

### Internal
- **Allocation Optimization**: Optimized `tick()` in `app.rs` to pre-calculate the selected path, reducing the times `PathBuf` and string joins are done during the tick loop.


---


## [0.3.4] - 2025-12-28

### Added
- **Input polish**: Added cursor movement within input fields.
- **File collision**: Added `get_unused_path` to utils.rs. It now becomes `test_1.txt` instead of colliding.

### Fixed
- **Nav persistence**: The cursor now follows the file name when filtering. No more jumping back to the top when you type.

### Internal
- **Hardened NavState**: Threw 1 million iterations at the navigation math. It’s rock solid now.
- **Refactoring**: Renamed `popup` to `dialog` across codebase for better naming. (Just feels better).
- **Testing**: Added a bunch more of unit tests.
- **Documentation**: Added some documentation of code and modules. Still working on more...

---


## [0.3.3] - 2025-12-26

### Internal
- **Dependency update**: Updated `unicode-width` from `0.2.0` to `0.2.2`


---


## [0.3.2] - 2025-12-26

### Internal
- **Terminal backend update**: Updated `ratatui` from `0.29.0` to `0.30.0`


---


## [0.3.1] - 2025-12-26

### Changed
- **README image scaling**: Fixed image sizing so screenshots render correctly for github and crates.io


---


## [0.3.0] - 2025-12-26

The first release under the name of `runa` :D
This is a big one.
`runa` is now officialy a file browser. v0.3.0 is still the beginning, there will be more good things to come...

### Added
- **File actions**: Create files, create directories, copy (yank) and paste files/directories, delete files/directories, rename files/directories
- **Filtering**: Filter through the current directory to only select what you need.
- **Customizable widgets**: Customize all the popup widgets, Customize the Multiselect marker, Customize the positions of the widgets, Customize the coloring of the widgets.
- **Multiselect**: Select and act on multiple files at once.
- **Customizable keybindings for file actions**: Improved keymapping to enable modifiers for all actions.
- **Status line**: See the applied filter, see the amount of files being yanked/copied
- **New [theme.widgets] config section.** for widget styling. Customize the entire positions and size if you desire.

### Fixed
- **Path info**: Path info is now using correct padding.

### Internal
- **Tons of refactors**: Added new modoules: app/actions, app/handlers to help seperate AppState logic.
- **Keymapping**: Removed keycode_to_str for usage of Keymap struct, that maps all the keys correctly and more efficient.
- **Widget deserialization**: Implemented a custom deserialization method for widgets to ease config verbosity.

And much more...

I wish you all a Merry Christmas!


---


## [0.2.14] - 2025-12-23

### Changed
- Finalized the change from **runner** to **runa**
- All project references now use **runa**, **runa-tui** and the binary **rn**

---

## [0.2.13] - 2025-12-23

## Changed
- Renamed the project from **runner** to **runa**
- Crate is now published as **runa-tui** (previously `runner-tui`)
- Deprecated the `runner-tui` crate on crates.io; please use `runa-tui` for new installations

---

## [0.2.12] - 2025-12-23
### Added
- **Empty Directories indicator**: Now shows `[Empty]` when a directory is empty, in the main and preview pane.

### Fixed
- **Entry coloring**: Fixed/Added a entry coloring fallback to `[theme.entry]` instead of internal default.


## [v0.2.11] - 2025-12-22

### Changed
- **Default config**: Changed the `--init` config to generate a default `runa signature` theme instead of internal defaults. Note: This is the first of many themes.

### Fixed
- **UI Stability**: Hardened the padding logic with a match guard to prevent invalid or negative spacing values.


## [v0.2.10] - 2025-12-22

### Fixed
- Selection background and foreground colors for each pane now renders correctly.
- Fixed a bug where the underline background in `[theme.underline]` would falsely overide the selection background even if false. Now correctly respects the `preview_underline_color` toggle.

### Added
- **Theme Overides**: Implemented a Global-to-Local overide system, where panes can inherit global selection styles from `[theme.selection]` or define their own.
- **Entry Padding**: Added `entry_padding` configuration to allow customization of padding between entries and the pane edge.
- **Navigation Wrapping**: Navigating past the last entry now wraps back to the top.
- **Expaned Theme Support**: Can now use 3 digit HEX colors as well.

### Changed
- **Parent pane**: Renamed the former `Origin` pane to `Parent` pane
- **Display layout**: Changed how the configuration holds the pane / ratio layouts. Now inside `[display.layout]`!
- **Defaults**: Changed the defaults of `Parent` (former `Origin`) to be enabled by default. Also the init config now comments out all the defaults except some few
- **Clean configuration init**: The `--init` command now generates a cleaner `runa.toml` by commentig out most internal defaults.

### Internal
- Optimized "Global-to-Local" theme engine to correctly resolve color overides and inheritance, improving runtime overhead.



---




## [v0.2.9] - 2025-12-22

### Fixed
- Fixed being unable to open a directory with a selected editor from the runa.toml config


---



## [v0.2.8] - 2025-12-22
## Changed
- Updated Cargo release profiles in `Cargo.toml` for optimized builds.



---


## [v0.2.7] - 2025-12-22
## Added
- **Preview underline theming**: Added `[theme.underline]` section to customize underline colors.
- **Preview color source toggle**: New `preview_underline_color` setting to choose between `[theme.underline]` or the standard `[theme.selection]` colors for the underline.

## Changed
- **Preview underline default**: Enabled preview underline to be enabled by default in the runa.toml.

## Internal
- **UI refactor**: Cleaned up the render function in ui.rs to improve readability and context.


---


## [v0.2.6] - 2025-12-22
### Fixed
- **File/Directory preview**: Fixed issue where preview did not correctly render when pane sizes where inconsistent. Now using `unicode-width` to correctly calculate pane width.
- **Pane ratios**: Pane ratios are now correctly calculated and will always internally calculate to 100%, meaning its not needed to always have 100% ratio in the runa.toml config.

### Added
- **Preview underline**: Toggle to enable a underline for the preview pane.
- **Directory colors**: Colors for directories are now independent of entry colors.

### Internal
- **Massive refactor**:  
    - Refactored `AppState` with modular app sub-modules: `app/nav.rs`, `app/parent.rs` and `app/preview.rs`
    - Refactored `Config` to make it more maintainable `config/themes`, `config/display`, `config/input`.
    - Separated UI functions from `terminal.rs` and added UI specific modules: `ui.rs`, `ui/panes.rs`, `ui/widgets.rs`
    - `worker.rs`: Ensured preview lines properly account for Unicode width and ignore control characters and tabs, preserving visual alignment in the TUI.
    - All worker responses and previews now produce strings of the exact pane_width, so TUI rendering remains stable regardless of file names or content length.

- **Tests**: Added formatting and worker tests

---

## [v0.2.5] - 2025-12-21
### Fixed
- **File Preview:** Fixed an issue where files without extensions and with very short names (≤ 3 characters, for example `ht`, `xy`) were incorrectly shown in the preview pane.
- **Preview Bleed/Race:** Hardened preview logic to ensure only the freshest preview request result is ever shown, preventing bleed from stale async worker responses during very fast navigation.

### Changed
- Reduced the default maximum number of previewed lines from 60 to 50 for better fit across a variety of terminal sizes. (Will make it configurable in following releases)
- Increased tick debounce from 15 to 75 milliseconds to reduce excessive preview requests during very fast navigation.

### Internal
- Improved worker-response by relying on request IDs to always honor the latest directory or preview pane update, eliminating edge cases with rapid async requests.
- Clarified and strengthened file preview and worker-response logic, including improved state handling and fewer UI edge case bugs.

---

## [v0.2.4] - 2025-12-20
### Changed
- Switched `always_show` config to use `HashSet<OsString>` for much faster and efficient lookups.
- Set default value of `always_show` to empty for a saner default config.

### Internal
- Refactored config module for better maintainability: introduced `RawConfig` for deserialization, and `Config` for runtime usage.

---

## What's New in v0.2.1 and v0.2.2

## UI improvements

- Improved pane customization by adding pane specific selection cache.
- Custom Path Styling (v0.2.2): Addded a dedicated theme.path configuration to customize the path at the top of the UI.
- Pane-Specific Selections (v0.2.2): Added selection foreground and background colors for each pane for more customization.

## Performance

- Switched to crossbeam-channel for better thread sync.
- Performance improvements by reducing event_loop string creation.
- Optimized always_show and other flags by using Atomics.
- Migrated text rendering to use Line and Span for better performance and future-proofing.

## Fixes
- Fixed preview sorting issue. Now shows the directories in the correct oder.
