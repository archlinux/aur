# Maintainer: Sergey Borodulya <sevrykov.sergey@gmail.com>
# Maintainer: mochaaP <aur@mochaa.ws>

_pkgname="figma-fonthelper"
pkgname="${_pkgname}-git"
pkgver=0.1.7.r1.ggce14780
pkgrel=1
pkgdesc="Figma font daemon written in Rust."
arch=($CARCH)
url="https://github.com/traidento/${_pkgname}"
license=('GPL2')
depends=("freetype2")
makedepends=("cargo" "git")
source=(
  "git+${url}.git"
)
sha256sums=('SKIP')


pkgver() {
  cd ${_pkgname}
  printf $(git describe --always | sed 's/^v//;s/-/.r/;s/-/.g/')
}

prepare() {
  cd ${_pkgname}
  cargo update
  cargo fetch --locked --target "${CARCH}-unknown-linux-gnu"
}

build() {
  cd ${_pkgname}
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --release --all-features
}

check() {
  cd ${_pkgname}
  export RUSTUP_TOOLCHAIN=stable
  cargo test --all-features
}

package() {
  cd ${_pkgname}
  install -Dt "${pkgdir}/usr/bin" target/release/${_pkgname}
  install -Dt "${pkgdir}/usr/share/doc/${_pkgname}" -m644 README.md
}
