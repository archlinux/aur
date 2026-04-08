# lxappearance-labwc changelog

## 0.2.4-35
- Fix `Apply -> Close` after live theme preview: the selected/applied theme now remains saved.
- Keep close-time rollback only for non-applied preview state (close without `Apply`), matching labconf behavior.

## 0.2.4-34
- Add labconf-style live theme preview on the `Theme` tab: selecting a theme immediately triggers `labwc --reconfigure`.
- If a theme was only previewed and the dialog is closed without `Apply`, it is rolled back to the initial theme.
- After `Apply`, the current theme is committed as the new baseline, so close-time rollback does not undo applied state.
- Clarify Russian tab naming for `Title Bar` as `Рамка окон labwc`.

## 0.2.4-33
- Align forms using per-tab label columns (shared label width), with controls expanding to use available row width.
- Extend popup tooltips to include both parameter description and a separate config-key line (`Config key: ...`).
- Further shorten Russian labels to reduce line wraps and free space for input controls.

## 0.2.4-32
- Reduce excessive gaps in label/input rows and make input controls use available width.
- Compact Russian labels further to keep most parameter names on one line.
- Add parameter description tooltips (popup hints) to major labels and toggles.

## 0.2.4-31
- Rename `Title Bar` translation in Russian UI to a more natural term: `Рамка окна`.
- Rework form rows so label + input are on one horizontal line across the major settings pages (instead of stacked two-line rows).
- Shorten key Russian labels/tab captions to reduce wrapping and keep controls on one line where possible.

## 0.2.4-30
- Reorganize overloaded `Misc.` into dedicated top-level tabs for better discoverability:
  - `Fonts` (menu and OSD fonts)
  - `Workspaces` (count, prefix, initial workspace, workspace OSD time)
  - `Placement` (placement policy, cascade offset)
  - `Switcher` (OSD style/output, preview, outlines)
  - `Resize` (resize indicator, draw contents)
- Move window-decoration controls from overloaded `Misc.` into `Title Bar` to make frame/title settings more complete.
- Keep all existing settings and handlers unchanged; only regroup UI layout.

## 0.2.4-29
- Adjust dialog close semantics for LXAppearance UI variants that have `Apply` + `Close` (without explicit `OK`):
  - `Apply` saves current `rc.xml` and reconfigures labwc.
  - `Close` no longer triggers rollback after `Apply`; applied changes stay saved.
- Keep rollback path only for explicit cancel responses when present.

## 0.2.4-28
- Align Apply/Cancel behavior with labconf preview workflow without adding new fields:
  - `Apply` writes current `rc.xml` and reconfigures labwc.
  - `Cancel` after at least one `Apply` restores the initial `rc.xml`, reconfigures labwc, then closes the dialog.
- Keep rollback logic internal to the existing LXAppearance responses (no new UI controls).
- Make `tree_apply()` return status so response handling can track whether preview state is active.

## 0.2.4-27
- Make `Misc` UI more labwc-first: improve Russian wording and rename `Decoration` tab translation to `Оформление labwc`.
- Add per-control tooltips showing corresponding `rc.xml` keys (`labwc: ...`) for easier debugging/support.
- Add labwc 0.9.6 smoke test (`tests/smoke_labwc_096.py`) and bundled reference config (`tests/data/labwc-0.9.6-rc.xml`).
- Improve labwc 0.9.6 compatibility for window switcher settings by reading/writing `windowSwitcher` / `osd` attributes (with node fallback kept).
- Stop packaging unnecessary plugin development artifacts (`obconf.a`, `obconf.la`).

## 0.2.4-26
- Update `po/ru.po`: add translation for `Reset Misc to defaults` and revise Openbox-only wording in error/theme strings to labwc-oriented wording.
- Confirm and document compatibility target with `labwc 0.9.6` for used rc.xml keys.

## 0.2.4-25
- Add `Misc` reset button (`Reset Misc to defaults`) that restores labwc-oriented defaults for workspace, placement, switcher, resize, decoration and misc fonts.
- Add mini test `tests/test_desktops_number.py` to validate workspace-count parsing precedence for multiple `rc.xml` layouts.

## 0.2.4-24
- Remove temporary runtime diagnostics after confirming the startup workspace-count fix.

## 0.2.4-23
- Fix startup workspace overwrite: preserve global `mapping` state inside `read_font()` so intermediate font initialization no longer drops the guard and triggers early `desktops_number` writes of `1`.

