# Maintainer: Timo Sarawinski <timo@it-kraut.net>
_name=igbinary
pkgname=php80-igbinary
pkgver=3.2.7
pkgrel=2
pkgdesc="A drop in replacement for the standard php serializer (PHP 8.0)"
arch=('x86_64')
url="https://github.com/igbinary/igbinary"
license=('BSD')
depends=('glibc')
makedepends=('php80')
backup=("etc/php80/conf.d/${_name}.ini")
source=("$pkgname-$pkgver.tar.gz::https://github.com/${_name}/${_name}/archive/${pkgver}.tar.gz")
sha512sums=('1bdb60fa4ac76ef405b55b4a7e7f07c73ccc945a3fad8635934cf83a05ae554ac1a0b64c4b55229f0bd2a3269189d3266a492b064a0338fdb2bf4dfe5c3733e4')
b2sums=('40936fb78b9f01d717daac78f8b707f902d78714e5202fbb1344042c2d30a3b723f9c5b6fd982f7a5002aab65e414ba7f9bda354fec4db82ba3f03fc09663a43')

prepare() {
  mv -v "${_name}-${pkgver}" "$pkgname-$pkgver"
  cd "$pkgname-$pkgver"
  # disable the extension by default
  sed 's/extension/;extension/g' -i "${_name}.php.ini"
  phpize80
}

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr --enable-igbinary
  make
}

check() {
  cd "$pkgname-$pkgver"
  export TEST_PHPDBG_EXECUTABLE=/usr/bin/phpdbg80
  NO_INTERACTION=1 make -k test
}

package() {
  cd "$pkgname-$pkgver"
  make INSTALL_ROOT="$pkgdir/" install
  install -vDm 644 "${_name}.php.ini" "${pkgdir}/etc/php80/conf.d/${_name}.ini"
  install -vDm 644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -vDm 644 {CREDITS,NEWS,README.md} -t "${pkgdir}/usr/share/doc/${pkgname}"
}
