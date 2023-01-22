# Maintainer: Robert Hamblin <hamblingreen@hotmail.com>
# Contributor: Rene Hickersberger <r@renehsz.com>
pkgname=mepo
pkgver=1.1.1
pkgrel=1
pkgdesc="Fast, simple, and hackable OSM map viewer for Linux"
arch=('i686' 'x86_64' 'arm' 'aarch64')
url="https://git.sr.ht/~mil/mepo"
license=('GPL3')
depends=('jq' 'curl' 'zenity' 'xorg-xwininfo' 'geoclue' 'ncurses' 'findutils')
makedepends=('zig>=0.10.1' 'sdl2' 'sdl2_image' 'sdl2_ttf' 'sdl2_gfx')
checkdepends=('zig>=0.10.1')
changelog=
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
	 "version-check.patch")
sha512sums=('ad76ba18d297bda5a9df73db5c709049e3fcb7388de819632836e58d2cce858c7b1cacad4f6f22accc73663df13347c0f53bd87738c61445cb355d90fd814f75'
            'd0d504b4e9bd346dd4d3af2a73618ca83f7187f7a9a069839ad59b82f6539d8ef22b361af50f74c171e4ab5f942f62aedcb5d27e928ff1693b988710016f4d83')

prepare() {
  cd "$pkgname-$pkgver"

  patch --strip=1 < ${srcdir}/version-check.patch
}

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

