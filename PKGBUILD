# Maintainer: Nick Dowsett <nickd42 AT gmail DOT com>

pkgname=cosmic-applet-arch
pkgver=1.0.0.beta.2
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
  lld
)
source=(git+https://github.com/nick42d/cosmic-applet-arch.git#tag=${pkgname}-v${pkgver})
b2sums=('3d3fd69b9d120d4830302e673c4eb5502680dc0ce30b123cda096f0c2e405b0cb09951e527f0d2e0fa937dc5ac3ee13460e11f6fa429500f231ee471a5b75a87')

prepare() {
  cd cosmic-applet-arch
  cargo fetch --locked
  sed 's/lto = "fat"/lto = "thin"/' -i Cargo.toml
}

build() {
  cd cosmic-applet-arch
  RUSTFLAGS+=" -C link-arg=-fuse-ld=lld"
  just build-release --frozen
}

package() {
  cd cosmic-applet-arch
  just rootdir="${pkgdir}" install
}
