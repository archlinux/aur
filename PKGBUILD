# Maintainer: Stefan Sielaff <aur AT stefan-sielaff DOT de>

pkgname=php70-apcu
_pkgbase="${pkgname#php70-}"
_phpbase="${pkgname/-apcu}"
pkgver=5.1.8
pkgrel=1
pkgdesc="A userland caching module for php70"
arch=('i686' 'x86_64')
url="https://pecl.php.net/package/APCu"
license=('PHP')
depends=('php70>=7.0.15')
provides=("php-${_pkgbase}=${pkgver}-${pkgrel}")
backup=("etc/php70/conf.d/apcu.ini")
source=("https://pecl.php.net/get/${_pkgbase}-${pkgver}.tgz")
md5sums=('0ef8be2ee8acb4dba5a66b247a254995')

build() {
	cd "${srcdir}/${_pkgbase}-${pkgver}"
	phpize70
	./configure --config-cache \
		--sysconfdir=/etc/php70 \
		--with-php-config=/usr/bin/php-config70 \
		--localstatedir=/var
	make
}

package() {
	cd "${srcdir}/${_pkgbase}-${pkgver}"
	make INSTALL_ROOT="$pkgdir" install
	echo ';extension=apcu.so' > apcu.ini
	install -D -m644 apcu.ini "${pkgdir}/etc/php70/conf.d/apcu.ini"
	install -D -m644 apc.php "${pkgdir}/usr/share/php70-apcu/apc.php"
	install -D -m644 INSTALL "${pkgdir}/usr/share/doc/php70-apcu/install.txt"
}

# vim:set ts=2 sw=2 et:
