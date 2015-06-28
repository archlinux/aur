# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=radsecproxy
pkgver=1.6.6
pkgrel=2
pkgdesc="a generic RADIUS proxy that in addition to to usual RADIUS UDP transport, also supports TLS (RadSec), as well as RADIUS over TCP and DTLS"
arch=('i686' 'x86_64')
url="https://software.uninett.no/radsecproxy/"
depends=('openssl')
optdepends=('freeradius: radius server')
license=('GPL')
backup=('etc/radsecproxy/radsecproxy.conf')
validpgpkeys=('8C4CD511095E982EB0EFBFA21E8BF34923291265')
source=("https://software.uninett.no/${pkgname}/${pkgname}-${pkgver}.tar.xz"{,.asc}
	'radsecproxy.service')
sha256sums=('278251399e326f9afacd1df8c7de492ec5ae6420085f71630da8f6ce585297ef'
            'SKIP'
            '9f1c028311d716651fc33aa6d4a44676af03330b8297a2f095259203055bc923')

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

