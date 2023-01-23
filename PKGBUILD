# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=radsecproxy
pkgver=1.9.2
pkgrel=1
pkgdesc='a generic RADIUS proxy that in addition to to usual RADIUS UDP transport, also supports TLS (RadSec), as well as RADIUS over TCP and DTLS'
arch=('i686' 'x86_64')
url='https://radsecproxy.github.io/'
depends=('nettle' 'libnettle.so' 'openssl' 'libcrypto.so' 'libssl.so')
optdepends=('freeradius: radius server')
license=('GPL')
backup=('etc/radsecproxy/radsecproxy.conf')
validpgpkeys=('210FA7FB28E45779777BAA1C5963D59C3D68633B') # Fabian Mauchle <fabian.mauchle@switch.ch>
source=("https://github.com/${pkgname}/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz"{,.asc}
        'radsecproxy.service')
sha256sums=('33914c035b3060e0a206fc6f7e595163edd1b6ad6798bd1fc6dbf718ff034d42'
            'SKIP'
            '3cc1e1a5746e4bd543d2646c6a3b444de05f38d29ca7408a1f5382ab34366cf8')

prepare() {
	cd ${pkgname}-${pkgver}/

	autoreconf -fi
}

build() {
	cd ${pkgname}-${pkgver}/

	./configure \
		--prefix=/usr \
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

