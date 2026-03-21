# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=kanash
pkgver=0.1.6
pkgrel=1
pkgdesc="Learn Kana in the terminal"
arch=('x86_64')
url="https://github.com/benoitlx/kanash"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgname-v$pkgver.tar.gz")
sha256sums=('38dcd5c060c01189ab7f4158757cf16c643488a86b1724b72b3e96be4605e178')

prepare() {
  mv "$pkgname-$pkgname-v$pkgver" "$pkgname-$pkgver"
  cd "$pkgname-$pkgver"
  cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')" # --locked
}

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --frozen -p "$pkgname"
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --frozen -p "$pkgname"
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
