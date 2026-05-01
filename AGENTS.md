# AGENTS.md

This is an AUR (Arch User Repository) package repo for lynx-devtool — an Electron-based debugging tool. It distributes a pre-built AppImage binary.

## Structure

- `PKGBUILD` — package definition, the single source of truth for all metadata, dependencies, sources, and install paths
- `.SRCINFO` — machine-readable metadata **generated from PKGBUILD**, never edit manually
- `lynx-devtool.desktop` — XDG desktop entry (local source file tracked in repo)
- `lynx-devtool.png` — application icon (downloaded from CNB, renamed via `source` syntax)
- `README.md` — user-facing docs

## Key Conventions

- Branch must be `master` (AUR requirement)
- Remote: `ssh://aur@aur.archlinux.org/lynx-devtool.git`
- `options=("!strip")` is required — stripping breaks AppImage internals
- `pkgname` variable is used throughout `package()` instead of hardcoded strings
- Icon installs to `/usr/share/icons/`, NOT `/usr/share/pixmaps/`
- Binary downloads from CNB fork, NOT upstream GitHub (upstream has no Linux builds)
- Source URLs are constructed inline in `source=()` using `${pkgver}`, no intermediate variables

## Version Update Workflow

1. Update `pkgver` in `PKGBUILD` (reset `pkgrel=1` if new version)
2. Run `updpkgsums` — downloads all sources and updates `sha256sums` automatically
3. Run `makepkg --printsrcinfo > .SRCINFO` — regenerate metadata
4. Run `makepkg -sf` — verify build succeeds
5. Commit and push

## Build & Verify

```sh
makepkg -sf                  # build package
updpkgsums                   # update checksums after source changes
makepkg --printsrcinfo > .SRCINFO
namcap PKGBUILD              # lint
```

## Common Mistakes

- Editing `.SRCINFO` by hand — always regenerate it
- Changing `.desktop` file without re-running `updpkgsums` — sha256 will mismatch
- Forgetting to bump `pkgrel` when fixing packaging without changing version
- Adding `MimeType` to `.desktop` — upstream has no custom URL scheme registered
