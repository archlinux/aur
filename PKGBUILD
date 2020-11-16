# Maintainer: Matt Harrison <matt@harrison.us.com>
# Contributor: David Runge <dvzrv@archlinux.org>

_name=igbinary
pkgname=php73-igbinary
pkgver=3.1.5
pkgrel=1
pkgdesc="A drop in replacement for the standard php serializer (PHP 7.3)"
arch=('x86_64')
url="https://github.com/igbinary/igbinary"
license=('BSD')
depends=('glibc' 'php73')
backup=("etc/php73/conf.d/${_name}.ini")
source=("$pkgname-$pkgver.tar.gz::https://github.com/${_name}/${_name}/archive/${pkgver}.tar.gz")
sha512sums=('af0e473673e624635cad44a6f34aa2e4d655e8f2dc3df8a9e0cf9b241ef1f53c627edb508b5bb41c7f8925c2256a4a4d0b4c083227564212cb7747a810dfc83d')
b2sums=('3aa453fc0669c331202f38d41a80fa34332033d272a7b6e523988923d84a1e93967e4d588ac32d4a2ac3ed5d0bc832bf0380293604f67350557628ecbcded91a')

prepare() {
  mv -v "${_name}-${pkgver}" "$pkgname-$pkgver"
  cd "$pkgname-$pkgver"
  # disable the extension by default
  sed 's/extension/;extension/g' -i "${_name}.php.ini"
  phpize73
}

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr \
              --enable-igbinary
  make
}

check() {
  cd "$pkgname-$pkgver"
  NO_INTERACTION=1 make -k test
}

package() {
  cd "$pkgname-$pkgver"
  make INSTALL_ROOT="$pkgdir/" install
  install -vDm 644 "${_name}.php.ini" "${pkgdir}/etc/php73/conf.d/${_name}.ini"
  install -vDm 644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -vDm 644 {CREDITS,NEWS,README.md} \
    -t "${pkgdir}/usr/share/doc/${pkgname}"
}
