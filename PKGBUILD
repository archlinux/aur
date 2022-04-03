# Maintainer: Frederik Schwan <freswa at archlinux dot org>

pkgname=rust_ledger
pkgver=0.8.0
pkgrel=1
pkgdesc='Rust implementation of ledger, the command line accounting tool'
arch=('x86_64')
url='https://github.com/ebcrowder/rust_ledger'
license=('GPL3')
depends=('gcc-libs')
makedepends=('cargo')
source=("https://github.com/ebcrowder/rust_ledger/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
b2sums=('b6b42bb52f289736d7d791bff8b41bb83062505a8d1a04b0fc099359f6edcd621de266279bf4cc8ab623641500c3b71cec32c0ba618eed326780e898adf36d42')

prepare() {
  cd ${pkgname}-${pkgver}
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd ${pkgname}-${pkgver}
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --release --frozen
}

check() {
  cd ${pkgname}-${pkgver}
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen -- --test-threads 1
}

package() {
  cd ${pkgname}-${pkgver}
  install -Dm755 target/release/${pkgname} -t "${pkgdir}"/usr/bin
}
