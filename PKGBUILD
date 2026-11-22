# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=angry-duiker
pkgver=0.6.0
pkgrel=1
_srcdir="angry-duiker-2-v${pkgver}"
pkgdesc="A TUI for streaming music from network media servers using DLNA"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/fizzizist/angry-duiker-2"
license=('MIT')
depends=('glibc' 'libgcc' 'openssl-3')
makedepends=('cargo')
options=('!lto')
source=("${pkgname}-${pkgver}.tar.gz::${url}/-/archive/v${pkgver}/angry-duiker-2-v${pkgver}.tar.gz")
sha256sums=('c6cf911e4a919499d3f2fd5eed5728edb0a001fb677f3fa5b9395cfa32201c94')

prepare() {
  cd "${_srcdir}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${_srcdir}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  export PKG_CONFIG_PATH=/usr/lib/openssl-3/pkgconfig
  cargo build --frozen --release
}

check() {
  cd "${_srcdir}"
  export RUSTUP_TOOLCHAIN=stable
  export PKG_CONFIG_PATH=/usr/lib/openssl-3/pkgconfig
  cargo test --frozen
}

package() {
  cd "${_srcdir}"
  install -Dm755 "target/release/angry-duiker" -t "${pkgdir}/usr/bin"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
