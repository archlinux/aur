# Maintainer: Toke Høiland-Jørgensen <toke@toke.dk>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Hisato Tatekura <hisato_tatekura@excentrics.net>
# Contributor: Massimiliano Torromeo <massimiliano DOT torromeo AT google mail service>

pkgname=python-unbound
pkgver=1.10.0
pkgrel=1
pkgdesc='Validating, recursive, and caching DNS resolver: python binding'
url='https://unbound.net/'
license=('custom:BSD')
arch=('any')
options=('!libtool')
depends=('python' 'unbound' 'openssl')
makedepends=('expat' 'swig' 'openssl')
optdepends=('expat: unbound-anchor')
_basename='unbound'
validpgpkeys=('EDFAA3F2CA4E6EB05681AF8E9F6F1C2D7E045F8D')
source=("https://unbound.net/downloads/${_basename}-${pkgver}.tar.gz"{,.asc})
sha1sums=('2c175131f7f4c8f6fd2be4a03073d864596d0be6'
          'SKIP')

build() {
	cd "${srcdir}/${_basename}-${pkgver}"

	PYTHON=/usr/bin/python ./configure \
		--prefix=/usr \
		--sysconfdir=/etc \
		--localstatedir=/var \
		--enable-static=no \
		--disable-rpath \
		--with-conf-file=/etc/unbound/unbound.conf \
		--with-pidfile=/var/run/unbound.pid \
                --with-pyunbound

	make
}

package() {
	cd "${srcdir}/${_basename}-${pkgver}"

	make DESTDIR="${pkgdir}" install

        rm -r "${pkgdir}/etc"
        rm -r "${pkgdir}/usr/sbin"
        rm -r "${pkgdir}/usr/include"
        rm -r "${pkgdir}/usr/share"
        rm "${pkgdir}/usr/lib/libunbound.la"
        rm "${pkgdir}/usr/lib/libunbound.so"
        rm "${pkgdir}/usr/lib/libunbound.so.8"
        rm "${pkgdir}/usr/lib/libunbound.so.8.1.7"
        rm "${pkgdir}/usr/lib/pkgconfig/libunbound.pc"
        rmdir "${pkgdir}/usr/lib/pkgconfig"

	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
