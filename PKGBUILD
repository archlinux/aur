# Maintainer: Tomasz Gruszka <tompear79@gmail.com>
_phpversion=74
pkgname=php${_phpversion}-apcu
pkgver=5.1.21
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc='A userland caching module for PHP'
url='https://pecl.php.net/package/APCu'
depends=("php${_phpversion}")
provides=("php-apcu")
license=('PHP')
source=("https://pecl.php.net/get/apcu-${pkgver}.tgz")
backup=("etc/php${_phpversion}/conf.d/apcu.ini")
sha256sums=('1033530448696ee7cadec85050f6df5135fb1330072ef2a74569392acfecfbc1')

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
}
