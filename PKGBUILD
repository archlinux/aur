# Maintainer: Jeremy Kescher <jeremy@kescher.at>
# Based on php80-igbinary maintained by Timo Sarawinski <timo@it-kraut.net>

_name=igbinary
pkgname=php82-igbinary
pkgver=3.2.15
pkgrel=1
pkgdesc="A drop in replacement for the standard php serializer (PHP 8.2)"
arch=('x86_64')
url="https://github.com/igbinary/igbinary"
license=('BSD')
depends=('glibc')
makedepends=('php82')
backup=("etc/php82/conf.d/${_name}.ini")
source=("$pkgname-$pkgver.tar.gz::https://github.com/${_name}/${_name}/archive/${pkgver}.tar.gz")
sha512sums=('285adae14c3104c4c53eec7b7e9b96e097096a06e2517ac554a4ecf5066f9b75318b6e29486cc41aa89a21ef46980285d1fa0d09a1f2b750253951c6d0480869')
b2sums=('affe47386e65576ee44fc7616a3c1c923a5af4b50308caa02f6c75ea9a2ba483ab90a9c656f5631fb5bee7360a1505525dfadb4083e668b58d149dfc7379bd4e')

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
