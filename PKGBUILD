# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgdesc='Small and embeddable JavaScript engine'
pkgname=quickjs
pkgver=2019.07.21
pkgrel=1
url='https://bellard.org/quickjs'
depends=(glibc lib32-glibc lib32-gcc-libs)
arch=(x86_64)
options=(!strip)
license=(custom:MIT)
_pv="${pkgname}-${pkgver//./-}"
source=("${url}/${_pv}.tar.xz")
sha512sums=('09c625b43051a4919f5acabe498b5ba41101592cfb42b4bc677d949a438d1fac5cead17b335bf7adf5b270a35fb289bc5345895e3ebf69ee6c10b4af61ee21c6')

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
