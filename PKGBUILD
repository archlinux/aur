# Maintainer: hollowpointer hollowpointer@pm.me
pkgname=zond
pkgver=0.3.6
pkgrel=0
pkgdesc="Deep network reconnaissance and probing tool."
arch=('x86_64')
url="https://github.com/hollowpointer/zond"
license=('MPL-2.0')
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7a878c92e32437ff9e391f286842ad83d75c58790da4c105602c1c4ad4609a86')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release -p zond-cli
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --frozen --release --workspace --exclude zond-integration-tests --exclude zond-cli
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/zond" "$pkgdir/usr/bin/zond"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
