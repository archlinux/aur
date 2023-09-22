# Maintainer: Maxim Novikov <the.mlex@gmail.com>
pkgname=php-zephir-parser
pkgver=1.6.0
pkgrel=1
pkgdesc="The Zephir Parser delivered as a C extension for the PHP language."
url="https://github.com/zephir-lang/php-zephir-parser"
arch=('x86_64' 'i686')
license=('MIT')
depends=('php>=7.0')
makedepends=('php>=7.0' 'gcc' 'pcre' 'autoconf' 're2c')
backup=('etc/php/conf.d/zephir_parser.ini')

if [[ $CARCH = "i686" ]]; then
  makedepends+=('lib32-pcre');
fi

source=(
    "https://github.com/phalcon/php-zephir-parser/archive/v${pkgver}.tar.gz"
)

sha256sums=('d3bcebecc59601e53142231146cb91dbe3d0b40f7acb522b3a7786d209d2db90')

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
