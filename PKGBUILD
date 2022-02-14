# Maintainer: Frederik Schwan <freswa at archlinux dot org>
# Contributor: Vlad Frolov <frolvlad@gmail.com>

pkgname=cargo-deny
pkgver=0.11.3
pkgrel=1
pkgdesc='Cargo plugin for linting your dependencies'
arch=('x86_64')
url='https://github.com/EmbarkStudios/cargo-deny'
license=('MIT' 'APACHE')
depends=('gcc-libs' 'zlib')
makedepends=('cargo')
options=(!lto)
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/EmbarkStudios/cargo-deny/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz)
b2sums=('d0f2514a46303371a69ea953ec6214a1ce5d918df256f18b81c66184b49073db16fdec85856cfa7d2e2cb3db68f7e241db82faff866748f8e762dc7d23882a04')

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
