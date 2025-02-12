# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=tuicam
pkgver=0.0.2
pkgrel=1
pkgdesc="A terminal based ASCII camera"
arch=('x86_64')
url="https://github.com/hlsxx/tuicam"
license=('MIT')
depends=('gcc-libs' 'opencv')
makedepends=('cargo' 'clang')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('55a692f5930306136c514e15a2ba2f9e9803f74ce522f676d4574fd148982518')
options=('!lto')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --frozen --features opencv_newer
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --frozen --features opencv_newer
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
