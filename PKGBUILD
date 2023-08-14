# Maintainer: Robert Hamblin <hamblingreen@hotmail.com>
# Contributor: Rene Hickersberger <r@renehsz.com>
pkgname=mepo
pkgver=1.2.0
pkgrel=1
pkgdesc="Fast, simple, and hackable OSM map viewer for Linux"
arch=('i686' 'x86_64' 'arm' 'aarch64')
url="https://git.sr.ht/~mil/mepo"
license=('GPL3')
depends=('jq' 'curl' 'zenity' 'xorg-xwininfo' 'geoclue' 'ncurses' 'findutils' 'sdl2_gfx' 'sdl2_image' 'sdl2_ttf')
makedepends=('zig>=0.11' 'sdl2')
checkdepends=('zig>=0.11')
changelog=
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('e01b19a578f9ffa340eac62e1db75495b424fe9bff98b9d25cf2c3cd6a402e8c756463582757bbd979aa927cd2e8c1ded2c25f6746851fb2a39a1257794fbbf3')

build() {
  cd "$pkgname-$pkgver"

  zig build -Drelease-safe=true
  zig-out/bin/mepo -docman > mepo.1
}

check() {
  cd "$pkgname-$pkgver"

  zig build test
}

package() {
  cd "$pkgname-$pkgver"

  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/applications"
  mkdir -p "$pkgdir/usr/share/pixmaps"
  mkdir -p "$pkgdir/usr/share/man/man1"
  install scripts/mepo_* "$pkgdir/usr/bin/"
  install "zig-out/bin/mepo" "$pkgdir/usr/bin/"
  sed -i 's:/usr/libexec:/usr/lib:g' $pkgdir/usr/bin/mepo_ui_menu_user_pin_updater.sh
  install "zig-out/share/applications/mepo.desktop" "$pkgdir/usr/share/applications"
  install "zig-out/share/pixmaps/mepo.png" "$pkgdir/usr/share/pixmaps"
  install "mepo.1" "$pkgdir/usr/share/man/man1"
}

