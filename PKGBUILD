# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=wcm-git
pkgver=r116.2f3e075
pkgrel=1
pkgdesc='Wayfire Config Manager'
url=https://wayfire.org
arch=(x86_64)
license=(custom:MIT)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
depends=(wf-config gtkmm3 wayfire)
makedepends=(wayland-protocols meson ninja git extra-cmake-modules)
source=("${pkgname}::git+https://github.com/WayfireWM/wcm")
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
}

