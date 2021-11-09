# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=cargo-pgx
pkgver=0.2.3
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
sha512sums=('b7bf16d7918933a4c30c4ba0bd916f9d648516f1c0b3e63ef103e1cc43277a2f0583898f4d1d5ae89a93ff17e1430ea6bf7912d166eabe4d7546e4a5bb04419d'
            '1567db39266597101bec59f782c50ba28fad860e29626eed187980e671f1ade38a9b3a33ea56fbcf6bdc27c0960db0ddf7e6064e3c12c6fef1e1eb2f1721c535')
b2sums=('d98055669d715f5e9b315e1beae76af25522dc705ee3720012ebe803d23b3247602d61fe9ca8aea29da5a7ab8516fb6f37d22d5120b6d7a92cc6bd2ccb1c886f'
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
