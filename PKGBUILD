# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgdesc='Small and embeddable JavaScript engine'
pkgname=quickjs
pkgver=2019.12.21
pkgrel=1
url='https://bellard.org/quickjs'
depends=(glibc gcc-libs)
arch=(x86_64)
options=(!strip)
license=(custom:MIT)
_pv="${pkgname}-${pkgver//./-}"
source=("${url}/${_pv}.tar.xz")
sha512sums=('ce8a3de6979508ba0d484eb4138f852a35672b4d49040f3f158070e1ca5407b2eae4bd47c4c976b6d3156f92b01d17557297fed230f84af86d1baf111a5ce761')

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
