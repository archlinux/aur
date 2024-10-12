# Maintainer: Robert Hamblin <hamblingreen@hotmail.com>
# Contributor: Rene Hickersberger <r@renehsz.com>
# Contributor: Dimitri Kaparis <dimitri@kaparis.name>
pkgname=mepo
pkgver=1.3.3
pkgrel=1
pkgdesc="Fast, simple, and hackable OSM map viewer for Linux"
arch=('i686' 'x86_64' 'arm' 'aarch64')
url="https://git.sr.ht/~mil/mepo"
license=('GPL3')
depends=('jq' 'curl' 'zenity' 'xorg-xwininfo' 'geoclue' 'ncurses' 'findutils' 'sdl2_gfx' 'sdl2_image' 'sdl2_ttf')
makedepends=('zig>=0.13.0' 'sdl2')
checkdepends=('zig>=0.13.0')
changelog=
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('9d5b1c7dc411c9d5258753d3c43b4ba55d6b460044fbd3a8872f4532f5b3472123b43368910a46724bcce238d19e66dfd552810a96cb16bf84f67f04b1f6b2e4')

build() {
  cd "$pkgname-$pkgver"

  zig build -Doptimize=ReleaseSafe
  zig-out/bin/mepo -docmd > doc.md
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
  mkdir -p "$pkgdir/usr/share/doc/$pkgname"
  install scripts/mepo_* "$pkgdir/usr/bin/"
  install "zig-out/bin/mepo" "$pkgdir/usr/bin/"
  sed -i 's:/usr/libexec:/usr/lib:g' $pkgdir/usr/bin/mepo_ui_menu_user_pin_updater.sh
  install "zig-out/share/applications/mepo.desktop" "$pkgdir/usr/share/applications"
  install "zig-out/share/pixmaps/mepo.png" "$pkgdir/usr/share/pixmaps"
  install "mepo.md" -t "$pkgdir/usr/share/doc/$pkgname/"
}

