# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
_base=cork
pkgname=${_base}-rs
pkgver=0.2.6
pkgrel=1
pkgdesc="Command-line calculator for hex-lovers"
arch=(x86_64)
url="https://github.com/reddocmd/${_base}"
license=(GPL)
depends=(gcc-libs)
makedepends=(cargo)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('341ff1408ef30b4580691bf84cfaf259a725ca30072ce0b42c5c78b0c83757193459243acc2fb92789835f54cd6c7c0613bdef8c460e99a0d6641c01cfb508d6')

prepare() {
  cd ${_base}-${pkgver}
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cd ${_base}-${pkgver}
  cargo build --release --frozen --all-features
}

check() {
  export RUSTUP_TOOLCHAIN=stable
  cd ${_base}-${pkgver}
  cargo test --frozen --all-features
}

package() {
  cd ${_base}-${pkgver}
  install -D target/release/cork -t "$pkgdir/usr/bin/"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
