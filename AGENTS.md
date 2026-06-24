# lxappearance-wlr — wlroots port of lxappearance (0.6.4-11)

GTK3 theme switcher retargeted at wlroots/Wayland compositors. Upstream pulled from `github.com/lxde/lxappearance` tag `0.6.4`; all changes live as patches here. `provides=lxappearance`, conflicts with `lxappearance`/`lxappearance-gtk3`. See root `AGENTS.md` for the patch→pkgrel→.SRCINFO→changelog workflow.

## PATCHES (apply order = PKGBUILD `prepare()`)
| Patch | Purpose |
|-------|---------|
| `lxappearance-theme-name.patch` | upstream PR #15 |
| `lxappearance-builtin-themes.patch` | upstream PR #16 |
| `lxappearance-transient-dialog.patch` | upstream PR #17 |
| `lxappearance-notshowin.patch` | upstream PR #20 — `NotShowIn=`, drop `X-LXDE-Settings` |
| `lxappearance-wayland-sync.patch` | gsettings sync on Apply, per-user autostart entry |
| `lxappearance-wayland-ui.patch` | drop legacy Color/Other tabs, 700px default width |
| `lxappearance-font-tab-layout.patch` | Font tab alignment + tooltips |
| `lxappearance-ru-translation.patch` | Russian `po/ru.po` strings (refresh when UI strings change) |

`lxappearance-wlr-sync-gsettings` (POSIX sh) installs to `/usr/bin`; reads `gtk-3.0/settings.ini` → mirrors theme/icon/cursor/font into `gsettings org.gnome.desktop.interface`. Login-time autostart counterpart to the on-Apply sync.

## PATCH APPLY — STRICT
`prepare()` uses `apply_patch_checked` = `git apply --check` then `git apply`. **No 3-way fallback** — a patch that doesn't apply cleanly is a hard failure. After editing a patch, dry-run with `git apply --check` against a fresh `src/lxappearance` checkout. Order is significant.

## BUILD / CHECK
- `./configure --enable-dbus --enable-gtk3` → `make`; then `autoreconf -fiv` runs in `prepare()`.
- `check()` greps `src/lxappearance.c` for patch effects — keep these literals valid when touching the wayland-ui / wayland-sync patches:
  - `gtk_window_set_default_size(GTK_WINDOW(app.dlg), 700, -1);`
  - `remove_wayland_legacy_pages(b);`
  - `gsettings set org.gnome.desktop.interface cursor-theme`
- Checksums use **`b2sums`** (not sha256).

## WHERE TO LOOK (reference C, artifact: `src/lxappearance/src/`)
`lxappearance.c` = dialog assembly / main; `widget-theme.c` `icon-theme.c` `cursor-theme.c` `font.c` `color-scheme.c` = per-tab logic; `plugin.c` = obconf plugin loader; `utils.c` `other.c` = helpers.

## ANTI-PATTERNS
- Editing `src/lxappearance/**` directly — encode in a patch + bump `pkgrel`.
- Adding a `git apply -3` style 3-way apply here — this package is intentionally strict (unlike pkg 2).
- Changing a `check()` literal without verifying the producing patch still emits it.
