# Maintainer: Benedikt Vollmerhaus <benedikt[at]vollmerhaus[dot]org>

pkgname=agesafetch
pkgver=1.2.0
pkgrel=1
pkgdesc="A tool for obtaining your firmware's embedded AGESA version on Linux."
arch=('x86_64')
url='https://gitlab.com/BVollmerhaus/agesafetch'
license=('MIT')

makedepends=('cargo')
source=("${url}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
b2sums=('ea958758119a1ee2c8a9a5d3350e620bca2a200791ef16a7f2f9556217b3fb25036f41440d009d34a6a297365077507c6d998b3b98e6e49a29f426407f870476')

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
