# Maintainer: orhun <orhunparmaksiz@gmail.com>
# Contributor: Stephen Gregoratto <dev@sgregoratto.me>

# https://github.com/orhun/pkgbuilds

pkgname=typeracer
_pkgname=terminal-typeracer
pkgver=2.1.5
pkgrel=1
pkgdesc="Terminal typing speed tester"
arch=('x86_64')
url=https://gitlab.com/ttyperacer/terminal-typeracer
license=('GPL')
depends=('zlib' 'gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/-/archive/v$pkgver/terminal-typeracer-v$pkgver.tar.gz")
sha256sums=('44bde6819b8a6bfd76d6c28f3f1375526a80e14b7815156bc6576417355a52e2')

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
