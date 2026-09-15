# CLAUDE.md

## Repository Overview

This is an Arch Linux AUR `-git` package for Bot Crossing,
a 3D colony sim that shows every coding-agent thread on the machine as an astronaut building something.
Upstream is https://github.com/Station-Sciences/bot-crossing (site: https://botcrossing.com).
Upstream has no tags or releases, so the package builds from the `main` branch.

## Package-Specific Files

- `bot-crossing`: Launcher installed to `/usr/bin`.
  It exports `BOT_CROSSING_DATA` to `${XDG_DATA_HOME:-~/.local/share}/bot-crossing` because upstream otherwise writes `colony.json` next to its own code.
  `--open` starts the server if needed and opens the browser.
- `bot-crossing.service`: systemd user unit (`systemctl --user enable --now bot-crossing`).
- `bot-crossing.desktop`: Application menu entry that runs `bot-crossing --open`.

## Package Maintenance

```bash
# Rebuild from the current upstream main; makepkg updates pkgver in the PKGBUILD
makepkg -f

# Generate .SRCINFO after PKGBUILD changes
makepkg --printsrcinfo > .SRCINFO

# Lint
namcap PKGBUILD
namcap bot-crossing-git-*.pkg.tar.zst
```

Bump `pkgrel` when only the local files (launcher, unit, desktop entry, PKGBUILD) change.
Run `updpkgsums` after editing any of the local files so their checksums stay current.

## Architecture

This is a source package that:
1. Clones upstream `main` and runs `npm ci` then `npm run build` (Vite) in `build()`.
2. Runs upstream's `npm test` in `check()`.
3. Installs only `dist/` and `server/` to `/usr/lib/bot-crossing/`.
   The server imports nothing outside Node builtins and Vite bundles the client dependencies,
   so no `node_modules` ships in the package.
4. Installs the launcher, systemd user unit, desktop entry, and MIT license.

`pkgver()` uses the no-tags form `r<commit count>.<short sha>`.
If upstream starts tagging releases, switch to the `git describe --long` form used in `../rancher-desktop-git/PKGBUILD`.

The server binds `127.0.0.1:5274` by default.
`PORT` and `BOT_CROSSING_HOST` override that,
and are honoured by both the launcher and upstream's `server/serve.mjs`.
