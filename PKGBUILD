# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=manga-tui
pkgver=0.3.1
pkgrel=1
pkgdesc="Terminal-based manga reader and downloader with image support"
arch=('x86_64')
url="https://github.com/josueBarretogit/manga-tui"
license=('MIT')
depends=('gcc-libs' 'openssl')
makedepends=('cargo' 'sqlite')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('204b89f4690a2f46f8e321fb65d9b654a739461ebecdc1952e325e9f0426754375198bcd5e518cd78fe7e9f68be96244c60168f4d3b7b60be7549b089fb8fbc0')
options=('!lto')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')" --locked
}

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --frozen
}

# https://github.com/josueBarretogit/manga-tui/issues/23
check() {
  cd "$pkgname-$pkgver"
  cargo test --frozen -- --skip "backend" --skip "view"
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
