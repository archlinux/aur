phpbase=81
suffix=
extname=openswoole
pkgname=php${phpbase}-${extname}${suffix}
pkgver=22.0.0
pkgrel=1
pkgdesc="swoole PECL extension for PHP${phpbase}${suffix}"
arch=('i686' 'x86_64')
url="http://pecl.php.net/package/${extname}"
license=('PHP')
depends=("php${phpbase}${suffix}" "brotli" "openssl" "c-ares" "gcc-libs")
makedepends=("php${phpbase}${suffix}" "brotli" "openssl" "c-ares" "gcc-libs")
backup=("etc/php${phpbase}${suffix}/conf.d/${extname}.ini")
source=("http://pecl.php.net/get/${extname}-${pkgver}.tgz")

build() {
  cd "${extname}-${pkgver}"
  sh ./clear.sh
  phpize${phpbase}${suffix}
  CFLAGS=-Wno-error ./configure \
     --prefix=/usr \
     --with-php-config=php-config${phpbase}${suffix} \
     --enable-openssl --enable-sockets --enable-mysqlnd \
     --enable-http2 --enable-swoole-json --enable-swoole-curl \
     --enable-cares
  make -j$(nproc)
}

package() {
  cd "${extname}-${pkgver}"
  make INSTALL_ROOT="${pkgdir}" install
  echo "extension=${extname}.so" > "${extname}.ini"
  install -D -m644 "${extname}.ini" "${pkgdir}/etc/php${phpbase}${suffix}/conf.d/40-${extname}.ini"
}

sha256sums=('bf1ebf241bd4a52b5b39102a37da8cfa4b3dfcbd2be4104adf408873dac89034')

