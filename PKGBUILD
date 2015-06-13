# $Id: PKGBUILD 146960 2012-01-19 17:53:37Z pierre $
# Maintainer: Pierre Schmitz <pierre@archlinux.de>

pkgname=php-suhosin
pkgver=0.9.37.1
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc='An advanced protection system for PHP installations'
url='http://suhosin.org/'
license=('PHP')
source=("http://download.suhosin.org/suhosin-${pkgver}.tar.gz"
#         "http://download.suhosin.org/suhosin-${pkgver}.tar.gz.sig"
        )
depends=('php')
checkdepends=('php-cgi')
backup=('etc/php/conf.d/suhosin.ini')
sha1sums=('9de7a89ef7d336501a41f452fd3936ae66f63a6e'
#          'SKIP'
)
# validpgpkeys=('E027452AFAB2A52F18AB6363B12D0447319F1ADB')

build() {
	cd ${srcdir}/suhosin-${pkgver}
	phpize
	./configure --prefix=/usr --enable-suhosin
	make
}

check() {
	cd ${srcdir}/suhosin-${pkgver}
	export NO_INTERACTION=1
	make test
	echo
}

package() {
	cd ${srcdir}/suhosin-${pkgver}
	make INSTALL_ROOT=${pkgdir} install
	# disable by default
	sed -i 's|extension = suhosin.so|;extension=suhosin.so|g' suhosin.ini
	install -D -m644 suhosin.ini ${pkgdir}/etc/php/conf.d/suhosin.ini
}