## 0.2.4-22
- Add runtime diagnostics for workspace-count loading/writing and config path selection to isolate why UI still shows `1` on some systems.

## 0.2.4-21
- Fix workspace-count source selection by preferring top-level `labwc_config/desktops` (or `labwc_config/core/desktops`) before any recursive fallback, preventing accidental reads from unrelated `desktops` nodes.

## 0.2.4-20
- Fix startup overwrite race: keep `mapping` enabled until tab initialization completes so early GTK signals do not write default values (including workspace count `1`) before config values are loaded.

## 0.2.4-19
- Improve workspace-count startup read logic by scanning the loaded XML tree for the first `desktops` node and reading nested `number` before attribute fallback.
- Improve workspace-count writes to update the discovered `desktops` node directly (without forcing immediate apply).

## 0.2.4-18
- Restore original save flow: do not auto-apply desktop count changes without pressing `Apply`.
- Add package documentation files `README.en.md` and `README.ru.md` describing differences from upstream.

## 0.2.4-17
- Persist workspace count immediately on change to avoid losing value when LXAppearance closes without emitting expected dialog responses.

## 0.2.4-16
- Save `rc.xml` not only on `Apply`, but also on dialog confirmation/close responses used by LXAppearance.

## 0.2.4-15
- Fix workspace count reading on startup by using non-mutating XML reads (do not auto-create missing nodes while loading values).
- Keep hybrid compatibility: prefer `desktops/number` when valid, fallback to `desktops@number`.

## 0.2.4-14
- Fix workspace count startup loading for hybrid configs by preferring `desktops/number` node when present, with fallback to `desktops@number`.

## 0.2.4-13
- Organize `Misc.` options into thematic subtabs for easier navigation.
- Fix workspace count loading/saving by using the `desktops` `number` attribute used by labwc.

## 0.2.4-12
- Organize `Misc.` into thematic subtabs (Fonts, Workspaces, Placement, Switcher, Resize, Decoration).
- Fix workspace count loading by reading `desktops@number` attribute used by labwc.

## 0.2.4-11
- Extend `Misc.` with additional labwc options:
  - initial workspace and workspace OSD popup time
  - cascade offset (x,y)
  - switcher OSD show/output, preview, outlines
  - resize draw-contents toggle
  - titlebar show-title, keep-border, maximized decoration
- Place workspace prefix before workspace count and keep Russian labels expanded.
- Fix button-order conversion so `N` keeps the window icon on the left.

## 0.2.4-10
- Place `Workspace name prefix` before `Number of workspaces` in `Misc.`.
- Use full Russian labels instead of abbreviations.
- Fix `N` in button order so the icon stays on the left side.

## 0.2.4-9
- Keep titlebar icon (`N`) on the left side when converting button order to labwc layout syntax.
- Add `Workspace name prefix` control in `Misc.` and map it to `desktops/prefix`.
- Enforce generated workspace names by dropping explicit `desktops/names` when number/prefix changes.

## 0.2.4-8
- Add labwc-focused controls in the `Misc.` tab:
  - workspace count
  - window placement policy
  - window-switcher OSD style
  - resize indicator mode
- Keep English option values in UI while adding translatable field labels.

## 0.2.4-7
- Restore theme discovery from `$XDG_DATA_HOME/themes` (e.g. `~/.local/share/themes`).

## 0.2.4-6
- Remove runtime dependency on Openbox libraries by porting XML and font handling to GLib/libxml2.
- Build without `obrender`/`obt` and drop the `openbox` package dependency.

## 0.2.4-5
- Map "Button order" to labwc `theme/titlebar/layout` format so removing `N` actually removes the window icon.
- Stop showing legacy `L` hint in the button-order help text.

## 0.2.4-4
- Remove non-functional theme preview pane from the right side of the UI.

## 0.2.4-3
- Remove non-working inactive OSD font option from the UI.
- Force OSD font writes to `theme/font:place=OnScreenDisplay` for labwc.

## 0.2.4-2
- Disable Openbox preview rendering path that crashes under Wayland sessions.
- Switch package dependency from raw sonames to `openbox` for smoother dependency resolution.

## 0.2.4-1
- Rework package for `lxappearance-wlr` and `labwc` sessions.
- Port plugin loading and config handling from Openbox/X11 checks to labwc/Wayland.
- Save and apply settings via `~/.config/labwc/rc.xml` and `labwc --reconfigure`.
