# Maintainer: hollowpointer hollowpointer@pm.me
pkgname=zond
pkgver=0.3.4
pkgrel=1
pkgdesc="Deep network reconnaissance and probing tool."
arch=('x86_64')
url="https://github.com/hollowpointer/zond"
license=('MPL-2.0')
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('29fdb1d52081bcb77f5a010e5cdc360185363b3910c7ad40a8572901f316153f')

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
