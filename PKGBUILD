# PACKAGER: wolftankk <wolftankk@gmail.com>
# Maintainer: Joseph R. Quinn <quinn.josephr@protonmail.com>

pkgname=php-phalcon
_pkgname=cphalcon
pkgver=4.1.2
pkgrel=2
pkgdesc="Web framework delivered as a C-extension for PHP"
url="http://phalconphp.com"
arch=('x86_64' 'i686')
[[ $CARCH == 'i686' ]] && cd _arch=32bits || _arch=64bits
license=('PHP')
depends=('php7' 'php-psr')
makedepends=('gcc')
backup=('etc/php/conf.d/phalcon.ini')
source=("https://github.com/phalcon/cphalcon/archive/v$pkgver.zip")
sha256sums=('d624a7e2b3badc75e51eef5bc9b1eed54697c7c99dc10ca73c9aeed5ea06a2e6')

build() {  
  cd "$srcdir/$_pkgname-$pkgver/build/php7/$_arch"
  export CPPFLAGS="-DPHALCON_RELEASE"

  if [ -f Makefile ]; then
    make clean
    phpize --clean
  fi

  phpize
  ./configure --prefix=/usr --enable-phalcon
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver/build/php7/$_arch"

  make INSTALL_ROOT="$pkgdir" install
  echo 'extension=phalcon.so' > phalcon.ini
  install -Dm644 phalcon.ini "$pkgdir/etc/php/conf.d/phalcon.ini"
}
