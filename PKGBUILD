# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgdesc='Generic WPE WebKit backend using FreeDesktop technologies (Wayland)'
pkgname=wpebackend-fdo-git
pkgver=1.7.1.r18.gc3f9f7b
pkgrel=1
url=https://github.com/Igalia/WPEBackend-fdo
license=(custom:BSD)
arch=(x86_64 i686 aarch64 armv7l armv7h)
groups=(wpe)
provides=(wpebackend-fdo)
conflicts=(wpebackend-fdo)
makedepends=(mesa wayland-protocols git meson)
depends=(glib2 wayland libwpe-git libepoxy)
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

build () {
	arch-meson "${pkgname}" build
	meson compile -C build
}

check () {
	meson test -C build --print-errorlogs
}

package () {
	depends+=(libwpe-1.0.so libg{lib,object,io}-2.0.so)
	provides+=(libWPEBackend-fdo-1.0.so)

	DESTDIR="${pkgdir}" meson install -C build
	install -Dm644 "${pkgname}/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
