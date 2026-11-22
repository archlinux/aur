# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=suzui-rs
pkgver=2.1.7
pkgrel=1
_srcdir="suzui-rs-${pkgver}"
pkgdesc="A terminal viewer for Suzuki engine data over the Suzuki Serial Data Line"
arch=('x86_64' 'aarch64')
url="https://github.com/thatdevsherry/suzui-rs"
license=('MIT')
depends=('glibc' 'libgcc')
makedepends=('cargo')
options=('!lto')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('590e82070f3bb649a6326d3948f95710a91485a2b676b220f226574b2f11b335')

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
  install -Dm755 "target/release/suzui-rs" -t "${pkgdir}/usr/bin"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
