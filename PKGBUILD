# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=wiper
pkgver=0.2.1
pkgrel=1
pkgdesc="Disk cleanup tool"
arch=('x86_64')
url="https://github.com/ikebastuz/wiper"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('e053ab596c4f424cbacbe63900623a6aff4f3185de9cc1b73bc45cb094800f0682db028a8612c31db49990bd15901851b6e8b00579170e35462ab8f7337bea94')

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
