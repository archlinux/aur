# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=chessterm-tui
pkgver=0.1.0
pkgrel=1
_srcdir="chessterm-${pkgver}"
pkgdesc="A Rust-powered chess engine in a terminal"
arch=('x86_64' 'aarch64')
url="https://github.com/ronaldsuwandi/chessterm"
license=('MIT')
depends=('glibc' 'libgcc')
makedepends=('cargo')
options=('!lto')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('4b2959af4560c69f39dae7078ca3fa90fe05692231af304c0fd279aaff9de070')

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
  install -Dm755 "target/release/chessterm" -t "${pkgdir}/usr/bin"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
