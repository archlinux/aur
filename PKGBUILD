# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=lifecycler
pkgver=0.2.8
pkgrel=1
pkgdesc="Terminal aquarium"
arch=('x86_64')
url="https://github.com/cxreiff/lifecycler"
license=('MIT' 'Apache-2.0' 'CC0-1.0')
depends=('gcc-libs' 'alsa-lib' 'systemd-libs')
optdepends=('wayland: Wayland support')
makedepends=('cargo' 'wayland')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('f15f107f50666689d44e90eeab849060ffd36c9e7f94ae28cdf28fbae9ac282f079e47d410742aa6592dd591d5d50d999b2e70d0f7885c66c10215a07d31cdaa')

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
