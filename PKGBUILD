# Maintainer: Vaishnav-Sabari-Girish <vaishnav.sabari.girish@gmail.com>

pkgname=comchan-ratty
_pkgname=ComChan
pkgver=0.10.1
pkgrel=4
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
source=("$_pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('92619f7d0b4ddd198c0e16b671243b55e1dc7643013c7241cf5980940e2f213c')

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
