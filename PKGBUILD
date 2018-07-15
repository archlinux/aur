# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgdesc='General-purpose library specifically developed for the WPE-flavored port of WebKit.'
pkgname=wpebackend-git
pkgver=0.2.0.r0.g411decf
pkgrel=2
url=https://github.com/WebPlatformForEmbedded/WPEBackend
arch=(x86_64 i686)
groups=(wpe)
makedepends=(cmake opengl-driver)
provides=(wpebackend)
conflicts=(wpebackend)
depends=(gcc-libs)
license=(custom:BSD)
source=("${pkgname}::git+${url}")
sha256sums=(SKIP)

pkgver () {
	cd "${pkgname}"
	(
		set -o pipefail
		git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

prepare () {
	mkdir -p _build
}

build () {
	cd _build
	cmake \
		-DCMAKE_BUILD_TYPE=RelWithDebInfo \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_INSTALL_LIBDIR=/usr/lib \
		"../${pkgname}"
	cmake --build .
}

package () {
	DESTDIR="${pkgdir}" cmake --build _build --target install
	install -Dm644 "${pkgname}/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
