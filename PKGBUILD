# Maintainer: Thore Bödecker <me at foxxx0 dot de>

pkgname=php56-apcu
_pkgbase="${pkgname#php56-}"
_phpbase="${pkgname/-apcu}"
_buildprefix="/opt/${_phpbase}"
pkgver=4.0.10
pkgrel=1
pkgdesc="A userland caching module for php56"
arch=('i686' 'x86_64')
url="https://pecl.php.net/package/APCu"
license=('PHP')
depends=('php56>=5.6.17-2')
provides=("php-${_pkgbase}=${pkgver}-${pkgrel}")
backup=("${_buildprefix#/}/etc/php/conf.d/apcu.ini")
source=("https://pecl.php.net/get/${_pkgbase}-${pkgver}.tgz")
md5sums=('e52d930a050066025095e2a448fd3cab')

build() {
	cd "${srcdir}/${_pkgbase}-${pkgver}"
	${_buildprefix}/bin/phpize
	./configure --config-cache \
		--prefix=${_buildprefix} \
		--sbindir=${_buildprefix}/bin \
		--sysconfdir=${_buildprefix}/etc/php \
		--with-php-config=${_buildprefix}/bin/php-config \
		--localstatedir=/var \
		--mandir=${_buildprefix}/share/man
	make
}

package() {
	cd "${srcdir}/${_pkgbase}-${pkgver}"
	make INSTALL_ROOT="$pkgdir" install
	echo ';extension=apcu.so' > apcu.ini
	install -D -m644 apcu.ini "${pkgdir}/${_buildprefix#/}/etc/php/conf.d/apcu.ini"
	install -D -m644 apc.php "${pkgdir}/usr/share/php56-apcu/apc.php"
	install -D -m644 INSTALL "${pkgdir}/usr/share/doc/php56-apcu/install.txt"
}
