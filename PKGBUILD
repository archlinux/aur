# Maintainer:	Ondřej Surý <ondrej@sury.
# Contributor:	Oleander Reis <oleander@oleander.cc>
# Contributor:	Otto Sabart <seberm[at]gmail[dot]com>

pkgname=knot
pkgver=1.6.4
pkgrel=1
pkgdesc='high-performance authoritative-only DNS server'
url='https://www.knot-dns.cz/'
arch=('i686' 'x86_64')
license=('GPL3')
install=install
depends=('liburcu>=0.5.4' 'openssl>=1.0.0' 'zlib' 'liblmdb')
makedepends=('autoconf>=2.65' 'libtool' 'flex>=2.5.3' 'bison>=2.3')
source=("https://secure.nic.cz/files/knot-dns/${pkgname}-${pkgver}.tar.xz"
        'knot.service')
sha256sums=('7d0809ad489bbbc3f7904687559ee750f3c1f3a7180fab238ba06fcedd00d8af'
            'caa870a9c93c57c6311f9e8fb5685a9179bb9839a27a30cc1712c91df0d15090')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"

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
	cd "${srcdir}/${pkgname}-${pkgver}"
  make check
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	make DESTDIR="${pkgdir}/" install
	install -Dm 644 "${srcdir}/knot.service" "${pkgdir}/usr/lib/systemd/system/knot.service"
}

check() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make check
}
