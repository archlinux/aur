# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=kty
pkgver=0.3.1
pkgrel=1
pkgdesc="The terminal for Kubernetes"
arch=('x86_64')
url="https://github.com/grampelberg/kty"
license=('Apache-2.0')
depends=('gcc-libs' 'openssl')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('7ec51db041f853facc3764168d8688088af6222be234fe527f4f415f7f743aa5f3377bcc24ada3a38c7bc6760e25d6bbb7e6eb76fb208c557b35aeacdcb209b0')
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
  cargo test --frozen
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
