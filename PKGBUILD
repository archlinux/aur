# Maintainer: William Varmus <0@willvar.tw>
# Contributor: Nicholas Yim <nickyim05@gmail.com>
# Contributor: Leo <i@setuid0.dev>

_extname=event
pkgname=php-${_extname}
pkgver=3.1.4
pkgrel=1
pkgdesc='Provides interface to libevent library for PHP'
arch=('x86_64')
url="https://bitbucket.org/osmanov/pecl-${_extname}"
license=('PHP-3.01')
depends=('php>=5.4' 'libevent' 'openssl')
source=("https://pecl.php.net/get/${_extname}-${pkgver}.tgz")
noextract=("${_extname}-${pkgver}.tgz")
sha256sums=('5c4caa73bc2dceee31092ff9192139df28e9a80f1147ade0dfe869db2e4ddfd3')

prepare() {
  if ! php -m | grep -q '^sockets$'; then
    echo "Warning: The sockets extension is required by the ${_extname} extension."
    echo "To enable it, edit /etc/php/php.ini using root privileges and ensure the following line is present and uncommented:"
    echo "  extension=sockets"
    exit 1
  fi
  bsdtar -xf "${srcdir}/${_extname}-${pkgver}.tgz" -C "${srcdir}"
  cd "${srcdir}/${_extname}-${pkgver}"
  phpize --clean
  phpize
  ./configure --prefix=/usr \
    --with-event-core \
    --with-event-extra \
    --with-event-openssl \
    --with-event-pthreads \
    --enable-sockets \
    --enable-event-sockets
  echo "extension=${_extname}.so" > ${_extname}.ini
}

build() {
  cd "${srcdir}/${_extname}-${pkgver}"
  make
}

check() {
  cd "${srcdir}/${_extname}-${pkgver}"
  echo "extension=/usr/lib/php/modules/sockets.so" > test.ini
  TEST_PHP_ARGS="-q -n -c test.ini" make test
}

package() {
  cd "${srcdir}/${_extname}-${pkgver}"
  make INSTALL_ROOT="${pkgdir}" install
  install -Dm644 "${_extname}.ini" "${pkgdir}/etc/php/conf.d/${_extname}.ini" \
  && install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
