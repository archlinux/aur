# Maintainer: Kevin MacMartin <prurigro@gmail.com>
# Contributor: Luke Arms <luke@arms.to>

pkgname=timer-for-harvest
pkgver=0.3.11
pkgrel=1
pkgdesc='Harvest client implemented using GTK and Rust'
url='https://github.com/frenkel/timer-for-harvest'
license=('BSD')
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
depends=('gtk3')
makedepends=('cargo')

source=(
  "https://github.com/frenkel/timer-for-harvest/archive/refs/tags/v${pkgver}.tar.gz"
  "$pkgname.svg"
)

sha512sums=(
  '20198051f0fad106ecf1b98fe9dc2edecd73ab018aae16eac21f0288911b28b0de148499e0fb22da917e75553fc4ab29f729e4c423964762301a91374bddd94f'
  '12003309eb9c8d5915f32c3f896523d777713ca24a3d6df3094a13e97c194c662561abc9181e1efa25d0876fc9bb48385dfdb747e70a64250dab83b920196636'
)

prepare() {
  # Use a copy of the gnome-clocks icon included in this package rather than require gnome-clocks to be installed
  sed -i 's|org\.gnome\.clocks|timer-for-harvest|g' $pkgname-$pkgver/assets/timer-for-harvest.desktop
}

build() {
  export CARGO_HOME="$srcdir"
  cd $pkgname-$pkgver
  RUSTFLAGS='-C target-cpu=native' cargo build --locked --release
}

package() {
  install -Dm644 $pkgname.svg "$pkgdir/usr/share/pixmaps/$pkgname.svg"
  cd $pkgname-$pkgver
  install -Dm755 target/release/$pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 assets/$pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
}
