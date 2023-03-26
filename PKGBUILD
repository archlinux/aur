# PACKAGER: wolftankk <wolftankk@gmail.com>
# Maintainer: Joseph R. Quinn <quinn.josephr@protonmail.com>

pkgname=php-phalcon
_pkgname=cphalcon
pkgver=5.2.1
pkgrel=1
pkgdesc="Web framework delivered as a C-extension for PHP"
url="http://phalconphp.com"
arch=('x86_64' 'i686')
license=('PHP')
depends=('php' 'php-psr')
backup=('etc/php/conf.d/phalcon.ini')
source=("https://github.com/phalcon/cphalcon/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('6761d6b42e764a6e6a0771992182e143294cd4d69224cb22957d98d46952a2d3dde3d0f3a65ddb584aa5fe267586193cf19afe7c0777ec67c3d1ecc4e05cb5b9')

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
