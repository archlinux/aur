# lxappearance-wlr changelog

## 0.6.4-12
- Add a Wayland-safe mouse cursor preview gallery powered by `libXcursor`, without requiring an X server.
- Show the previously hidden cursor-size control in the Mouse Cursor tab (the slider row was missing `visible` in the UI), fix it to a stable 8–96 range, and refresh the preview live; this control sets `XCURSOR_SIZE`.
- Mirror `XCURSOR_THEME` and `XCURSOR_SIZE` to `~/.config/labwc/environment` on Apply while preserving comments and other variables.
- On Apply, run `labwc --reconfigure` when running under labwc (detected via `$LABWC_PID`) so the cursor updates without re-login; other wlroots compositors are left untouched.
- Remove the empty `NotShowIn=` key from the desktop entry.
- Reword the Mouse Cursor tab note to be compositor-agnostic (not all wlroots compositors change the cursor on the fly; some need a compositor restart).
- Add `README.en.md` and `README.ru.md`, and install them together with `AGENTS.md` to `/usr/share/doc/lxappearance-wlr/`.

## 0.6.4-11
- Add popup hints on `Widget` tab (theme list, preview area, default font controls).
- Add Russian translations for these tooltip strings in `po/ru.po` to keep the UI fully localized.
- Refresh `lxappearance-ru-translation.patch` with the new tooltip translation entries.

## 0.6.4-10
- Add symmetric tab padding on `Font` page (including right side) to match spacing used by other pages.
- Add popup explanatory tooltips for key font controls (antialiasing, hinting, hinting style, sub-pixel geometry).

## 0.6.4-9
- Improve `Font` tab formatting by aligning parameter rows and reducing excessive label-to-control gaps.
- Add alignment groups for hinting/subpixel labels and controls so both rows look consistent.
- Increase combo minimum width to keep option values readable without cramped controls.

## 0.6.4-8
- Set default main window width to `700` for a tighter initial layout.
- Make patch application deterministic in `prepare()` via `git apply --check` + `git apply` (no implicit 3-way fallback).
- Add `check()` stage in PKGBUILD with smoke assertions for key wlroots/Wayland patch effects and built binary presence.
- Document patch maintenance expectations for downstream updates.

## 0.6.4-6
- Remove explicit `libx11` runtime dependency from package metadata.
- Add lightweight Apply diagnostics via `g_message` logs for settings save and sync steps.
- Split the Wayland customization patch into `lxappearance-wayland-sync.patch` and `lxappearance-wayland-ui.patch`.

## 0.6.4-5
- Remove legacy `Color` and `Other` tabs from the UI in the Wayland-focused build.

## 0.6.4-4
- Create autostart entry in `$XDG_CONFIG_HOME/autostart/` per user when applying settings.
- Stop installing autostart desktop file to `/etc/xdg/autostart`.

## 0.6.4-3
- Add immediate gsettings sync on Apply for labwc/Wayland sessions.
- Add autostart helper to sync GTK settings to gsettings at login.

## 0.6.4-2
- Write theme settings to both `~/.config/gtk-3.0/settings.ini` and `~/.config/gtk-4.0/settings.ini`.

## 0.6.4-1
- Rename package to `lxappearance-wlr` for wlroots-focused setups.
- Keep GTK3-only build configuration; no GTK2 variant is packaged.
- Allow desktop entry in all environments (`NotShowIn=`).
- Remove LXDE-specific desktop category (`X-LXDE-Settings`).
- Add packaged changelog files in English and Russian.
