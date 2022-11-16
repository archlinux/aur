# Maintainer: Tomasz Gruszka <tompear79@gmail.com>
_phpversion=74
pkgname=php${_phpversion}-apcu
pkgver=5.1.22
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc='A userland caching module for PHP'
url='https://pecl.php.net/package/APCu'
depends=("php${_phpversion}")
provides=("php-apcu")
license=('PHP')
source=("https://pecl.php.net/get/apcu-${pkgver}.tgz")
backup=("etc/php${_phpversion}/conf.d/apcu.ini" "etc/php${_phpversion}/conf.d/20-apcu.ini")
sha256sums=('010a0d8fd112e1ed7a52a356191da3696a6b76319423f7b0dfdeaeeafcb41a1e')

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
  echo ';extension=apcu.so' > apcu.ini
	install -D -m644 apcu.ini "${pkgdir}/etc/php${_phpversion}/conf.d/20-apcu.ini"
	install -D -m644 apc.php "${pkgdir}/usr/share/${pkgname}/apc.php"
}
