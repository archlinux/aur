# Maintainer: Nick Dowsett <nickd42 AT gmail DOT com>

pkgname=cosmic-applet-arch
pkgver=1.0.0.beta.16
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
b2sums=('90df8a3fcd01bd657c4c391e9fd3a390dc9dc51bf524e991e27fe9cce7566c0c5a0fc6ed1be87913ee9881157b24c34cce721db77800335e07ec29e5ef083aa6')

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
