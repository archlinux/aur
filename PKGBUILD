# Maintainer: Robert Hamblin <hamblingreen@hotmail.com>
# Contributor: Rene Hickersberger <r@renehsz.com>
pkgname=mepo
pkgver=1.2.1
pkgrel=1
pkgdesc="Fast, simple, and hackable OSM map viewer for Linux"
arch=('i686' 'x86_64' 'arm' 'aarch64')
url="https://git.sr.ht/~mil/mepo"
license=('GPL3')
depends=('jq' 'curl' 'zenity' 'xorg-xwininfo' 'geoclue' 'ncurses' 'findutils' 'sdl2_gfx' 'sdl2_image' 'sdl2_ttf')
makedepends=('zig>=0.12.0' 'sdl2')
checkdepends=('zig>=0.12.0')
changelog=
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('1db1218a1cc43e4c4838f2b96c47ed3c0589efef2bff3aa7175a658e227b339032c22c0af3a4c95eb6b95a759d62315fd2a3fdf5e11706847c7fa02db5c7d63e')

build() {
  cd "$pkgname-$pkgver"

  zig build -Doptimize=ReleaseSafe
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

