# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=cargo-pgx
pkgver=0.2.1
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
sha512sums=('6de93c60f8a3cbc67f4cf19d22d7d267a7b5809bb83c08987c40d4d63c5873273f3ae5404bbc475e655f066af265330803f99928b4aac075e01004ec25670bcd'
            '1567db39266597101bec59f782c50ba28fad860e29626eed187980e671f1ade38a9b3a33ea56fbcf6bdc27c0960db0ddf7e6064e3c12c6fef1e1eb2f1721c535')
b2sums=('e2b688f31578beec66cf930d7dff9f71c4a2399f68ed1b58ca416c5505b0afeae15e9e32d5744c4cb82dc6b6203ac2275522e7e053a11bfd746f4cf160903f47'
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
