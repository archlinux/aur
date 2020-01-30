# Maintainer: Stefan Auditor <stefan.auditor@erdfisch.de>
# Please report issues at https://github.com/sanduhrs/arch-aur-php-wasm

_pkgname=php-wasm
pkgname=${_pkgname}
pkgver=0.5.0
pkgrel=1
pkgdesc="PHP extension to run WebAssembly binaries"
url="https://github.com/wasmerio/php-ext-wasm"
license=('PHP')
arch=('i686' 'x86_64')
depends=('php')
makedepends=('git' 'make' 'bash' 'gcc')
install=${_pkgname}.install
source=("${pkgname}-${pkgver}::git+https://github.com/wasmerio/php-ext-wasm.git#tag=${pkgver}")
sha512sums=('SKIP')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export PATH="$HOME/.cargo/bin:$PATH"
  export CXX="gcc"
  EXTENSION="${srcdir}/${pkgname}-${pkgver}/src"
  cd $EXTENSION
  PHP_PREFIX=$(php-config --prefix)
  PHP_PREFIX_BIN=$PHP_PREFIX/bin
  $PHP_PREFIX_BIN/phpize --clean
  $PHP_PREFIX_BIN/phpize
  ./configure --with-php-config=$PHP_PREFIX_BIN/php-config
  /bin/bash $EXTENSION/libtool --mode=compile $CXX -I. -I$EXTENSION -DPHP_ATOM_INC -I$EXTENSION/include -I$EXTENSION/main -I$EXTENSION -I$PHP_PREFIX/include/php -I$PHP_PREFIX/include/php/main -I$PHP_PREFIX/include/php/TSRM -I$PHP_PREFIX/include/php/Zend -I$PHP_PREFIX/include/php/ext -I$PHP_PREFIX/include/php/ext/date/lib -DHAVE_CONFIG_H -c $EXTENSION/wasm.cc -o wasm.lo -fPIC
  $CXX -I. -I$EXTENSION -DPHP_ATOM_INC -I$EXTENSION/include -I$EXTENSION/main -I$EXTENSION -I$PHP_PREFIX/include/php -I$PHP_PREFIX/include/php/main -I$PHP_PREFIX/include/php/TSRM -I$PHP_PREFIX/include/php/Zend -I$PHP_PREFIX/include/php/ext -I$PHP_PREFIX/include/php/ext/date/lib -DHAVE_CONFIG_H -c $EXTENSION/wasm.cc  -DPIC -o .libs/wasm.o -fPIC
  /bin/bash $EXTENSION/libtool --mode=link cc -DPHP_ATOM_INC -I$EXTENSION/include -I$EXTENSION/main -I$EXTENSION -I$PHP_PREFIX/include/php -I$PHP_PREFIX/include/php/main -I$PHP_PREFIX/include/php/TSRM -I$PHP_PREFIX/include/php/Zend -I$PHP_PREFIX/include/php/ext -I$PHP_PREFIX/include/php/ext/date/lib  -DHAVE_CONFIG_H  -g -O2    -o wasm.la -export-dynamic -avoid-version -prefer-pic -module -rpath $EXTENSION/modules  wasm.lo -Wl,-rpath,$EXTENSION/. -L$EXTENSION/. -lwasmer_runtime_c_api -fPIC
  cc -shared  .libs/wasm.o  -L$EXTENSION/. -lwasmer_runtime_c_api  -Wl,-rpath -Wl,$EXTENSION/. -Wl,-soname -Wl,wasm.so -o .libs/wasm.so -fPIC
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  echo ';extension=wasm.so' > wasm.ini
  install -Dm644 wasm.ini "${pkgdir}/etc/php/conf.d/wasm.ini"

  EXTENSION="${srcdir}/${pkgname}-${pkgver}/src"
  cd $EXTENSION
  make install-modules INSTALL_ROOT="${pkgdir}/"
}
