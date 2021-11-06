# Maintainer: h8red <h8red AT yandex.ru>

pkgname=maradns
pkgver=3.5.0021
pkgrel=1
pkgdesc="A security-aware DNS server"
arch=('i686' 'x86_64')
depends=(glibc)
source=(https://maradns.samiam.org/download/3.5/$pkgver/$pkgname-$pkgver.tar.xz maradns.service maradns-zoneserver.service)
md5sums=('2d8cf07fd52dff92bbbaaee3e0109234'
         'd9111d9f8b7bb8b29e9327ec9e9fbb00'
         'c694d032744dafaf6ac755fe4f670438')
url="http://maradns.org"
license=('custom')

build() {
	cd ${srcdir}/${pkgname}-${pkgver}
	./configure
	make || return 1
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver}
	
	install -d ${pkgdir}/usr/{bin,sbin} || return 1
	install -d ${pkgdir}/usr/share/man/man{1,5,8} || return 1
	install -d ${pkgdir}/etc/maradns || return 1
	install -d ${pkgdir}/usr/lib/systemd/system || return 1
	install -d ${pkgdir}/usr/share/licenses/${pkgname}

	BUILDDIR=${srcdir}/${pkgname}-${pkgver}/build PREFIX=${pkgdir}/usr RPM_BUILD_ROOT=${pkgdir} make install || return 1

	install -m644 ../{maradns,maradns-zoneserver}.service ${pkgdir}/usr/lib/systemd/system
	install -m644 COPYING ${pkgdir}/usr/share/licenses/${pkgname}
	
	mv ${pkgdir}/usr/sbin/* ${pkgdir}/usr/bin
	mv ${pkgdir}/etc/{dwood3rc,mararc} ${pkgdir}/etc/maradns
	rm -r ${pkgdir}/usr/sbin
}
