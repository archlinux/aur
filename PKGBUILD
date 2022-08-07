# Maintainer: Dan Fuhry <dan@fuhry.com>
# :mode=shellscript:
pkgname=kcrap
pkgver=0.4.0
pkgrel=1
pkgdesc="Kerberos Challenge Response Authentication Protocol"
license=('MIT')
depends=('krb5')
makedepends=('autoconf')
url="https://github.com/fuhry/"
source=("https://github.com/fuhry/kcrap/archive/refs/tags/v${pkgver}.tar.gz"
		"kcrap.service")
sha256sums=('fe2adc807622989e1ff811a9415387dfb02114980e4dee07e2afd87d41694e1d'
		    'f0aaac33b138a07859d860e391eb8177623d3510cfec1897402f528d322e552f')

arch=('any')
backup=('etc/kcrap_server.conf')

build()
{
	cd "${srcdir}/kcrap-${pkgver}"
	autoreconf -i
	./configure --prefix=/usr --sbindir=/usr/bin --sysconfdir=/etc CFLAGS=-I/usr/include/et
	make
}

package() {
	cd "${srcdir}/kcrap-${pkgver}"
	make install DESTDIR="${pkgdir}"
	mkdir -p "${pkgdir}/etc/"
	cp -v "server/kcrap_server.conf" "${pkgdir}/etc/"
	mkdir -p "${pkgdir}/usr/lib/systemd/system"
	cp -v "${srcdir}/kcrap.service" "${pkgdir}/usr/lib/systemd/system/"
	
	mkdir -p ${pkgdir}/usr/bin
	mv ${pkgdir}/usr/sbin/* ${pkgdir}/usr/bin/
	rm -rf ${pkgdir}/usr/sbin
}

