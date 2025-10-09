# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=php-http
pkgver=4.3.1
pkgrel=1
pkgdesc="Aims to provide a convenient and powerful set of functionality for one of PHPs major applications"
arch=('x86_64')
license=('BSD-2-Clause')
url="https://mdref.m6w6.name/http"
depends=('glibc' 'curl' 'brotli' 'libevent' 'icu' 'libidn2' 'openssl' 'zlib'
         'php' 'php-raphf')
backup=('etc/php/conf.d/http.ini')
source=("https://pecl.php.net/get/pecl_http-${pkgver}.tgz")
sha512sums=('de1d03d37c761ad443c2d1d401662dc6c175c63c63464f79d69175548b98260716325b92ac0f98c903b0de6cf8bed481617e61166a0a314d061ffc32adb129ab')

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
