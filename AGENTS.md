# Repository guidance

This is the AUR package repository for the split `openlawsvpn` packages.

- `PKGBUILD` is the package source of truth; `.SRCINFO` must be regenerated and
  committed whenever `PKGBUILD` metadata changes.
- Release updates originate in the upstream `go-openlawsvpn` repository via
  `make aur-release VERSION=X.Y.Z-N`. Do not hand-copy a version from prose.
- The `pkgver` and `pkgrel` values must match the upstream `pkg/X.Y.Z-N` tag,
  and `sha256sums` must match that tag's archive.
- Validate with `makepkg --printsrcinfo` and, when practical, `makepkg --verifysource`
  before publishing.
