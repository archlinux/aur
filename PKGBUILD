pkgname=nmrs
pkgver=1.5.0
pkgrel=1
pkgdesc="Wayland-native GUI for NetworkManager, built with Rust and GTK4"
arch=('x86_64')
url="https://github.com/cachebag/nmrs"
license=('MIT')
depends=('gtk4' 'libadwaita' 'networkmanager')
makedepends=('rustup' 'cargo' 'git')

_pkgname=nmrs-gui

source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/cachebag/nmrs/archive/refs/tags/gui-v$pkgver.tar.gz"
  "nmrs.desktop"
)

sha256sums=('de8e5ba83a4f4050120dce381fffe588d067429bb7ffe5a77129dd58bfb148a0'
            '2279f157e299d52fabad1dfd9abd9e862b48dbba83921680f5134a537db061ef')

build() {
  cd "$srcdir/nmrs-gui-v$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  
  rustup toolchain install stable
  rustup default stable
  
  cargo build --release --locked
}

package() {
  cd "$srcdir/nmrs-gui-v$pkgver"
  install -Dm755 target/release/nmrs-gui "$pkgdir/usr/bin/nmrs"
  install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
  install -Dm644 LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
  install -Dm644 "$srcdir/nmrs.desktop" \
    "$pkgdir/usr/share/applications/$pkgname.desktop"
}
