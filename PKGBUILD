# Maintainer: zsh-ncursed <zsh.ncursed@gmail.com>
# vim: ft=sh:

pkgname=tabook
pkgver=0.3.2
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
# module + better-sqlite3 prebuild), produced by .github/workflows/release.yml
# and attached to the GitHub release. Nothing is compiled at install time —
# the sha256 placeholders are filled in by the release workflow before
# publishing to AUR.
source_x86_64=("tabook-${pkgver}-linux-x64.tar.zst::https://github.com/zsh-ncursed/tabook/releases/download/v${pkgver}/tabook-${pkgver}-linux-x64.tar.zst")
source_aarch64=("tabook-${pkgver}-linux-arm64.tar.zst::https://github.com/zsh-ncursed/tabook/releases/download/v${pkgver}/tabook-${pkgver}-linux-arm64.tar.zst")
sha256sums_x86_64=('fb9573e4f37295439c76a5f9f3bcea0edb0cca522b86feae3c82146bcecd14bf')
sha256sums_aarch64=('9fc6469099afa7513e75c155578d437f0afc7e613dc479fc247294c83403aafe')

package() {
  # The tarball carries tabook.bundle.mjs, node_modules/ (@tabook/native Rust
  # module + better-sqlite3 prebuild) and LICENSE at its root.
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
