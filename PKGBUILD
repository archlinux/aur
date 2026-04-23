# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds
# Maintainer: Adam Perkowski <adas1per@protonmail.com>
# https://github.com/adamperkowski/pkgbuilds

pkgname=nvrs
pkgver=0.1.10
pkgrel=1
pkgdesc="Fast new version checker for software releases"
arch=('x86_64')
url="https://github.com/adamperkowski/nvrs"
license=('MIT')
depends=('gcc-libs' 'openssl')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('445804691b3470cae2ec4dec1c059d64c455a7dfd906826634e9567c0ed6c967d1650785ca61251c542a33c1e555c56d9d4453b5e1a6a79a01913dcbf7e683d2')
options=('!lto')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"
  export CARGO_TARGET_DIR=target
  cargo build --release --frozen --bin "$pkgname" --features="cli"
}

check() {
  cd "$pkgname-$pkgver"
  export CARGO_TARGET_DIR=target
  cargo test --frozen --features="cli"
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm 644 "man/$pkgname.1" -t "$pkgdir/usr/share/man/man1"
}

# vim: ts=2 sw=2 et:
