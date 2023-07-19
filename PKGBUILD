# Maintainer: qubidt <qubidt at gmail dot com>

pkgname=highlight-stderr
pkgver=0.3.0
pkgrel=1
pkgdesc="Run a command and highlight its stderr, preserving the order of stdout and stderr "
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/joshtriplett/highlight-stderr"
license=('MIT')
depends=('glibc' 'gcc-libs')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('c99ea1b682ed38f6bf3ce43d7fec17e90241dd01199f5c28607b908bacdc1050031a219fcf8d9c22fb1ae1bad8d4e023361ca08a48f4b43b492acf7fee5a7a07')

prepare() {
  cd "${pkgname}-${pkgver}"
  # TODO: --locked omitted because Cargo.lock in repo is outdated
  cargo fetch --target "${CARCH}-unknown-linux-gnu"
}

build() {
  cd "${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --release --frozen
}

check() {
  cd "${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm 755 -t "${pkgdir}/usr/bin" "target/release/${pkgname}"
  install -Dm 644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.md
}
