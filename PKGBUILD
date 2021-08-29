# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=cargo-pgx
pkgver=0.1.22
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
b2sums=('86b1de062bbc3258e6c64b0b965eb842c6be3cc92a6d9d062119a804fc6665cc4fd9bed7343cf9004aa494032eadd6bc8b1f9f4536d5ea12b281db9e651f6b07'
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
