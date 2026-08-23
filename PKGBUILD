# PACKAGER: wolftankk <wolftankk@gmail.com>
# Contributor: Joseph R. Quinn <quinn.josephr@protonmail.com>
# Maintainer: Julien Turbide <moi@jturbide.com>

pkgname=php-phalcon
_pkgname=cphalcon
pkgver=5.10.0
pkgrel=2
pkgdesc="Web framework delivered as a C-extension for PHP"
url="http://phalconphp.com"
arch=('x86_64' 'i686')
license=('BSD-3-Clause')
depends=('php>=8.5' 'php<8.6')
backup=('etc/php/conf.d/phalcon.ini')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/phalcon/cphalcon/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('0242d55a393f636ff9e34070adee61d463407e37463f57326f6ef085978289a858f1888b03181572ff23212c867a88f209ce188f34b699f82c81680a0e61a74d')

prepare() {
  cd "$srcdir/$_pkgname-$pkgver/build"
  export CPPFLAGS="-DPHALCON_RELEASE"

  PHPIZE_BIN=$(command -v phpize)
  PHPCONFIG_BIN=$(command -v php-config)

  sed -i 's/\$this->skipFiles\[\$path\] = true;/if ($path) &/' util/Generator/File/PhalconC.php
  php gen-build.php

  # PHP 8.5 no longer ships php_smart_string.h under ext/standard.
  find "$srcdir/$_pkgname-$pkgver" -type f -name '*.[ch]' -exec \
    sed -i 's#<ext/standard/php_smart_string.h>#<Zend/zend_smart_string.h>#g' {} +

  echo "int main() {}" > t.c
  cc ${CFLAGS} t.c -o t 2> t.t
  if [ $? != 0 ]; then
    chmod +x gcccpuopt
    BFLAGS=$(./gcccpuopt)
    export CFLAGS="-O2 -fomit-frame-pointer $BFLAGS"
    cc ${CFLAGS} t.c -o t 2> t.t
    [ $? != 0 ] && export CFLAGS="-O2"
  fi

  if [ $(gcc -dumpversion | cut -f1 -d.) -ge 4 ]; then
    cc ${CFLAGS}-fvisibility=hidden t.c -o t 2> t.t && export CFLAGS="$CFLAGS -fvisibility=hidden"
  fi

  rm -f t.t t.c t

  cd "phalcon/"

  if [ -f Makefile ]; then
    make clean
    ${PHPIZE_BIN} --clean
  fi

  ${PHPIZE_BIN}
  export echo=echo

  ./configure --silent --with-php-config=${PHPCONFIG_BIN} --enable-phalcon
  sed -i 's/CPPFLAGS = -DPHALCON_RELEASE -DHAVE_CONFIG_H/CPPFLAGS = -DPHALCON_RELEASE -DHAVE_CONFIG_H -Wno-error=incompatible-pointer-types/g' Makefile
}

build() {
  cd "$srcdir/$_pkgname-$pkgver/build/phalcon"
  make -s -j"$(getconf _NPROCESSORS_ONLN)"
}

package() {
  cd "$srcdir/$_pkgname-$pkgver/build/phalcon"

  make INSTALL_ROOT="$pkgdir" install
  echo 'extension=phalcon.so' > phalcon.ini
  install -Dm644 phalcon.ini "$pkgdir/etc/php/conf.d/phalcon.ini"
  install -Dm644 "$srcdir/$_pkgname-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/php-phalcon/LICENSE.txt"
}
