# PACKAGER: wolftankk <wolftankk@gmail.com>
# Contributor: Joseph R. Quinn <quinn.josephr@protonmail.com>
# Maintainer: Julien Turbide <moi@jturbide.com>

pkgname=php-phalcon
_pkgname=cphalcon
pkgver=5.15.0
pkgrel=1
pkgdesc="Web framework delivered as a C-extension for PHP"
url="https://phalcon.io"
arch=('x86_64' 'i686')
license=('BSD-3-Clause')
depends=('php>=8.5' 'php<8.6')
backup=('etc/php/conf.d/phalcon.ini')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/phalcon/cphalcon/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('b11dee6c372169f4b6652198f1bd202b77599d615d4c3bfe703b4468d82dcabb886d136e8d218872a8135bf238f012335a9b4bb844c88cc5ecefb36c104c00d3')

prepare() {
  cd "$srcdir/$_pkgname-$pkgver/build"
  export CPPFLAGS="-DPHALCON_RELEASE"

  PHPIZE_BIN=$(command -v phpize)
  PHPCONFIG_BIN=$(command -v php-config)

  php gen-build.php

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
