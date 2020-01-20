# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgdesc='WPE launcher and webapp container'
pkgname=cog-git
pkgver=r134.f421c0a
pkgrel=4
license=(MIT)
url=https://github.com/Igalia/cog
arch=(x86_64 i686 aarch64 armv7l armv7h)
depends=(libxkbcommon wpebackend-fdo-git wpewebkit)
groups=(wpe)
provides=(cog)
conflicts=(cog)
makedepends=(cmake)
source=("${pkgname}::git+${url}")
sha512sums=(SKIP)

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
		-DCOG_PLATFORM_FDO=ON \
		"../${pkgname}"
	cmake --build .
}

package () {
	DESTDIR="${pkgdir}" cmake --build _build --target install
	install -Dm644 "${pkgname}/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
	# TODO: Remove once the need for the symlink is gone.
	ln -sf 'libWPEBackend-fdo-0.1.so' "${pkgdir}/usr/lib/libWPEBackend-default.so"
}
