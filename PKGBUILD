# PACKAGER: wolftankk <wolftankk@gmail.com>
# Maintainer: Joseph R. Quinn <quinn.josephr@protonmail.com>

pkgname=php-phalcon
_pkgname=cphalcon
pkgver=5.9.3
pkgrel=1
pkgdesc="Web framework delivered as a C-extension for PHP"
url="http://phalconphp.com"
arch=('x86_64' 'i686')
license=('PHP')
depends=('php')
backup=('etc/php/conf.d/phalcon.ini')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/phalcon/cphalcon/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('947fd6e63628d7d790979ad2f36b2bc167fa70b872876ded4c24b50f70be1fc333ab7a9f91b4580f5d0e372fef1cb8af14b178a6a8113897e6b5e531159c207a')

prepare() {
  cd "$srcdir/$_pkgname-$pkgver/build"
  export CPPFLAGS="-DPHALCON_RELEASE"

  PHPIZE_BIN=$(command -v phpize 2>/dev/null)
  PHPCONFIG_BIN=$(command -v php-config 2>/dev/null)
  PHP_FULL_VERSION=`${PHPCONFIG_BIN} --version`

  php gen-build.php

  echo "int main() {}" > t.c
  cc ${CFLAGS} t.c -o t 2> t.t
  if [ $? != 0 ]; then
    chmod +x gcccpuopt
    BFLAGS=`./gcccpuopt`
    export CFLAGS="-O2 -fomit-frame-pointer $BFLAGS"
    cc ${CFLAGS} t.c -o t 2> t.t
    if [ $? != 0 ]; then
      export CFLAGS="-O2"
    fi
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
