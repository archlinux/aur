# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=cargo-pgx
pkgver=0.2.0
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
sha512sums=('a925722326156a1395e31eef3e7cca0b7d6b08cc428aabc3512d069ff30e439b7994f36c7cb9b2c71810a580ef50a81cbaf2f0599769384bd8f055d20265973c'
            '1567db39266597101bec59f782c50ba28fad860e29626eed187980e671f1ade38a9b3a33ea56fbcf6bdc27c0960db0ddf7e6064e3c12c6fef1e1eb2f1721c535')
b2sums=('1b81782e3ee72f5d8ee2adf74f20dd50fe3524c5f46a1dea2a5773ece3d0852466a253cd480ee985e275b2a6dacb21210555d8deafaf868a4b990c1c2aeec8ab'
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
