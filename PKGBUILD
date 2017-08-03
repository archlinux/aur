# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=radsecproxy
pkgver=1.6.9
pkgrel=1
pkgdesc='a generic RADIUS proxy that in addition to to usual RADIUS UDP transport, also supports TLS (RadSec), as well as RADIUS over TCP and DTLS'
arch=('i686' 'x86_64')
url='https://software.uninett.no/radsecproxy/'
depends=('openssl')
optdepends=('freeradius: radius server')
license=('GPL')
backup=('etc/radsecproxy/radsecproxy.conf')
validpgpkeys=('8C4CD511095E982EB0EFBFA21E8BF34923291265')
source=("https://software.uninett.no/${pkgname}/${pkgname}-${pkgver}.tar.gz"{,.asc}
        '0001-openssl-1-1-0.patch'
        'radsecproxy.service')
sha256sums=('31e6bc97b81c3f1d2ec09cc57cef037c744a0583329947d316f3ef6a4b312a03'
            'SKIP'
            '2c550c52eb7cb05af1a251f212fb21db107715e6de071ca0957c6c12ef6f85dd'
            '3cc1e1a5746e4bd543d2646c6a3b444de05f38d29ca7408a1f5382ab34366cf8')

prepare() {
	cd ${pkgname}-${pkgver}/

	patch -Np1 < "${srcdir}"/0001-openssl-1-1-0.patch
}

build() {
	cd ${pkgname}-${pkgver}/

	autoreconf -fi
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

