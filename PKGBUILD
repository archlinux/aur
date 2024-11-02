# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=manga-tui
pkgver=0.4.0
pkgrel=1
pkgdesc="Terminal-based manga reader and downloader with image support"
arch=('x86_64')
url="https://github.com/josueBarretogit/manga-tui"
license=('MIT')
depends=('gcc-libs' 'openssl')
makedepends=('cargo' 'sqlite')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('a9be690b052dc406b86e9aac1f6107bbe8cdb96989bba6ebe465ce561fb115da16fb9f0e1501e74782d9ab59caa7fe5855678e17f29c97113b8db88a1bd4f2ed')
options=('!lto')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')" --locked
}

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --frozen
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --frozen -- --test-threads=1
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
