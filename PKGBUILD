# Maintainer: Frederik Schwan <freswa at archlinux dot org>
# Contributor: Vlad Frolov <frolvlad@gmail.com>

pkgname=cargo-deny
pkgver=0.11.1
pkgrel=2
pkgdesc='Cargo plugin for linting your dependencies'
arch=('x86_64')
url='https://github.com/EmbarkStudios/cargo-deny'
license=('MIT' 'APACHE')
depends=('gcc-libs' 'zlib')
makedepends=('cargo')
options=(!lto)
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/EmbarkStudios/cargo-deny/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz)
b2sums=('64d13aca27c840e9c11afa9e38cff42195bae4be2ec0fb3f49bf0159395698ab2b8b6fdab6b7ade8a124eb2bc6fc1b2d74b86a8305ca00877534fdf792d67ab3')

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
