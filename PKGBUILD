# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgdesc='WPE WebKit backend from RDK (Wayland build)'
pkgname=wpebackend-rdk-git
pkgver=r132.4e9a79d
pkgrel=2
url=https://github.com/WebPlatformForEmbedded/WPEBackend-rdk
license=(custom:BSD)
arch=(x86_64)
groups=(wpe)
provides=(wpebackend-rdk)
conflicts=(wpebackend-rdk)
makedepends=(cmake)
depends=(libwpe glib2 opengl-driver wayland)
source=("${pkgname}::git+${url}")
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
	rm -rf _build
	cmake \
		-DCMAKE_BUILD_TYPE=RelWithDebInfo \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DUSE_BACKEND_WAYLAND_EGL=ON \
		-DUSE_INPUT_LIBINPUT=OFF \
		-DUSE_INPUT_UDEV=OFF \
		-DUSE_INPUT_WAYLAND=ON \
		-B_build -S"${pkgname}"
	cmake --build _build
}

package () {
	DESTDIR="${pkgdir}" cmake --build _build --target install
	rm -f "${pkgdir}/usr/lib/libWPEBackend-default.so"
	install -Dm644 "${pkgname}/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
