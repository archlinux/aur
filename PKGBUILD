# Maintainer: Lucca Pellegrini <luccapellegrini@gmail.com>
# Contributor: Rene Hickersberger <r@renehsz.com>
# Contributor: Robert Hamblin <hamblingreen@hotmail.com>
pkgname=mepo-git
_pkgname=mepo
pkgver=1.3.1.2.ga1f5337
pkgrel=1
pkgdesc="Fast, simple, and hackable OSM map viewer for Linux (development version)"
arch=('i686' 'x86_64' 'arm' 'aarch64')
url="https://git.sr.ht/~mil/mepo"
license=('GPL3')
depends=('jq' 'curl' 'zenity' 'xorg-xwininfo' 'geoclue' 'ncurses' 'findutils' 'sdl2_gfx' 'sdl2_image' 'sdl2_ttf')
makedepends=('git' 'zig>=0.12.0' 'sdl2')
checkdepends=('zig>=0.12.0')
provides=('mepo')
conflicts=('mepo')
changelog=
source=("$_pkgname"::"git+$url")
sha512sums=(SKIP)

pkgver() {
	cd "$_pkgname"

	git describe --long --tags | sed 's/^v//;s/\\([^-]*-g\\)/r\\1/;s/-/./g'
}

build() {
	cd "$_pkgname"

	zig build -Doptimize=ReleaseSafe
}

check() {
	cd "$_pkgname"

	zig build test
}

package() {
	cd "$_pkgname"

	mkdir -p "$pkgdir/usr/bin"
	mkdir -p "$pkgdir/usr/share/applications"
	mkdir -p "$pkgdir/usr/share/pixmaps"
	install scripts/mepo_* "$pkgdir/usr/bin/"
	install "zig-out/bin/mepo" "$pkgdir/usr/bin/"
	sed -i 's:/usr/libexec:/usr/lib:g' $pkgdir/usr/bin/mepo_ui_menu_user_pin_updater.sh
	install "zig-out/share/applications/mepo.desktop" "$pkgdir/usr/share/applications"
	install "zig-out/share/pixmaps/mepo.png" "$pkgdir/usr/share/pixmaps"
}
