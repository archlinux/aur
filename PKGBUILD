# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgdesc='Small and embeddable JavaScript engine'
pkgname=quickjs
pkgver=2020.03.16
pkgrel=1
url='https://bellard.org/quickjs'
depends=(glibc gcc-libs)
arch=(x86_64)
options=(!strip)
license=(custom:MIT)
_pv="${pkgname}-${pkgver//./-}"
source=("${url}/${_pv}.tar.xz")
sha512sums=('04b017c6bfd50b3d5029946178eb870270ca146a2ca99eb142f91acf0b8e04ce02e3e99549ee9832706aed72849beaaf33f95662aad6172a8cf109a0d78d8370')

prepare () {
	cat >> "${_pv}/Makefile" <<-EOF
	CFLAGS += ${CFLAGS}
	LDFLAGS += ${LDFLAGS}
	EOF
}

build () {
	make -C "${_pv}" prefix=/usr
}

package () {
	make -C "${_pv}" prefix="${pkgdir}/usr" install

	install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" "${_pv}"/doc/*.*

	# Fixup permissions
	chmod 644 "${pkgdir}"/usr/lib/quickjs/*.a
}
