# Maintainer: Vaishnav-Sabari-Girish <vaishnav.sabari.girish@gmail.com>

pkgname=comchan-ratty
_pkgname=ComChan
pkgver=0.11.0
pkgrel=5
pkgdesc="A blazingly fast minimal serial monitor with plotter TUI and more (With 3D support)"
arch=(
  'x86_64'
  'aarch64'
  'riscv64'
)
url="https://github.com/Vaishnav-Sabari-Girish/ComChan"
license=('MIT')
depends=('gcc-libs' 'libudev.so' 'fontconfig')
makedepends=('cargo')
source=("$_pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('e5acea79990fde1058866120a740725b9597a2adc3d3b20059410af6ab3f60de')

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
  install -Dm 755 "target/release/comchan" "$pkgdir/usr/bin/comchan"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
