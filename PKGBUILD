# Maintainer: SeeSchloss <see@seos.fr>

pkgname=php7-imagick-git
_extname=imagick
pkgver=3.3.0RC2.r150.g623a3ac
pkgrel=2
pkgdesc="PHP extension for IMagick"
arch=('i686' 'x86_64')
url="http://pecl.php.net/package/${_extname}"
license=('PHP')
depends=('php>=7.0.0' 'imagemagick>=6.2.4')
backup=("etc/php/conf.d/${_extname}.ini")
install="${pkgname}.install"
source=("${pkgname}::git+https://github.com/mkoppanen/imagick.git#branch=phpseven")
md5sums=('SKIP')
conflicts=('php-imagick')
provides=('php-imagick=3.3.0')

build() {
  cd "${srcdir}/${pkgname}"

  sed -i "s/@PACKAGE_VERSION@/${pkgver}/" "php_imagick.h"

  phpize
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}"

  make INSTALL_ROOT="${pkgdir}" install
  echo "extension=${_extname}.so" > "${_extname}.ini"
  install -D -m644 "${_extname}.ini" "${pkgdir}/etc/php/conf.d/${_extname}.ini"
}

pkgver() {
  cd "${pkgname}"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

