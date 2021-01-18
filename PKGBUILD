# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgdesc='General-purpose library specifically developed for the WPE-flavored port of WebKit.'
pkgname=libwpe-git
pkgver=1.9.1.r0.g6458ea3
pkgrel=1
url=https://github.com/WebPlatformForEmbedded/libwpe
arch=(x86_64 i686 aarch64 armv7l armv7h)
groups=(wpe)
makedepends=(mesa git meson)
provides=(libwpe libwpe-1.0.so)
conflicts=(libwpe)
replaces=(wpebackend-git)
depends=(gcc-libs libxkbcommon)
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

build () {
	arch-meson "${pkgname}" build
	meson compile -C build
}

check () {
	meson test -C build --print-errorlogs
}

package () {
	DESTDIR="${pkgdir}" meson install -C build
	install -Dm644 "${pkgname}/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
