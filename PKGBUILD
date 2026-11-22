# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=tts-tui
pkgver=0.1.5
pkgrel=1
_srcdir="tts-tui-${pkgver}"
pkgdesc="Text to speech app that reads from clipboard"
arch=('x86_64' 'aarch64')
url="https://github.com/lesleyrs/tts-tui"
license=('GPL-3.0-or-later')
depends=('glibc' 'libgcc')
makedepends=('cargo')
options=('!lto')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('79dfca54b7f3646792f3f49d3200425e5b1102ae246f9a0bb4bb34fba1bb1bf4')

prepare() {
  cd "${_srcdir}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${_srcdir}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd "${_srcdir}"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen
}

package() {
  cd "${_srcdir}"
  install -Dm755 "target/release/tts" -t "${pkgdir}/usr/bin"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
