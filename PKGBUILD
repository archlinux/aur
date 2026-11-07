# Maintainer: Nick Dowsett <nickd42 AT gmail DOT com>

pkgname=cosmic-applet-arch
pkgver=1.1.2
pkgrel=1
pkgdesc='COSMIC applet to display Arch Linux package status'
arch=(x86_64)
url=https://github.com/nick42d/cosmic-applet-arch
license=(GPL-3.0-only)
depends=(
  cosmic-icon-theme
  git
  pacman-contrib
  openssl
  libxkbcommon
)
makedepends=(
  pkgconf
  cargo
  git
  just
  mold
  clang
)
source=(git+https://github.com/nick42d/cosmic-applet-arch.git#tag=${pkgname}/v${pkgver})
b2sums=('702aff4f259d984dc81c0a8d7f0b1d8ac5bffff3d23fa32ac2c3337767108638f3b003afeae20403997ce52f045b42be9a4a6427f5547e9bfea8a2fd18a9ecc2')
# aws-lc-sys dependency fails to build with LTO enabled
options=('!lto')

prepare() {
  cd cosmic-applet-arch
  cargo fetch --locked
  sed 's/lto = "fat"/lto = "thin"/' -i Cargo.toml
}

build() {
  cd cosmic-applet-arch
  RUSTFLAGS+=" -C link-arg=-fuse-ld=mold"
  just build-release --frozen
}

package() {
  cd cosmic-applet-arch
  just rootdir="${pkgdir}" install
}
