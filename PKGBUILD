# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=manga-tui
pkgver=0.7.0
pkgrel=1
pkgdesc="Terminal-based manga reader and downloader with image support"
arch=('x86_64')
url="https://github.com/josueBarretogit/manga-tui"
license=('MIT')
depends=('gcc-libs' 'openssl')
makedepends=('cargo' 'sqlite')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('94a142c3a24073a5f7b21481a76dcc13024a75fc559b34fe03b29f480526671d3e5242b24a2d1912aed2eb47bc5ce26745c0163470245b4c2d6cb97177016432')
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
