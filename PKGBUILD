# Maintainer:	Ondřej Surý <ondrej@sury.
# Contributor:	Oleander Reis <oleander@oleander.cc>
# Contributor:	Otto Sabart <seberm[at]gmail[dot]com>

srcname=knot
pkgname=${srcname}
pkgver=2.1.0
pkgrel=1
pkgdesc='high-performance authoritative-only DNS server'
url='https://www.knot-dns.cz/'
arch=('i686' 'x86_64')
license=('GPL3')
install=install
depends=('liburcu>=0.5.4' 'gnutls>=3.0' 'zlib' 'liblmdb' 'jansson')
makedepends=('autoconf>=2.65' 'libtool' 'flex>=2.5.3' 'bison>=2.3')
source=("https://secure.nic.cz/files/knot-dns/${srcname}-${pkgver}.tar.xz"
        'knot.service')
sha256sums=('1f6ea98da000386bf86e015655a9ec974d361b62711caf06b55f3d9bb2aa85a9'
            'caa870a9c93c57c6311f9e8fb5685a9179bb9839a27a30cc1712c91df0d15090')

build() {
	cd "${srcdir}/${srcname}-${pkgver}"

	./configure \
		--prefix /usr \
		--sysconfdir=/etc \
		--localstatedir=/var/lib \
		--libexecdir=/usr/lib/knot \
		--with-rundir=/run/knot \
		--with-storage=/var/lib/knot \
		--enable-recvmmsg=yes \
		--disable-silent-rules

	make
}

check() {
	cd "${srcdir}/${srcname}-${pkgver}"
	make check
}

package() {
	cd "${srcdir}/${srcname}-${pkgver}"

	make DESTDIR="${pkgdir}/" install
	install -Dm 644 "${srcdir}/knot.service" "${pkgdir}/usr/lib/systemd/system/knot.service"
}

check() {
	cd "${srcdir}/${srcname}-${pkgver}"
	make check
}
