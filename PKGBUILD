# Maintainer: orhun <orhunparmaksiz@gmail.com>
# Contributor: Stephen Gregoratto <dev@sgregoratto.me>

# https://github.com/orhun/pkgbuilds

pkgname=typeracer
_pkgname=terminal-typeracer
pkgver=2.1.4
pkgrel=1
pkgdesc="Terminal typing speed tester"
arch=('x86_64')
url=https://gitlab.com/ttyperacer/terminal-typeracer
license=('GPL')
depends=('zlib' 'gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/-/archive/v$pkgver/terminal-typeracer-v$pkgver.tar.gz")
sha256sums=('8643daa2e96675328cda3c565a87b54095befc8fc678f0f059d06e2806686db4')

prepare() {
  cd "$_pkgname-v$pkgver"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$_pkgname-v$pkgver"
  CFLAGS+=" -ffat-lto-objects"
  cargo build --release --frozen
}

check() {
  cd "$_pkgname-v$pkgver"
  cargo test --frozen
}

package() {
  cd "$_pkgname-v$pkgver"
  install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
