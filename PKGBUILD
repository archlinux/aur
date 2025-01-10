# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=manga-tui
pkgver=0.5.0
pkgrel=1
pkgdesc="Terminal-based manga reader and downloader with image support"
arch=('x86_64')
url="https://github.com/josueBarretogit/manga-tui"
license=('MIT')
depends=('gcc-libs' 'openssl')
makedepends=('cargo' 'sqlite')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('9e1faf24da65c6a1abd2a5aec8c198fac26ac9ec307a4b0707538b68893ea9523d80f6da09db59ca42c839dd8c56b2e4fc827e88dfb3dd08ca17eaa08db072b8')
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
