# Maintainer:	Ondřej Surý <ondrej@sury.
# Contributor:	Oleander Reis <oleander@oleander.cc>
# Contributor:	Otto Sabart <seberm[at]gmail[dot]com>

srcname=knot
pkgname=${srcname}-lts
pkgver=1.6.8
pkgrel=1
pkgdesc='high-performance authoritative-only DNS server (Long Term Support)'
url='https://www.knot-dns.cz/'
arch=('i686' 'x86_64')
license=('GPL3')
install=install
depends=('liburcu>=0.5.4' 'openssl>=1.0.0' 'zlib' 'lmdb')
makedepends=('autoconf>=2.65' 'libtool' 'flex>=2.5.3' 'bison>=2.3')
source=("https://secure.nic.cz/files/knot-dns/${srcname}-${pkgver}.tar.xz"
        'knot.service'
        'knot.tmpfiles')
sha256sums=('8d95dfd359fb187289d7d085e217d8fabb6022135d358134ed4165418a269237'
            'caa870a9c93c57c6311f9e8fb5685a9179bb9839a27a30cc1712c91df0d15090'
            '592ffb904b697b8c09ab95b3874ad00637333f1805ab2ab0ee50b4f484108ee2')

build() {
	cd "${srcdir}/${srcname}-${pkgver}"

	CFLAGS="-DOPENSSL_NO_GOST -O2 -g" \
	./configure \
		--prefix /usr \
		--sbindir /usr/bin \
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
	install -Dm 644 "${srcdir}/knot.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/knot.conf"
}

check() {
	cd "${srcdir}/${srcname}-${pkgver}"
	make check
}
