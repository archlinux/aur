# Maintainer: zsh-ncursed <zsh.ncursed@gmail.com>
# vim: ft=sh:

pkgname=tabook
pkgver=0.3.3
pkgrel=1
pkgdesc='Terminal-based e-book reader for FB2 and EPUB formats'
arch=('x86_64' 'aarch64')
url='https://github.com/zsh-ncursed/tabook'
license=('MIT')
depends=('nodejs>=18')
optdepends=(
  'ueberzugpp: display images in terminals without kitty-protocol support (alacritty, xterm, tmux)'
  'zenity: graphical file picker for the `o` open-file dialog'
  'kdialog: graphical file picker (KDE alternative to zenity)'
)
# Prebuilt per-arch release tarballs (single-file JS bundle + Rust native
# module, which also owns the SQLite DB via rusqlite), produced by
# .github/workflows/release.yml and attached to the GitHub release. Nothing is
# compiled at install time — the sha256 placeholders are filled in by the
# release workflow before publishing to AUR.
source_x86_64=("tabook-${pkgver}-linux-x64.tar.zst::https://github.com/zsh-ncursed/tabook/releases/download/v${pkgver}/tabook-${pkgver}-linux-x64.tar.zst")
source_aarch64=("tabook-${pkgver}-linux-arm64.tar.zst::https://github.com/zsh-ncursed/tabook/releases/download/v${pkgver}/tabook-${pkgver}-linux-arm64.tar.zst")
sha256sums_x86_64=('beb1808827505867fcf9183ac3af0b566ec7a5d4f006f8590757af0e7c98af51')
sha256sums_aarch64=('2096b5269b1dd1fcd04bdd71f247e6048f1ddeebc2a853be4bdaf724003ddc69')

package() {
  # The tarball carries tabook.bundle.mjs, node_modules/ (@tabook/native Rust
  # module) and LICENSE at its root.
  install -dm755 "${pkgdir}/usr/lib/${pkgname}"
  cp -a "${srcdir}/"* "${pkgdir}/usr/lib/${pkgname}/"

  # Binary wrapper
  install -dm755 "${pkgdir}/usr/bin"
  cat > "${pkgdir}/usr/bin/tabook" <<EOF
#!/bin/bash
exec node /usr/lib/${pkgname}/tabook.bundle.mjs "\$@"
EOF
  chmod 755 "${pkgdir}/usr/bin/tabook"

  # License
  install -Dm644 "${pkgdir}/usr/lib/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" 2>/dev/null || true
}
