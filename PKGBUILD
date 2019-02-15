# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=wf-sound-control-git
pkgver=r8.21fb8fd
pkgrel=1
pkgdesc='Small utility for the Wayfire compositor to control sound volume'
url=https://wayfire.org
arch=(x86_64)
license=(custom:MIT)
provides=("${pkgname%-fit}")
conflicts=("${pkgname%-git}")
depends=(gtkmm3)
makedepends=(wayland-protocols meson ninja git)
source=("${pkgname}::git+https://github.com/WayfireWM/wf-sound-control")
sha512sums=('SKIP')

pkgver () {
	cd "${pkgname}"
	(
		set -o pipefail
		git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build () {
	rm -rf build
	arch-meson "${pkgname}" build
	ninja -C build
}

package () {
	DESTDIR="${pkgdir}" ninja -C build install
	cd "${pkgname}"
}
