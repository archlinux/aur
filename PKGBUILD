# Maintainer: Tomasz Gruszka <tompear79@gmail.com>
# Contributor: Thomas Pulzer <t.pulzer@thesecretgamer.de>
_phpversion=73
pkgname=php${_phpversion}-apcu
pkgver=5.1.20
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc='A userland caching module for PHP'
url='https://pecl.php.net/package/APCu'
depends=("php${_phpversion}")
provides=("php-apcu")
license=('PHP')
source=("https://pecl.php.net/get/apcu-${pkgver}.tgz")
backup=("etc/php${_phpversion}/conf.d/apcu.ini")
sha256sums=('b99d40fafec06f4d132fcee53e7526ddbfc1d041ea6e04e17389dfad28f9c390')

build() {
  cd "${srcdir}/apcu-${pkgver}"
	phpize${_phpversion}
  ./configure --config-cache \
		--sysconfdir="/etc/php${_phpversion}" \
		--with-php-config=/usr/bin/php-config${_phpversion} \
		--localstatedir=/var
	make
}

package() {
  cd "${srcdir}/apcu-${pkgver}"
  make INSTALL_ROOT=${pkgdir} install
  echo 'extension=apcu.so' > apcu.ini
	install -D -m644 apcu.ini "${pkgdir}/etc/php${_phpversion}/conf.d/apcu.ini"
	install -D -m644 apc.php "${pkgdir}/usr/share/${pkgname}/apc.php"
	install -D -m644 INSTALL "${pkgdir}/usr/share/doc/${pkgname}/install.txt"
}
