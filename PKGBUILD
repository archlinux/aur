# Maintainer: hollowpointer hollowpointer@pm.me
pkgname=zond
pkgver=0.3.2
pkgrel=1
pkgdesc="Deep network reconnaissance and probing tool."
arch=('x86_64')
url="https://github.com/hollowpointer/zond"
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7fe698e58462daeab5f71e3dcd49713303b023315921809d3d80b81047677944')

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
  cargo test --frozen --release --workspace --exclude cli
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/zond" "$pkgdir/usr/bin/zond"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
