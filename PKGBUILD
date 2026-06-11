# Maintainer: Vaishnav-Sabari-Girish <vaishnav.sabari.girish@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=comchan-ratty
_pkgname=ComChan
pkgver=0.9.1
pkgrel=1
pkgdesc="A blazingly fast minimal serial monitor with plotter TUI and more"
arch=(
  'x86_64'
  'aarch64'
  'riscv64'
)
url="https://github.com/Vaishnav-Sabari-Girish/ComChan"
license=('MIT')
depends=('gcc-libs' 'libudev.so' 'fontconfig')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('cbcab095907c6a1a026bcc4e9c0d2c9ad43213d13461450370629ec1e873d73f')

prepare() {
  cd "$_pkgname-$pkgver"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$_pkgname-$pkgver"
  cargo build --features ratty --release --frozen --locked
}

check() {
  cd "$_pkgname-$pkgver"
  cargo test --all-targets --features ratty --frozen --locked
}

package() {
  cd "$_pkgname-$pkgver"
  install -Dm 755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
