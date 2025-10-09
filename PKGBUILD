# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=php-http
pkgver=4.3.0
pkgrel=1
pkgdesc="Aims to provide a convenient and powerful set of functionality for one of PHPs major applications"
arch=('x86_64')
license=('BSD-2-Clause')
url="https://mdref.m6w6.name/http"
depends=('glibc' 'curl' 'brotli' 'libevent' 'icu' 'libidn2' 'openssl' 'zlib'
         'php' 'php-raphf')
backup=('etc/php/conf.d/http.ini')
source=("https://pecl.php.net/get/pecl_http-${pkgver}.tgz")
sha512sums=('fd99852c1dcc2ab070f25ab1911b6d103834c1807da3cdaf900f59ced4114e0ca63318c156f9cb22866b821661e7efa783fa83e00a210ed5a7b4cdd6f7fe1893')

build() {
  cd "${srcdir}/pecl_http-${pkgver}"

  phpize
  ./configure
  sed -i 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool # Fix overlinking
  make
}

package() {
  cd "${srcdir}/pecl_http-${pkgver}"

  make install INSTALL_ROOT="${pkgdir}"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  echo "extension=http.so" > http.ini
  install -Dm644 "http.ini" "${pkgdir}/etc/php/conf.d/http.ini"
}
