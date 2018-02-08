# Maintainer: Mark Weiman

pkgname=php-alpm
_extname=alpm
pkgver=0.4.3
pkgrel=1
pkgdesc="A PHP extension to use Arch Linux's ALPM"
arch=('i686' 'x86_64')
url="https://github.com/markzz/php-alpm"
makedepends=('php')
license=('LGPL2.1')
install="${pkgname}.install"
source=("php-alpm-${pkgver}.tar.gz::https://github.com/markzz/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('64708bef3727f94ecdfc88c524fa4ae3')

build() {
  cd "${pkgname}-${pkgver}"

  phpize
  ./configure --with-php-config=/usr/bin/php-config --prefix=/usr
  make
}

package_php-alpm() {
  php_ver="$(php --version | head -n 1 | awk -F\  '{ print $2 }' | awk -F\. '{ print $1 "." $2 }')"
  depends=("php>=${php_ver}" "pacman>=5.0")
  cd "${pkgname}-${pkgver}"
  make INSTALL_ROOT="${pkgdir}" install
  echo "extension=${_extname}.so" > "${_extname}.ini"
  install -D -m644 "${_extname}.ini" "${pkgdir}/etc/php/conf.d/${_extname}.ini"
}
