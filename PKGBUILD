# Maintainer: tarball <bootctl@gmail.com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=crabz
pkgver=0.9.0
pkgrel=1
pkgdesc="Cross-platform compression and decompression tool"
arch=('x86_64')
url="https://github.com/sstadick/crabz"
license=('Unlicense' 'MIT')
depends=('gcc-libs')
makedepends=('cargo' 'cmake')
changelog=CHANGELOG.md
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('8b5df26a8ff0b1252d5a31c7135b39aa328e9a256c8869c2e9f346d561e522e7')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cd "$pkgname-$pkgver"
  cargo build --frozen --release --all-features
}

check() {
  export RUSTUP_TOOLCHAIN=stable
  cd "$pkgname-$pkgver"
  cargo test --frozen --all-features
}

package() {
  cd "$pkgname-$pkgver"
  install -Dv target/release/crabz -t "$pkgdir/usr/bin/"
  install -Dvm644 LICENSE-MIT UNLICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dvm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
