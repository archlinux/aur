# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Igor Nemilentsev <trezorg@gmail.com>
# Contributor: Gaetan Bisson <bisson@archlinux.org>

pkgname=idnkit
pkgver=2.3
pkgrel=4
pkgdesc='Provides functionalities about Internationalized Domain Name processing'
url='https://www.nic.ad.jp/ja/idn/idnkit/download/'
license=('custom:BSD')
arch=('any')
depends=('glibc')
backup=('etc/idnalias.conf' 'etc/idn2.conf')
options=('!makeflags')
source=("https://jprs.co.jp/idn/${pkgname}-${pkgver}.tar.bz2"
        "https://jprs.co.jp/idn/${pkgname}-doc-${pkgver}.tar.bz2")
sha256sums=('26d07117650042ab4693f0e00960275d58a1be773e6d13c503ba384710f3e97e'
            '146399a5e17d11ecf8d654b23f235e2fa9e77decba8a292f01bec44a75829347')

prepare() {
	cd ${srcdir}/${pkgname}-${pkgver}
	sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" configure
}

build() {
	cd ${srcdir}/${pkgname}-${pkgver}
	./configure \
		--prefix=/usr \
		--sysconfdir=/etc \
		--localstatedir=/var \
		--enable-static=no
	make
}

package() {
    # install base
	cd ${srcdir}/${pkgname}-${pkgver}
	make DESTDIR="${pkgdir}" install

    # install doc
    cd ${srcdir}/${pkgname}-doc-${pkgver}
    make install docdir=${pkgdir}/usr/share/doc/${pkgname}

    # install license
	install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # cleanup
	rm "${pkgdir}"/etc/*.sample
}
