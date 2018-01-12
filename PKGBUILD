# Maintainer: Michael Strecke <michael.strecke AT hotmail DOT de>
# Based on the php70-apcu Package by Stefan Sielaff <aur AT stefan-sielaff DOT de>

pkgname=php71-apcu
_pkgbase="${pkgname#php71-}"
_phpbase="${pkgname/-apcu}"
pkgver=5.1.8
pkgrel=1
pkgdesc="A userland caching module for php71"
arch=('i686' 'x86_64' 'armv7h')
url="https://pecl.php.net/package/APCu"
license=('PHP')
depends=('php71>=7.1.13')
provides=("php-${_pkgbase}=${pkgver}-${pkgrel}")
backup=("etc/php/conf.d/apcu.ini")
source=("https://pecl.php.net/get/${_pkgbase}-${pkgver}.tgz")
md5sums=('0ef8be2ee8acb4dba5a66b247a254995')

build() {
	cd "${srcdir}/${_pkgbase}-${pkgver}"
	phpize
	./configure --config-cache \
		--sysconfdir=/etc/php \
		--with-php-config=/usr/bin/php-config \
		--localstatedir=/var
	make
}

package() {
	cd "${srcdir}/${_pkgbase}-${pkgver}"
	make INSTALL_ROOT="$pkgdir" install
	echo ';extension=apcu.so' > apcu.ini
	install -D -m644 apcu.ini "${pkgdir}/etc/php/conf.d/apcu.ini"
	install -D -m644 apc.php "${pkgdir}/usr/share/php-apcu/apc.php"
	install -D -m644 INSTALL "${pkgdir}/usr/share/doc/php-apcu/install.txt"
}

# vim:set ts=2 sw=2 et:
