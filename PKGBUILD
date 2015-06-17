# Maintainer: wolftankk <wolftankk@gmail.com>
pkgname=zephir
pkgver=0.7.0
pkgrel=1
pkgdesc="Zephir is a compiled high level language aimed to the creation of C-extensions for PHP http://zephir-lang.com/"
url="https://github.com/phalcon/zephir"
arch=('x86_64' 'i686')
license=('GPL')
depends=('json-c' 're2c')
makedepends=('unzip' 'php' 'gcc' 'pcre')
backup=('etc/php/conf.d/zephir.ini')

if [[ $CARCH = "i686" ]]; then
  makedepends+=('lib32-pcre');
fi

source=(
	"https://github.com/phalcon/zephir/archive/$pkgver.zip"
)

sha256sums=('7fbd3ecb4033c567d0d779df58e42cb1a7dc175145f0b6f8ccc02e4d40fbe90d')

build() {
  cd "$srcdir/zephir-$pkgver/parser"

  if [ ! -f lemon ]; then
	gcc -w lemon.c -o lemon
  fi
  re2c -o scanner.c scanner.re && ./lemon -s parser.lemon && cat base.c >> parser.c
  sed s/"\#line"/"\/\/"/g scanner.c > xx && mv -f xx scanner.c
  sed s/"#line"/"\/\/"/g parser.c > xx && mv -f xx parser.c

  export CFLAGS="-g3 -O0"
  gcc -Wl,-rpath /usr/local/lib -I/usr/local/include -L/usr/local/lib -L/opt/local/lib -g3 -w parser.c scanner.c -ljson-c -o ../bin/zephir-parser
}

package() {
  ZEPHIRDIR=/opt/$pkgname
  cd "$srcdir/zephir-$pkgver"
  sed "s#%ZEPHIRDIR%#$ZEPHIRDIR#g" bin/zephir > bin/zephir-cmd

  #init
  install -d $pkgdir/{$ZEPHIRDIR,usr/bin}

  install -Dm777 bin/zephir-cmd "$pkgdir"/opt/zephir/bin/zephir
  install -Dm777 bin/zephir-parser "$pkgdir"/opt/zephir/bin/zephir-parser

  install -Dm777 compiler.php "$pkgdir"/opt/zephir/compiler.php
  install -Dm777 bootstrap.php "$pkgdir"/opt/zephir/bootstrap.php
  cp -a Library "$pkgdir"/opt/zephir/Library
  cp -a ext "$pkgdir"/opt/zephir/ext
  cp -a prototypes "$pkgdir"/opt/zephir/prototypes
  cp -a runtime "$pkgdir"/opt/zephir/runtime
  cp -a templates "$pkgdir"/opt/zephir/templates
  cp -a unit-tests "$pkgdir"/opt/zephir/unit-tests

  ln -s /opt/zephir/bin/zephir $pkgdir/usr/bin/zephir
  ln -s /opt/zephir/bin/zephir-parser $pkgdir/usr/bin/zephir-parser

  #echo open_basedir=$(php -r "echo ini_get('open_basedir');"):/opt/zephir > zephir.ini
  #install -Dm644 zephir.ini "$pkgdir"/etc/php/conf.d/zephir.ini

  if [ -d "/usr/share/bash-completion/completions" ]; then
	  install -Dm644 bin/bash_completion "$pkgdir"/usr/share/bash-completion/completions/zephir
  fi

  msg2 "Please add '/opt/zephir' into 'open_basedir' in 'php.ini'"
}
