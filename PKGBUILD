# Maintainer: Thomas Pulzer <t.pulzer@thesecretgamer.de>

pkgname=php72-apcu
_pkgbase="${pkgname#php72-}"
_phpbase="${pkgname/-apcu}"
pkgver=5.1.16
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc='A userland caching module for PHP'
url='https://pecl.php.net/package/APCu'
depends=("${_phpbase}")
provides=("php-${_pkgbase}")
license=('PHP')
source=("https://pecl.php.net/get/apcu-${pkgver}.tgz")
backup=("etc/${_phpbase}/conf.d/apcu.ini")
md5sums=('5d3d27f9b7b08a87343fe1417aa8af37')

build() {
  cd "${srcdir}/${_pkgbase}-${pkgver}"
	phpize72
  ./configure --config-cache \
		--sysconfdir="/etc/${_phpbase}" \
		--with-php-config=/usr/bin/php-config72 \
		--localstatedir=/var
	make
}

package() {
  cd "${srcdir}/${_pkgbase}-${pkgver}"
  make INSTALL_ROOT=${pkgdir} install
  echo 'extension=apcu.so' > apcu.ini
	install -D -m644 apcu.ini "${pkgdir}/etc/${_phpbase}/conf.d/apcu.ini"
	install -D -m644 apc.php "${pkgdir}/usr/share/${pkgname}/apc.php"
	install -D -m644 INSTALL "${pkgdir}/usr/share/doc/${pkgname}/install.txt"
}
