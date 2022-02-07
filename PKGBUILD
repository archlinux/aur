# Maintainer: Frederik Schwan <freswa at archlinux dot org>
# Contributor: Vlad Frolov <frolvlad@gmail.com>

pkgname=cargo-deny
pkgver=0.11.2
pkgrel=1
pkgdesc='Cargo plugin for linting your dependencies'
arch=('x86_64')
url='https://github.com/EmbarkStudios/cargo-deny'
license=('MIT' 'APACHE')
depends=('gcc-libs' 'zlib')
makedepends=('cargo')
options=(!lto)
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/EmbarkStudios/cargo-deny/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz)
b2sums=('ca38036f19c3ae7875ed2034459c921e412f5853513bd8e4b3b86b08334e8e177e9e5c72c507081aedeae56d6a33cc45d941c6923ce9a1e0ce74278e8b1ebf81')

prepare() {
  cd cargo-deny-${pkgver}
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd cargo-deny-${pkgver}
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --release --locked
}

check() {
  cd cargo-deny-${pkgver}
  export RUSTUP_TOOLCHAIN=stable
  cargo test --release --locked
}

package() {
  cd cargo-deny-${pkgver}
  install -Dm755 target/release/cargo-deny -t "${pkgdir}"/usr/bin
  install -Dm644 README.md -t "${pkgdir}"/usr/share/doc/${pkgname}
  install -Dm644 LICENSE-MIT -t "${pkgdir}"/usr/share/licenses/${pkgname}
}
