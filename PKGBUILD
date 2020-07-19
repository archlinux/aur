# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgdesc='Small and embeddable JavaScript engine'
pkgname=quickjs
pkgver=2020.07.05
pkgrel=1
url=https://bellard.org/quickjs
depends=(gcc-libs)
arch=(x86_64)
options=(!strip)
license=(custom:MIT)
_pv="${pkgname}-${pkgver//./-}"
source=("${url}/${_pv}.tar.xz")
sha512sums=('2be41a8779a24c4b4368f2523462afe7743050351cac7259dd9585dfad87121a82c78ac9e00f9ff9aabcffa307ea00111269efc9aaf92d4cca1e8ad8a7109bdb')

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
