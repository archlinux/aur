# Contributor: Olivier Mehani <olivier.mehani@inria.fr>

pkgname=olsrd
_pkgvermaj=0.9
pkgver=${_pkgvermaj}.0.3
pkgrel=1
pkgdesc="OLSR daemon is an implementation of the Optimized Link State Routing protocol."
url="http://www.olsr.org"
license="BSD"
depends=('glibc')
provides=('olsrd-plugins')
conflicts=('olsrd-plugins')
install=
source=(http://www.olsr.org/releases/${_pkgvermaj}/olsrd-$pkgver.tar.bz2)
arch=('i686' 'x86_64')


build() {
	cd ${srcdir}/olsrd-$pkgver
	subdirs=`find lib/ -mindepth 1 -maxdepth 1 -type d`
	for dir in . ${subdirs}; do
		make OS=linux SBINDIR=/usr/sbin LIBDIR=/usr/lib  MANDIR=/usr/share/man/ -C $dir || return 1
	done
}

package() {
	cd ${srcdir}/olsrd-$pkgver
	subdirs=`find lib/ -mindepth 1 -maxdepth 1 -type d`
	for dir in . ${subdirs}; do
		make OS=linux SBINDIR=${pkgdir}/usr/sbin LIBDIR=${pkgdir}/usr/lib MANDIR=${pkgdir}/usr/share/man/ DESTDIR=${pkgdir} -C $dir install || return 1
	done
	install -D ${srcdir}/olsrd-$pkgver/license.txt ${pkgdir}/usr/share/licenses/${pkgname}/license.txt
	install -d ${pkgdir}/usr/share/doc/${pkgname}/
	install ${srcdir}/olsrd-$pkgver/{README-LINUX_NL80211.txt,README-Olsr-Extensions,CHANGELOG} ${pkgdir}/usr/share/doc/${pkgname}/
}
md5sums=('fa5cf15c29c7ebd9b8425267676c7865')
