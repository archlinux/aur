# Packager: Joseph R Quinn <quinn.josephr@protonmail.com>
# Maintainer: Joseph R Quinn <quinn.josephr@protonmail.com>
pkgname=php-phalcon-git
_pkgname=cphalcon
pkgver=5.0.0RC1.r0.g88b4f9ea04
pkgrel=2
pkgdesc="High performance, full-stack PHP framework delivered as a C extension. Git package."
arch=('i686' 'x86_64')
url="https://phalcon.io/"
license=('BSD')
depends=('php' 'php-psr' 're2c' 'pcre')
makedepends=('git')
optionaldepends=('php-sqlite: Sqlite support'
  'php-pgsql: PgSQL backend model support'
  'php-mongodb: MongoDB ODM support'
  'php-redis: Redis caching support'
  'phalcon-devtools'
  'php-scrypt'
  'php-sodium'
  'php-twig'
  'php-yaml'
  'php-memcached'
  'php-gd'
  'curl'
  'php-imagick')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}" 'php70-phalcon' 'php-phalcon3')
backup=('etc/php/conf.d/phalcon.ini')
source=("$_pkgname::git+https://github.com/phalcon/cphalcon.git"
  'phalcon.ini')
b2sums=('SKIP'
        '6f71075c763b2bf57ff3aaf27a5369ccfd863e3ed858bd4d02844c06c9a90788a4d73d441ca4b1a9836f967451af40a985286cab37674a522596828f8d9b54ff')

pkgver() {
  cd $_pkgname
  git describe --long --tags | /usr/bin/sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/$_pkgname/build"
  export CC="gcc"
  export CXX="g++"
  export CPPFLAGS="-DPHALCON_RELEASE"

  PHPIZE_BIN=$(command -v phpize 2>/dev/null)
  PHPCONFIG_BIN=$(command -v php-config 2>/dev/null)
  PHP_FULL_VERSION=`${PHPCONFIG_BIN} --version`

  php gen-build.php

  echo "int main() {}" > t.c
  gcc ${CFLAGS} t.c -o t 2> t.t
  if [ $? != 0 ]; then
    chmod +x gcccpuopt
    BFLAGS=`./gcccpuopt`
    export CFLAGS="-O2 -fomit-frame-pointer $BFLAGS"
    gcc ${CFLAGS} t.c -o t 2> t.t
    if [ $? != 0 ]; then
      export CFLAGS="-O2"
    fi
  fi

  if [ $(gcc -dumpversion | cut -f1 -d.) -ge 4 ]; then
    gcc ${CFLAGS}-fvisibility=hidden t.c -o t 2> t.t && export CFLAGS="$CFLAGS -fvisibility=hidden"
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
  cd "$srcdir/$_pkgname/build/phalcon"
  make -s -j"$(getconf _NPROCESSORS_ONLN)"
}

package() {
  cd "$srcdir/$_pkgname/build/phalcon"

  make INSTALL_ROOT="$pkgdir" install
  echo 'extension=phalcon.so' > phalcon.ini
  install -Dm644 phalcon.ini "$pkgdir/etc/php/conf.d/phalcon.ini"
  install -Dm644 "$srcdir/$_pkgname/LICENSE.txt" "$pkgdir/usr/share/licenses/php-phalcon/LICENSE.txt"
}
