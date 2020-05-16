# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=aml-git
pkgdesc="Another/Andri's Main Loop"
pkgver=r103.972e0c0
pkgrel=1
url=https://github.com/any1/aml
arch=(x86_64)
makedepends=(meson ninja git)
provides=(aml)
conflicts=(aml)
depends=(glibc)
license=(custom:ISC)
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
	rm -rf build
	arch-meson "${pkgname}" build -Dexamples=false
	ninja -C build
}

check () {
	meson test -C build
}

package () {
	DESTDIR="${pkgdir}" ninja -C build install
	install -Dm644 "${pkgname}/COPYING" \
		"${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
