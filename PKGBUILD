# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=lifecycler
pkgver=0.2.7
pkgrel=1
pkgdesc="Terminal aquarium"
arch=('x86_64')
url="https://github.com/cxreiff/lifecycler"
license=('MIT' 'Apache-2.0' 'CC0-1.0')
depends=('gcc-libs' 'alsa-lib' 'systemd-libs')
optdepends=('wayland: Wayland support')
makedepends=('cargo' 'wayland')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('4653d1908b55872154ab2d5571f468ac74fa68d6725c3e9265e839882a9c550a4dda0505c80786443643246ef4e8b64dbf01fc8463f6961fb12000fe6d381333')

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
  cargo test --frozen
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE-MIT.txt -t "$pkgdir/usr/share/licenses/$pkgname"
}
