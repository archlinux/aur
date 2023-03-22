# Maintainer: Robert Hamblin <hamblingreen@hotmail.com>
# Contributor: Rene Hickersberger <r@renehsz.com>
pkgname=mepo
pkgver=1.1.2
pkgrel=3
pkgdesc="Fast, simple, and hackable OSM map viewer for Linux"
arch=('i686' 'x86_64' 'arm' 'aarch64')
url="https://git.sr.ht/~mil/mepo"
license=('GPL3')
depends=('jq' 'curl' 'zenity' 'xorg-xwininfo' 'geoclue' 'ncurses' 'findutils' 'sdl2_gfx' 'sdl2_image' 'sdl2_ttf')
makedepends=('zig>=0.10.1' 'sdl2')
checkdepends=('zig>=0.10.1')
changelog=
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('bc65abf5d6fc4433d8b6ce4d7efa78f09239f70cc2ef816706ad81d5748132bcf3fa9ba50147cd7e633a9fd306fdb00e886b31b6645444b1b1e5906bf28e4eb7')

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

