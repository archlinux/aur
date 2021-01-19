# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=aml-git
pkgdesc="Another/Andri's Main Loop"
pkgver=0.2.0
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
	git -C "$pkgname" describe --tags --abbrev=10 | sed 's/^v//; s/-/+/; s/-/./'
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
