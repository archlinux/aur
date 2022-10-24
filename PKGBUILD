# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=codevis
pkgver=0.4.0
pkgrel=1
pkgdesc="A tool for turning your code into one large image"
arch=('x86_64')
url="https://github.com/sloganking/codevis"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
	"$pkgname-$pkgver-cargo-lock.patch::$url/commit/dbe1c0ba99ca73fe42f88c853b5fd01c6ef47f73.patch")
sha512sums=('f5434de8766c7a7472c3051ed751d6dbd58472882516e6ad7872dce66dbb9d6f09485ecf9648f02bbe9cd5edb2b56ff558a526916f22d20ab30909a92569235b'
            '40cd5d516e4d0b940bc47f6f51a7f310afe2a2cd20d2a1b18bce633aeec075e2e736309625a662f23aaf58cc3cfe32ce3167ebb59f13cc2b473113a91244983d')
options=('!lto')

prepare() {
  cd "$pkgname-$pkgver"
  patch -Np1 -i "$srcdir/$pkgname-$pkgver-cargo-lock.patch"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --frozen
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --frozen
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
