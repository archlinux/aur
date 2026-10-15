# Maintainer: Rafal Vonau <rafal.vonau@gmail.com>
pkgname=stitchviewer-git
pkgver=0.1.0.r1
pkgrel=3
pkgdesc='Viewer for large TIFF images and stitched PNG grids'
arch=('x86_64')
url='https://github.com/RafalVonau/StitchViewer'
license=('MIT')
depends=('glibc' 'gcc-libs' 'libx11' 'libxkbcommon' 'wayland' 'vulkan-icd-loader' 'xdg-desktop-portal' 'hicolor-icon-theme')
makedepends=('cargo' 'git' 'pkgconf')
provides=('stitchviewer')
conflicts=('stitchviewer')
source=('stitchviewer::git+https://github.com/RafalVonau/StitchViewer.git')
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/stitchviewer"
  local _version
  _version="$(sed -n '/^\[package\]/,/^\[/{s/^version = "\([^"]*\)"/\1/p;}' Cargo.toml | head -n 1)"
  printf '%s.r%s.g%s' "${_version}" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "${srcdir}/stitchviewer"
  cargo fetch --locked --target x86_64-unknown-linux-gnu
}

build() {
  cd "${srcdir}/stitchviewer"
  cargo build --frozen --release --bin stitchviewer
}

package() {
  cd "${srcdir}/stitchviewer"
  install -Dm755 target/release/stitchviewer "${pkgdir}/usr/bin/stitchviewer"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/stitchviewer/LICENSE"
  install -Dm644 AUR/stitchviewer.desktop "${pkgdir}/usr/share/applications/stitchviewer.desktop"
  install -Dm644 assets/stitchviewer.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/stitchviewer.svg"
  install -Dm644 assets/stitchviewer.png "${pkgdir}/usr/share/icons/hicolor/256x256/apps/stitchviewer.png"
}
