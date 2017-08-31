# Maintainer:	Ondřej Surý <ondrej@sury.org>
# Maintainer:	Julian Brost <julian@0x4a42.net>
# Contributor:	Oleander Reis <oleander@oleander.cc>
# Contributor:	Otto Sabart <seberm[at]gmail[dot]com>

_srcname=knot
pkgname=${_srcname}
pkgver=2.5.4
pkgrel=1
pkgdesc='high-performance authoritative-only DNS server'
url='https://www.knot-dns.cz/'
arch=('i686' 'x86_64')
license=('GPL3')
install=install
depends=('fstrm'
         'gnutls>=3.0'
         'jansson'
         'libcap-ng'
         'libedit'
         'libsystemd'
         'liburcu>=0.5.4'
         'lmdb'
         'protobuf-c'
         'python'
         'zlib')
makedepends=('systemd')
source=("https://secure.nic.cz/files/knot-dns/${_srcname}-${pkgver}.tar.xz"
        'knot.service'
        'knot.tmpfiles')
sha256sums=('3fde76e9084b75df374709cb73a8289f77c6a95b7ccff8584d7423566faa24f0'
            'caa870a9c93c57c6311f9e8fb5685a9179bb9839a27a30cc1712c91df0d15090'
            '592ffb904b697b8c09ab95b3874ad00637333f1805ab2ab0ee50b4f484108ee2')

build() {
	cd "${srcdir}/${_srcname}-${pkgver}"

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
	cd "${srcdir}/${_srcname}-${pkgver}"
	make check
}

package() {
	cd "${srcdir}/${_srcname}-${pkgver}"

	make DESTDIR="${pkgdir}/" install
	install -Dm 644 "${srcdir}/knot.service" "${pkgdir}/usr/lib/systemd/system/knot.service"
	install -Dm 644 "${srcdir}/knot.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/knot.conf"
}
