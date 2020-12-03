# Maintainer: Timo Sarawinski <timo@it-kraut.net>
_phpversion=80
pkgname=php${_phpversion}-apcu
pkgver=5.1.19
pkgrel=1
arch=('x86_64')
pkgdesc='A userland caching module for PHP'
url='https://pecl.php.net/package/APCu'
depends=("php${_phpversion}")
provides=("php-apcu")
license=('PHP')
source=("https://pecl.php.net/get/apcu-${pkgver}.tgz")
backup=("etc/php${_phpversion}/conf.d/apcu.ini")
sha256sums=('837fbc99d5c79efb510fafaf585ef0c06e02baf8310a7d77f93e402c93276ce0')

build() {
  cd "${srcdir}/apcu-${pkgver}"
	phpize${_phpversion}
  ./configure --config-cache \
		--sysconfdir="/etc/php${_phpversion}" \
		--with-php-config=/usr/bin/php-config${_phpversion} \
		--localstatedir=/var
	make
}

check() {
       cd $srcdir/apcu-$pkgver

       export REPORT_EXIT_STATUS=1
       export NO_INTERACTION=1
       export SKIP_ONLINE_TESTS=1
       export SKIP_SLOW_TESTS=1
       make test
}

package() {
  cd "${srcdir}/apcu-${pkgver}"
  make INSTALL_ROOT=${pkgdir} install
  echo 'extension=apcu.so' > apcu.ini
	install -D -m644 apcu.ini "${pkgdir}/etc/php${_phpversion}/conf.d/apcu.ini"
	install -D -m644 apc.php "${pkgdir}/usr/share/${pkgname}/apc.php"
	install -D -m644 INSTALL "${pkgdir}/usr/share/doc/${pkgname}/install.txt"
}
