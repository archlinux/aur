# Maintainer: Firegem <mrfiregem [at] protonmail [dot] ch>
pkgname=wpaperd
pkgver=0.1.0
pkgrel=1
pkgdesc='Wallpaper daemon for Wayland.'
arch=('x86_64')
url='https://github.com/danyspin97/wpaperd'
license=('GPL3')
depends=('gcc-libs' 'glibc')
makedepends=('cargo' 'scdoc')
provides=("${pkgname}")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('709dddc373973d836881ba13f888e288aadc8c5c5062af1a6d36aae82beca595')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cargo fetch --locked --target "${CARCH}-unknown-linux-gnu"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
  scdoc < man/wpaperd-output.5.scd > target/release/wpaperd-output.5
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm0755 -t "${pkgdir}/usr/bin/" "target/release/${pkgname}"
  install -Dm0644 -t "${pkgdir}/usr/share/man/man5" target/release/wpaperd-output.5
}
