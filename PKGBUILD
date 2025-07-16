# Maintainer: Benedikt Vollmerhaus <benedikt[at]vollmerhaus[dot]org>

pkgname=agesafetch
pkgver=2.0.0
pkgrel=1
pkgdesc="A tool for obtaining your firmware's embedded AGESA version on Linux."
arch=('x86_64')
url='https://gitlab.com/BVollmerhaus/agesafetch'
license=('MIT')

makedepends=('cargo')
source=("${url}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
b2sums=('805b1054acae35924dafc4c4e74aa3096b290a8f45f2209bd7b21e5028c9cb403f06d83efa824a1e799595c3ce0b3814283600d19b22892a628a7b578bb33a1b')

prepare() {
  cd "${pkgname}-v${pkgver}" || exit

  export RUSTUP_TOOLCHAIN='stable'
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${pkgname}-v${pkgver}" || exit

  export RUSTUP_TOOLCHAIN='stable'
  export CARGO_TARGET_DIR='target'
  cargo build --frozen --release
}

package() {
  cd "${pkgname}-v${pkgver}" || exit

  install -Dm755 -t "${pkgdir}/usr/bin/" "target/release/${pkgname}"
}
