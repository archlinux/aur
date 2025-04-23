# Maintainer: Benedikt Vollmerhaus <benedikt[at]vollmerhaus[dot]org>

pkgname=agesafetch
pkgver=1.2.1
pkgrel=1
pkgdesc="A tool for obtaining your firmware's embedded AGESA version on Linux."
arch=('x86_64')
url='https://gitlab.com/BVollmerhaus/agesafetch'
license=('MIT')

makedepends=('cargo')
source=("${url}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
b2sums=('b4b446ebc44d288f15a9a2c24f349c67ec2afb6a0aaeed4a0ce9b4af4ad4c8f02309df59730becb3b62ab6e079a5ca736b2de281ccddff9f905312e031b2720c')

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
