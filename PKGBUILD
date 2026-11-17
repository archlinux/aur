# Maintainer: win0na <winona@winneon.moe>
pkgname=apw-cli
pkgver=0.1.5
pkgrel=1
pkgdesc='Read Apple Passwords on Linux'
arch=('x86_64' 'aarch64')
url='https://github.com/win0na/apw'
license=('GPL-3.0-only')
depends=('gcc-libs' 'glibc')
conflicts=('apw')
makedepends=('cargo' 'rust')
source=("apw-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('4f98f322b5b5f42be2dae646868627eb7b298ce5eaba53b77c3a6911914e7e44')

build() {
  cd "apw-$pkgver"
  # No --frozen: the crates are not vendored, so cargo fetches them here.
  cargo build --release --locked
}

check() {
  cd "apw-$pkgver"
  # build() has already populated the cargo cache.
  cargo test --release --locked --offline
}

package() {
  cd "apw-$pkgver"
  install -Dm755 "target/release/apw" "$pkgdir/usr/bin/apw"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -d "$pkgdir/usr/share/doc/$pkgname/docs"
  install -m644 docs/*.md "$pkgdir/usr/share/doc/$pkgname/docs/"
}
