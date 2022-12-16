# Maintainer: Robert Hamblin <hamblingreen@hotmail.com>
# Contributor: Rene Hickersberger <r@renehsz.com>
pkgname=mepo
pkgver=1.1
pkgrel=3
pkgdesc="Fast, simple, and hackable OSM map viewer for Linux"
arch=('i686' 'x86_64' 'arm' 'aarch64')
url="https://git.sr.ht/~mil/mepo"
license=('GPL3')
depends=('jq' 'curl' 'zenity' 'xorg-xwininfo' 'geoclue' 'ncurses' 'findutils')
makedepends=('zig>=0.9' 'sdl2' 'sdl2_image' 'sdl2_ttf' 'sdl2_gfx')
checkdepends=('zig>=0.9')
changelog=
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('51e7ba2b3d159b0eb49526530cc6cf7200c734d565c319c923507e734b26c6bf0588b8275c2fac7c963af21c8a575a7a9e3708ffdf83b68a35082a979fb4c523')

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

