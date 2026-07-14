# Maintainer: William Varmus <0@willvar.tw>
# Contributor: Nicholas Yim <nickyim05@gmail.com>
# Contributor: Leo <i@setuid0.dev>

_extname=event
pkgname=php-${_extname}
pkgver=3.1.5
pkgrel=1
pkgdesc='Provides interface to libevent library for PHP'
arch=('x86_64')
url="https://bitbucket.org/osmanov/pecl-${_extname}"
license=('PHP-3.01')
depends=('php>=5.4' 'libevent' 'openssl')
source=("${pkgname}-${pkgver}.zip::https://bitbucket.org/osmanov/pecl-${_extname}/get/${pkgver}.zip")
noextract=("${pkgname}-${pkgver}.zip")
sha256sums=('6f35a1622893c3642eed656ec83935907c1673eefaad93b81590c8a4f25036b3')

prepare() {
  if ! php -m | grep -q '^sockets$'; then
    echo "Warning: The sockets extension is required by the ${_extname} extension."
    echo "To enable it, edit /etc/php/php.ini using root privileges and ensure the following line is present and uncommented:"
    echo "  extension=sockets"
    exit 1
  fi
  mkdir -p "${srcdir}/${_extname}-${pkgver}"
  bsdtar -xf "${srcdir}/${pkgname}-${pkgver}.zip" -C "${srcdir}/${_extname}-${pkgver}" --strip-components=1
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
