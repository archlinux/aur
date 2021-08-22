# Maintainer: Tung Ha <tunght13488 at gmail dot com>

_pkgname=scoutapm
pkgname=php7-${_pkgname}
pkgver=1.4.2
pkgrel=1
pkgdesc="${_pkgname} module for extra/php7 package"
arch=('i686' 'x86_64')
url="https://pecl.php.net/package/${_pkgname}"
license=('MIT')
depends=('php7')
makedepends=('autoconf')
source=(http://pecl.php.net/get/${_pkgname}-${pkgver}.tgz)
md5sums=('2f27de9cbc519090fff57fc716bc52d7')

build() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  phpize7
  ./configure --with-php-config=/usr/bin/php-config7
  make -j$(nproc)
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  make INSTALL_ROOT=${pkgdir} install
  install -d ${pkgdir}/etc/php7/conf.d
  echo "zend_extension=${_pkgname}.so" > ${pkgdir}/etc/php7/conf.d/${_pkgname}.ini
}

post_install() {
  echo '    ==> PHP extension
    A config file was (re)written to /etc/php7/conf.d/${_pkgname}.ini.
    Extension is enabled. You may disable it there by commenting out the line.
    Restart PHP (or webserver) instances to use it.
    '
}

post_upgrade() {
  post_install $1
}

