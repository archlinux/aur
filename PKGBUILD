# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=radsecproxy
pkgver=1.6.6
pkgrel=3
pkgdesc='a generic RADIUS proxy that in addition to to usual RADIUS UDP transport, also supports TLS (RadSec), as well as RADIUS over TCP and DTLS'
arch=('i686' 'x86_64')
url='https://software.uninett.no/radsecproxy/'
depends=('openssl')
optdepends=('freeradius: radius server'
	'libkeepalive: enable tcp keepalive')
license=('GPL')
backup=('etc/radsecproxy/radsecproxy.conf')
validpgpkeys=('8C4CD511095E982EB0EFBFA21E8BF34923291265')
source=("https://software.uninett.no/${pkgname}/${pkgname}-${pkgver}.tar.xz"{,.asc}
	'radsecproxy.service'
	'radsecproxy-keepalive.service')
sha256sums=('278251399e326f9afacd1df8c7de492ec5ae6420085f71630da8f6ce585297ef'
            'SKIP'
            '0483d60588701245864e3f7788f49b143a990be1776715c101d91b8bb0c70fbb'
            '5d4ff031051a3c8d7f851e26cd76fa9d8ed4b862d87d912415b7b9092cd78167')

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
	install -D -m0644 ${srcdir}/radsecproxy-keepalive.service "${pkgdir}"/usr/lib/systemd/system/radsecproxy-keepalive.service
}

