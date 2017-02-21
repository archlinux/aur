# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=radsecproxy
pkgver=1.6.8
pkgrel=2
pkgdesc='a generic RADIUS proxy that in addition to to usual RADIUS UDP transport, also supports TLS (RadSec), as well as RADIUS over TCP and DTLS'
arch=('i686' 'x86_64')
url='https://software.uninett.no/radsecproxy/'
depends=('openssl')
optdepends=('freeradius: radius server')
license=('GPL')
backup=('etc/radsecproxy/radsecproxy.conf')
validpgpkeys=('8C4CD511095E982EB0EFBFA21E8BF34923291265')
source=("https://software.uninett.no/${pkgname}/${pkgname}-${pkgver}.tar.gz"{,.asc}
	'radsecproxy.service')
sha256sums=('9923203c3aaf17e31d5bc7a61b99e5a6aa0ef19a8397616f6ef9c0c41948f7d2'
            'SKIP'
            '3cc1e1a5746e4bd543d2646c6a3b444de05f38d29ca7408a1f5382ab34366cf8')

build() {
	cd ${pkgname}-${pkgver}/

	./configure --prefix=/usr \
		--bindir=/usr/bin \
		--sbindir=/usr/bin \
		--sysconfdir=/etc/radsecproxy
	make
}

package() {
	cd ${pkgname}-${pkgver}/

	make DESTDIR="${pkgdir}" install

	install -D -m0644 radsecproxy.conf.5 "${pkgdir}"/usr/share/man/man5/radsecproxy.conf.5
	install -D -m0644 radsecproxy.conf-example "${pkgdir}"/etc/radsecproxy/radsecproxy.conf

	install -D -m0644 ${srcdir}/radsecproxy.service "${pkgdir}"/usr/lib/systemd/system/radsecproxy.service
}

