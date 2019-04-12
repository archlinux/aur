# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Igor Nemilentsev <trezorg@gmail.com>
# Contributor: Gaetan Bisson <bisson@archlinux.org>

pkgname=idnkit
pkgver=2.3
pkgrel=1
pkgdesc='Provides functionalities about Internationalized Domain Name processing'
url='https://www.nic.ad.jp/ja/idn/idnkit/download/'
license=('custom:BSD')
arch=('x86_64')
depends=('glibc')
backup=('etc/idnalias.conf' 'etc/idn2.conf')
options=('!makeflags')
source=("http://jprs.co.jp/idn/${pkgname}-${pkgver}.tar.bz2"
        "http://jprs.co.jp/idn/${pkgname}-doc-${pkgver}.tar.bz2")
sha1sums=('ec256455d801af3b666d65eb7c01b6086ab6a743'
          'abf032cde1bef9dbd0bfddd85ee525c7f1012ac2')

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
