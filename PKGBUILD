# Maintainer: wolftankk <wolftankk@gmail.com>
pkgname=php-phalcon
pkgver=2.0.4
pkgrel=1
pkgdesc="Web framework delivered as a C-extension for PHP"
url="http://phalconphp.com"
arch=('x86_64' 'i686')
[[ $CARCH == 'i686' ]] && cd _arch=32bits || _arch=64bits
license=('PHP')
depends=('php')
makedepends=('gcc')
backup=('etc/php/conf.d/phalcon.ini')

source=(
	"https://github.com/phalcon/cphalcon/archive/phalcon-v$pkgver.zip"
)

sha256sums=('97118008d285c288dbaf14e4c3e2257ae8ed899c399336e618ce1685769b7164')

build() {
  cd "$srcdir/cphalcon-phalcon-v$pkgver"
  #Check best compilation flags for GCC
  export CC="gcc"
  export CFLAGS="-march=native -mtune=native -O2 -fomit-frame-pointer"
  export CPPFLAGS="-DPHALCON_RELEASE"
  echo "int main() {}" > t.c
  gcc $CFLAGS t.c -o t 2> t.t
  if [ $? != 0 ]; then
	  chmod +x gcccpuopt
	  BFLAGS=`./gcccpuopt`
	  export CFLAGS="-O2 -fomit-frame-pointer $BFLAGS"
	  gcc $CFLAGS t.c -o t 2> t.t
	  if [ $? != 0 ]; then
		  export CFLAGS="-O2"
	  fi
  fi

  if [ $(gcc -dumpversion | cut -f1 -d.) -ge 4 ]; then
	  gcc $CFLAGS -fvisibility=hidden t.c -o t 2> t.t && export CFLAGS="$CFLAGS -fvisibility=hidden"
  fi
  #gcc $CFLAGS -flto t.c -o t 2> t.t && { export CFLAGS="$CFLAGS -flto"; export LDFLAGS="$LDFLAGS $CFLAGS"; }
  rm -f t.t t.c t

  #cd dir
  cd "$srcdir/cphalcon-phalcon-v$pkgver/ext"

  #Clean current compilation
  if [ -f Makefile ]; then
	  make clean
	  phpize --clean
  fi

  phpize
  ./configure --prefix=/usr --enable-phalcon
  make
}

package() {
  cd "$srcdir/cphalcon-phalcon-v$pkgver/ext"

  make INSTALL_ROOT="$pkgdir" install
  echo 'extension=phalcon.so' > phalcon.ini 
  install -Dm644 phalcon.ini "$pkgdir/etc/php/conf.d/phalcon.ini"
}
