# Maintainer: Nick Dowsett <nickd42 AT gmail DOT com>

pkgname=cosmic-applet-arch
pkgver=1.0.0.beta.15
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
b2sums=('28d2029c86fc5acf23c0cd9eba9ceee95590d2915e2e0e197d7379cb54dd19f927b48c89136890cbbff86b14be1113209087eec320624037eddc75124f697bed')

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
