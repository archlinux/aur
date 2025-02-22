# Maintainer: Benedikt Vollmerhaus <benedikt[at]vollmerhaus[dot]org>

pkgname=agesafetch
pkgver=1.0.1
pkgrel=1
pkgdesc="A tool for obtaining your firmware's embedded AGESA version on Linux."
arch=('x86_64')
url='https://gitlab.com/BVollmerhaus/agesafetch'
license=('MIT')

makedepends=('cargo')
source=("${url}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
b2sums=('cab0034ccb1554c422b11dafcbc2eeb86d80c25dcb8d1240be299f21eb0c1a80d23acd1ed7a224b8bb5aa758d9f8e91c0d15f1bb971ace5e8630e0c6464ee4cb')

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
