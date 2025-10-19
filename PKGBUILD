# Maintainer: William Varmus <0@willvar.tw>

_extname=simdjson
pkgname=php-$_extname
pkgver=4.0.0
pkgrel=4
pkgdesc='Faster json decoding through simdjson bindings for PHP'
arch=('x86_64')
url='https://github.com/crazyxman/simdjson_php'
license=('Apache-2.0')
depends=('php>=7.0')
source=("http://pecl.php.net/get/$_extname-$pkgver.tgz")
sha256sums=('1fb48fe579ff0b6b8f991f236c0caed1645f672baa2abf7b3f8c9f21488119c8')

prepare() {
  cd "${srcdir}/${_extname}-${pkgver}"
  phpize --clean
  phpize
  ./configure --prefix=/usr --with-simdjson
  echo "extension=${_extname}.so" > "${_extname}.ini"
}

build() {
  cd "${srcdir}/${_extname}-${pkgver}"
  make
}

check() {
  cd "${srcdir}/${_extname}-${pkgver}"
  TEST_PHP_ARGS="-q -n" make test
}

package() {
  cd "${srcdir}/${_extname}-${pkgver}"
  make INSTALL_ROOT="${pkgdir}" install
  install -Dm644 "${_extname}.ini" "${pkgdir}/etc/php/conf.d/${_extname}.ini" \
  && install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
