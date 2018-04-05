# Maintainer: Maxwell Pray a.k.a. Synthead <synthead@gmail.com>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

pkgname=php71-apcu
pkgver=5.1.11
pkgrel=1
arch=('x86_64')
pkgdesc='A userland caching module for PHP'
url='https://pecl.php.net/package/APCu'
depends=('php71')
provides=('php-apcu')
license=('PHP')
source=("https://pecl.php.net/get/apcu-${pkgver}.tgz"
        'apcu.ini')
backup=("${_optdir}etc/php/conf.d/apcu.ini")
md5sums=('576c51d928f582b67ccb222bc34f6abd'
         'a353f7efe61928aa2162720789fa171f')

_optdir=/opt/php71

build() {
  cd ${srcdir}/apcu-${pkgver}

  ${_optdir}/usr/bin/phpize
  ./configure \
    --prefix=${_optdir}/usr \
    --with-php-config=${_optdir}/usr/bin/php-config

  make
}

check() {
  cd ${srcdir}/apcu-${pkgver}

  export REPORT_EXIT_STATUS=1
  export NO_INTERACTION=1
  export SKIP_ONLINE_TESTS=1
  export SKIP_SLOW_TESTS=1
  make test
}

package() {
  cd ${srcdir}/apcu-${pkgver}

  make INSTALL_ROOT=${pkgdir} install

  install -D -m644 ${srcdir}/apcu.ini ${pkgdir}${_optdir}/etc/php/conf.d/apcu.ini
  install -D -m644 apc.php ${pkgdir}/usr/share/webapps/php71-apcu/apc.php
  install -D -m644 INSTALL ${pkgdir}${_optdir}/usr/share/doc/php-apcu/install.txt
}
