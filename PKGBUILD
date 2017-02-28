# Maintainer:	Ondřej Surý <ondrej@sury.
# Contributor:	Oleander Reis <oleander@oleander.cc>
# Contributor:	Otto Sabart <seberm[at]gmail[dot]com>

srcname=knot
pkgname=${srcname}
pkgver=2.4.1
pkgrel=2
pkgdesc='high-performance authoritative-only DNS server'
url='https://www.knot-dns.cz/'
arch=('i686' 'x86_64')
license=('GPL3')
install=install
depends=('liburcu>=0.5.4' 'gnutls>=3.0' 'zlib' 'lmdb' 'jansson' 'protobuf-c' 'fstrm')
source=("https://secure.nic.cz/files/knot-dns/${srcname}-${pkgver}.tar.xz"
        'knot.service'
        'knot.tmpfiles')
sha256sums=('c064ddf99bf5fc24dd3c6a3a523394760357e204c8b69f0e691e49bc0d9b704c'
            'caa870a9c93c57c6311f9e8fb5685a9179bb9839a27a30cc1712c91df0d15090'
            '592ffb904b697b8c09ab95b3874ad00637333f1805ab2ab0ee50b4f484108ee2')

build() {
	cd "${srcdir}/${srcname}-${pkgver}"

	./configure \
		--prefix /usr \
		--sbindir /usr/bin \
		--sysconfdir=/etc \
		--localstatedir=/var/lib \
		--libexecdir=/usr/lib/knot \
		--with-rundir=/run/knot \
		--with-storage=/var/lib/knot \
		--enable-recvmmsg=yes \
		--enable-dnstap \
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
