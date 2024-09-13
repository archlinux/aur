# Maintainer: willemw <willemw12@gmail.com>
# Contributor: Lucca Pellegrini <luccapellegrini@gmail.com>
# Contributor: Rene Hickersberger <r@renehsz.com>
# Contributor: Robert Hamblin <hamblingreen@hotmail.com>

pkgname=mepo-git
pkgver=1.3.1.r2.ga1f5337
pkgrel=2
pkgdesc='Fast, simple, hackable OSM (OpenStreetMap) map viewer'
#arch=(x86_64)
arch=(i686 x86_64 arm aarch64)
url=https://mepo.lrdu.org
license=(GPL-3.0-or-later)
depends=(
  curl jq xorg-xwininfo ncurses zenity
  findutils geoclue sdl2_gfx sdl2_image sdl2_ttf)
makedepends=(git sdl2 zig)
checkdepends=(zig)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+https://git.sr.ht/~mil/mepo")
sha256sums=('SKIP')

pkgver() {
  git -C $pkgname describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  sed -i 's|/usr/libexec|/usr/lib|g' $pkgname/scripts/mepo_ui_menu_user_pin_updater.sh
}

build() {
  cd $pkgname
  zig build -Doptimize=ReleaseSafe
}

check() {
  cd $pkgname
  zig test src/test.zig
}

package() {
  cd $pkgname

  install -Dm644 README.md -t "$pkgdir/usr/share/${pkgname%-git}"

  install -Dm755 zig-out/bin/* -t "$pkgdir/usr/bin"

  install -Dm644 zig-out/share/applications/mepo.desktop -t "$pkgdir/usr/share/applications"

  install -Dm644 zig-out/share/pixmaps/mepo.png -t "$pkgdir/usr/share/pixmaps"
  install -Dm644 zig-out/share/icons/hicolor/128x128/apps/mepo.png -t "$pkgdir/usr/share/icons/hicolor/128x128/apps"
  install -Dm644 zig-out/share/icons/hicolor/512x512/apps/mepo.png -t "$pkgdir/usr/share/icons/hicolor/512x512/apps"
}
