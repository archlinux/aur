# Maintainer: Julien Turbide <moi@jturbide.com>
# Contributor: Joseph R. Quinn <quinn.josephr@protonmail.com>

pkgname=php-phalcon-git
_pkgname=cphalcon
pkgver=5.18.2.r0.gaae2375
pkgrel=1
pkgdesc="Web framework delivered as a C-extension for PHP (development version)"
url="https://phalcon.io"
arch=('x86_64')
license=('BSD-3-Clause')
depends=('php>=8.5' 'php<8.6')
makedepends=('git')
provides=("php-phalcon=$pkgver")
conflicts=('php-phalcon')
backup=('etc/php/conf.d/phalcon.ini')
source=("${_pkgname}::git+https://github.com/phalcon/cphalcon.git#branch=master")
b2sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/$_pkgname/build"
  export CPPFLAGS="$CPPFLAGS -DPHALCON_RELEASE"

  php gen-build.php

  cd phalcon

  if [ -f Makefile ]; then
    make clean
    phpize --clean
  fi

  phpize
  export echo=echo

  ./configure --with-php-config=/usr/bin/php-config --enable-phalcon
}

build() {
  cd "$srcdir/$_pkgname/build/phalcon"
  make CFLAGS="$CFLAGS -fvisibility=hidden -ffile-prefix-map=$srcdir=." \
    LDFLAGS="$LDFLAGS"
}

check() {
  local extension="$srcdir/$_pkgname/build/phalcon/modules/phalcon.so"

  php -n -d extension="$extension" -r '
    exit(
      extension_loaded("phalcon")
      && class_exists("Phalcon\\Support\\Version")
        ? 0
        : 1
    );
  '
}

package() {
  cd "$srcdir/$_pkgname/build/phalcon"

  make INSTALL_ROOT="$pkgdir" install
  echo 'extension=phalcon.so' > phalcon.ini
  install -Dm644 phalcon.ini "$pkgdir/etc/php/conf.d/phalcon.ini"
  install -Dm644 "$srcdir/$_pkgname/LICENSE.txt" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
