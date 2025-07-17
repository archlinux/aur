# Maintainer: Matthew Given <contact at matthewgiven dot dev>
# Contributor:
_pkgname=sds
pkgname="${_pkgname}-git"
pkgver=r60.5347739
pkgrel=1
pkgdesc="Simple Dynamic Strings library for C"
arch=('x86_64')
url="https://github.com/antirez/sds"
license=('BSD-2-Clause')
makedepends=('git')
depends=('glibc')
source=("git+${url}"
	"${_pkgname}.patch")
	sha256sums=('SKIP'
		e1f4f94549c9102699be93994d23e715f337a33cde2bc269891236458e2f07f3)
provides=('sds=${pkgver}')

prepare() {
	cd "${srcdir}/${_pkgname}"
	patch -p0 -i "${srcdir}/${_pkgname}.patch"
}

build() {
	cd "${srcdir}/${_pkgname}"
	gcc -fPIC -c sds.c ${CFLAGS}
	gcc -shared -o libsds.so -Wl,-soname,libsds.so.0 sds.o ${LDFLAGS}
}

package() {
	cd "${srcdir}/${_pkgname}"

	install -Dm644 libsds.so "${pkgdir}/usr/lib/libsds.so.0"

	ln -sf "libsds.so.0" "${pkgdir}/usr/lib/libsds.so"

	install -Dm644 sds.h "${pkgdir}/usr/include/sds.h"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}
pkgver() {
	cd "${srcdir}/${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
