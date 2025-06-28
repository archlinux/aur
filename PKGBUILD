# Maintainer: Nick Dowsett <nickd42 AT gmail DOT com>

pkgname=cosmic-applet-arch
pkgver=1.0.0.beta.13
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
b2sums=('bdd226cd36d73e7f6c4c967d33e1560bc737fd22a448cdae1e827ab7e01a1ee3dae4687fba4abacc6a5ab02d11a167f8ad4b8e25014403ffff9b0bee0c28d8bb')

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
