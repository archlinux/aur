# Maintainer: Benedikt Vollmerhaus <benedikt[at]vollmerhaus[dot]org>

pkgname=agesafetch
pkgver=1.1.0
pkgrel=1
pkgdesc="A tool for obtaining your firmware's embedded AGESA version on Linux."
arch=('x86_64')
url='https://gitlab.com/BVollmerhaus/agesafetch'
license=('MIT')

makedepends=('cargo')
source=("${url}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
b2sums=('a4ccad9c52f676dc31ad7e67580f0067d03427eebb0b5b8c7dbd266cc3c449fa74685d951cbfbe379c3f1b0b01c96989fff0cad6ce298b1d4dac3c6a3d9c40ff')

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
