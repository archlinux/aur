# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=manga-tui
pkgver=0.3.0
pkgrel=1
pkgdesc="Terminal-based manga reader and downloader with image support"
arch=('x86_64')
url="https://github.com/josueBarretogit/manga-tui"
license=('MIT')
depends=('gcc-libs' 'openssl')
makedepends=('cargo' 'sqlite')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('135b39c17c58e7be3358277c0bab477540d3d29b61ef464ea9cbad7d141374a9e9e7b91d10cf5de09e4ea83bb15bafbd900c233aa01f3dc1222145f2d110dde9')
options=('!lto')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')" # --locked
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
