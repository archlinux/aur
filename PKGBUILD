# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=wiper
pkgver=0.2.0
pkgrel=1
pkgdesc="Disk cleanup tool"
arch=('x86_64')
url="https://github.com/ikebastuz/wiper"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('ca3568358538138979ef1d40753d279495b69b44c073d5165bc265e880f3ecabca104eb3efa614782ad55a99f045bac1490f69d5b0fca81d8032e08178e7326d')

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
  # https://github.com/ikebastuz/wiper/issues/11
  cargo test --frozen -- --skip "delete"
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 License -t "$pkgdir/usr/share/licenses/$pkgname"
}
