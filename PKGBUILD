# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=esp-web-flash-server
pkgver=0.2.1
pkgrel=1
pkgdesc="Starts a local server serving a web page to flash a given ELF file"
arch=('x86_64')
url="https://github.com/esp-rs/esp-web-flash-server"
# license=('')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('a7a2fa0c451ae97a7823e2753d366ee1fd640857474ee156bf84faa3fc59e763')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
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
  install -Dm 755 "target/release/web-flash" "$pkgdir/usr/bin/web-flash"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
