# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=yap-rs
pkgver=0.1.0
pkgrel=1
pkgdesc="A friendly serial terminal application"
arch=('x86_64')
url="https://github.com/nullstalgia/yap"
license=('MIT')
depends=('gcc-libs' 'espflash' 'openssl' 'systemd-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('4a7e8284bef64b6120cb9eb31a5601e8723fa914b1301afe9b1e73977a5a4ae0')
options=('!lto')

prepare() {
  cd "${pkgname%-rs}-$pkgver"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${pkgname%-rs}-$pkgver"
  cargo build --release --frozen --features yap-full
}

check() {
  cd "${pkgname%-rs}-$pkgver"
  cargo test --frozen
}

package() {
  cd "${pkgname%-rs}-$pkgver"
  install -Dm 755 "target/release/${pkgname%-rs}" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
