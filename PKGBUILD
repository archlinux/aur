# Maintainer: wolftankk <wolftankk@gmail.com>
pkgname=php-zephir-parser
pkgver=1.1.2
pkgrel=1
pkgdesc="The Zephir Parser delivered as a C extension for the PHP language."
url="https://github.com/phalcon/php-zephir-parser"
arch=('x86_64' 'i686')
license=('MIT')
depends=('re2c')
makedepends=('php>=5.5' 'gcc' 'pcre' 'autoconf')
backup=('etc/php/conf.d/php-zephir.ini')

if [[ $CARCH = "i686" ]]; then
  makedepends+=('lib32-pcre');
fi

source=(
    "https://github.com/phalcon/php-zephir-parser/archive/v${pkgver}.tar.gz"
)

sha256sums=('4a8801b69fd7b9ec075177238fcabce7d78cc2b83383353802b4c3ffb7656ffb')

#get php version
PHP_FULL_VERSION=`php-config --version`
if [ "${PHP_FULL_VERSION:0:1}" == "5" ]; then
    PHP_VERSION="php5"
else
    PHP_VERSION="php7"
fi

#build zephir-parser
build() {
  cd "$srcdir/php-zephir-parser-$pkgver"

  export CC=gcc
  export CFLAGS="-march=native -mtune=native -O2 -fomit-frame-pointer"

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
      gcc ${CFLAGS} -fvisibility=hidden t.c -o t 2> t.t && export CFLAGS="$CFLAGS -fvisibility=hidden"
  fi

  gcc ${CFLAGS} -flto t.c -o t 2> t.t && { export CFLAGS="$CFLAGS -flto"; export LDFLAGS="$LDFLAGS $CFLAGS"; }

  rm -f t.t t.c t

  cd "$srcdir/php-zephir-parser-$pkgver/parser"

  rm -f \
	*.o \
	*.lo \
	lemon \
	scanner.c \
	parser.c \
	parser.php5.c \
	parser.php5.h \
	parser.php5.out \
	parser.php7.c \
	parser.php7.h \
	parser.php7.out \
	config.h.in~

  re2c -o scanner.c scanner.re

  $CC lemon.c -o lemon

  ./lemon -s parser.${PHP_VERSION}.lemon

  echo "#include <php.h>" > parser.c
  cat parser.${PHP_VERSION}.c >> parser.c
  cat base.c >> parser.c

  sed s/"\#line"/"\/\/"/g scanner.c > xx && mv -f xx scanner.c
  sed s/"#line"/"\/\/"/g parser.c > xx && mv -f xx parser.c

  cd "$srcdir/php-zephir-parser-$pkgver"
  if [ -f Makefile ]; then
      make clean
      phpize --clean
  fi

  phpize
  ./configure --prefix=/usr --enable-zephir_parser

  make -s -j2
}

package() {
  cd "$srcdir/php-zephir-parser-$pkgver"

  make INSTALL_ROOT="$pkgdir" install
  echo 'extension=zephir_parser.so' > zephir_parser.ini 
  install -Dm644 zephir_parser.ini "$pkgdir/etc/php/conf.d/zephir_parser.ini"
}
