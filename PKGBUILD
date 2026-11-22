# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=bytebeat-rs
pkgver=0.1.0
pkgrel=1
_srcdir="bytebeat-rs-${pkgver}"
pkgdesc="A terminal tool for generating music from bytebeat expressions"
arch=('x86_64' 'aarch64')
url="https://github.com/chaosprint/bytebeat-rs"
license=('MIT')
depends=('glibc' 'libgcc')
makedepends=('cargo')
options=('!lto')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('b9361c3d452648241f6e698ca9a6b5256e9999255e668de01822848671c8ee69')

prepare() {
  cd "${_srcdir}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
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
  install -Dm755 "target/release/bytebeat" -t "${pkgdir}/usr/bin"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
