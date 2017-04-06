# Maintainer: wolftankk <wolftankk@gmail.com>
pkgname=zephir
pkgver=0.9.7
pkgrel=1
pkgdesc="Zephir is a compiled high level language aimed to the creation of C-extensions for PHP http://zephir-lang.com/"
url="https://github.com/phalcon/zephir"
arch=('x86_64' 'i686')
license=('MIT')
depends=('re2c' 'json-c')
makedepends=('php' 'gcc' 'pcre')
backup=('etc/php/conf.d/zephir.ini')

if [[ $CARCH = "i686" ]]; then
  makedepends+=('lib32-pcre');
fi

source=(
	"https://github.com/phalcon/zephir/archive/$pkgver.tar.gz"
)

sha256sums=('22a2578cf040276ca18d98290b84025be6c13a6cdefb09f6136dac3cd442e429')

#build zephir-parser
build() {
  cd "$srcdir/zephir-$pkgver/parser/parser"

  rm -fr *.o *.lo

  if [ ! -f lemon ]; then
       gcc -w lemon.c -o lemon
  fi
  re2c -o scanner.c scanner.re 

  rm -f parser.o
  rm -f parser.lo
  rm -f scanner.o
  rm -f scanner.lo

  if [ ! -f lemon ]; then
      gcc -g lemon.c -o lemon
  fi

  re2c -o scanner.c scanner.re
  ./lemon -s parser.php5.lemon
  ./lemon -s parser.php7.lemon

  echo "#include <php.h>" > parser.c
  echo "#if PHP_VERSION_ID < 70000" >> parser.c
  cat parser.php5.c >> parser.c
  echo "#else" >> parser.c
  cat parser.php7.c >> parser.c
  echo "#endif" >> parser.c
  cat base.c >> parser.c

  sed s/"\#line"/"\/\/"/g scanner.c > xx && mv -f xx scanner.c
  sed s/"#line"/"\/\/"/g parser.c > xx && mv -f xx parser.c


  cd "$srcdir/zephir-$pkgver/parser"
  phpize
  export CC="gcc" && ./configure --prefix=/usr --enable-zephir_parser
  make -s -j2
}

package() {
  ZEPHIRDIR=/opt/$pkgname
  cd "$srcdir/zephir-$pkgver"
  sed "s#%ZEPHIRDIR%#$ZEPHIRDIR#g" bin/zephir > bin/zephir-cmd

  cd "$srcdir/zephir-$pkgver/parser"
  make INSTALL_ROOT="$pkgdir" install

  echo "extension=zephir_parser.so" > zephir_parser.ini
  install -Dm644 zephir_parser.ini "$pkgdir/etc/php/conf.d/zephir_parser.ini"

  cd "$srcdir/zephir-$pkgver"
  sed "s#%ZEPHIRDIR%#$ZEPHIRDIR#g" bin/zephir > bin/zephir-cmd

  #init
  install -d $pkgdir/{$ZEPHIRDIR,usr/bin}

  install -Dm777 bin/zephir-cmd "$pkgdir"/opt/zephir/bin/zephir
  install -Dm777 compiler.php "$pkgdir"/opt/zephir/compiler.php
  install -Dm777 bootstrap.php "$pkgdir"/opt/zephir/bootstrap.php
  cp -a Library "$pkgdir"/opt/zephir/Library
  cp -a kernels "$pkgdir"/opt/zephir/kernels
  cp -a ext "$pkgdir"/opt/zephir/ext
  cp -a prototypes "$pkgdir"/opt/zephir/prototypes
  cp -a runtime "$pkgdir"/opt/zephir/runtime
  cp -a templates "$pkgdir"/opt/zephir/templates
  cp -a unit-tests "$pkgdir"/opt/zephir/unit-tests

  ln -s /opt/zephir/bin/zephir $pkgdir/usr/bin/zephir

  echo open_basedir=$(php -r "echo ini_get('open_basedir');"):/opt/zephir > zephir.ini
  install -Dm644 zephir.ini "$pkgdir"/etc/php/conf.d/zephir.ini

  if [ -d "/usr/share/bash-completion/completions" ]; then
      install -Dm644 bin/bash_completion "$pkgdir"/usr/share/bash-completion/completions/zephir
  fi

  msg2 "Please add '/opt/zephir' into 'open_basedir' in 'php.ini'"
}
