# Maintainer: Jeremy Kescher <jeremy@kescher.at>
# Based on php80-igbinary maintained by Timo Sarawinski <timo@it-kraut.net>

_name=igbinary
pkgname=php82-igbinary
pkgver=3.2.14
pkgrel=1
pkgdesc="A drop in replacement for the standard php serializer (PHP 8.2)"
arch=('x86_64')
url="https://github.com/igbinary/igbinary"
license=('BSD')
depends=('glibc')
makedepends=('php82')
backup=("etc/php82/conf.d/${_name}.ini")
source=("$pkgname-$pkgver.tar.gz::https://github.com/${_name}/${_name}/archive/${pkgver}.tar.gz")
sha512sums=('8f58817b86c560bd81344ec51260d31b02868584254d6b94b44e07ea5371ddebfc2ccee7bc56ca1ad5873bdbb758fc95683555e7c5abf5d69db9d962bf0e88b3')
b2sums=('17cb77a68e2458021563ae288fccbd49132b04f9b5e2a27b7dbfc2c851536d30b813fcf4cc48684afda0cd3e3b0c2c915b13b668d85715d827bee86a4c499573')

prepare() {
  mv -v "${_name}-${pkgver}" "$pkgname-$pkgver"
  cd "$pkgname-$pkgver"
  # disable the extension by default
  sed 's/extension/;extension/g' -i "${_name}.php.ini"
  phpize82
}

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr --enable-igbinary
  make
}

check() {
  cd "$pkgname-$pkgver"
  export TEST_PHPDBG_EXECUTABLE=/usr/bin/phpdbg82
  NO_INTERACTION=1 make -k test
}

package() {
  cd "$pkgname-$pkgver"
  make INSTALL_ROOT="$pkgdir/" install
  install -vDm 644 "${_name}.php.ini" "${pkgdir}/etc/php82/conf.d/${_name}.ini"
  install -vDm 644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -vDm 644 {CREDITS,NEWS,README.md} -t "${pkgdir}/usr/share/doc/${pkgname}"
}
