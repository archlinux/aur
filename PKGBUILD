# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=cargo-pgx
pkgver=0.2.4
pkgrel=1
pkgdesc="Build PostgreSQL extensions with Rust"
arch=('x86_64')
url="https://github.com/zombodb/pgx"
license=('MIT')
depends=('gcc-libs' 'openssl' 'clang' 'llvm')
optdepends=(
  'postgresql: to compile with system postgresql'
)
makedepends=('rust')
source=(
  "$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate"
  "https://raw.githubusercontent.com/zombodb/pgx/v$pkgver/LICENSE"
)
sha512sums=('57502586ce8012e86da1cf4ad18c49a9723e616db44f78be9d90cd344dba0bdc63387b558a979afe80646f194df48f1f5b9c24d4d9d863460677f70a5f746391'
            '1567db39266597101bec59f782c50ba28fad860e29626eed187980e671f1ade38a9b3a33ea56fbcf6bdc27c0960db0ddf7e6064e3c12c6fef1e1eb2f1721c535')
b2sums=('c42b1e471bc87727d4c3ad735a4851f8b009541af7c9b3ad3b20054c0cf2e5a8b4175bd55bb4cb0f59b6bd6530f87060544f665e15d8751e6bad016956ee0c27'
        '2cab3447814cebb834e21e3db43ac2dd42bd0ca064d304120ecf5d4f831b90dcd7fe5f9ddc10983e5f362689258d5af0ee4abedfcbf87f52ff31fe697511f165')

prepare() {
  cd "$pkgname-$pkgver"

  # download dependencies
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --frozen
}

package() {
  cd "$pkgname-$pkgver"

  # binary
  install -vDm755 -t "$pkgdir/usr/bin" "target/release/$pkgname"

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" "$srcdir/LICENSE"
}
