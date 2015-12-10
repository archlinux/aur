# Maintainer: Sven Schneider <archlinux.sandmann@googlemail.com>

pkgname=openrtm-aist
pkgver=1.1.1
pkgrel=2
pkgdesc="The RT-Middleware provides a common platform for Robot Technology (RT)"
arch=('i686' 'x86_64')
url="http://www.openrtm.org"
license=('GPL')
depends=('omniorb417' 'ace')
makedepends=('python2')
source=("http://www.openrtm.org/pub/OpenRTM-aist/cxx/${pkgver}/OpenRTM-aist-${pkgver}.tar.bz2")
md5sums=('1d030c4972618f2f1e81cf83286af1d0')

build() {
	cd ${srcdir}/OpenRTM-aist-${pkgver}

	./configure --prefix=/usr --sysconfdir=/etc

	# Fix for Python 2 scripts
	sed -i "s,env python *$,env python2,g" \
		$(find . -type f -and -iname "*.py")
	sed -i "s,env python *$,env python2,g" \
		$(find . -type f -and \( -name "*rtm-skelwrapper" -or -name "*rtc-template" \))
	sed -i "s,/usr/bin/python *$,/usr/bin/env python2,g" $(find . -iname "*.py")

	make
}

package() {
	cd ${srcdir}/OpenRTM-aist-${pkgver}

	make DESTDIR=${pkgdir} install

	cd ${pkgdir}/etc

	# move rtc.conf.template to rtc.conf
	install -D -m644 rtc.conf.sample rtc.conf
	rm rtc.conf.sample
}

