# Maintainer: Olivier Le Moal <mail@olivierlemoal.fr>

pkgname=yabridge-tui
pkgver=0.2
pkgrel=1
pkgdesc='A terminal user interface for managing yabridge (Windows VST/VST3/CLAP plugin bridge for Linux)'
arch=('x86_64')
url='https://codeberg.org/olivierlm/yabridge-tui'
license=('GPL-3.0-only')
depends=('gcc-libs')
makedepends=('cargo')
optdepends=('yabridge-bin: required for actual plugin bridging and yabridgectl')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('9c6a3f8e0c95d962de5b22d86585cecfb8392e48ae9cb48429517759f03bb18c')

prepare() {
  cd "${pkgname}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${pkgname}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

package() {
  cd "${pkgname}"
  install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
