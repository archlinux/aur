# PACKAGER: wolftankk <wolftankk@gmail.com>
# Maintainer: Joseph R. Quinn <quinn.josephr@protonmail.com>

pkgname=php-phalcon
_pkgname=cphalcon
pkgver=4.1.3
pkgrel=1
pkgdesc="Web framework delivered as a C-extension for PHP"
url="http://phalconphp.com"
arch=('x86_64' 'i686')
[[ $CARCH == 'i686' ]] && cd _arch=32bits || _arch=64bits
license=('PHP')
depends=('php7' 'php-psr')
makedepends=('gcc')
backup=('etc/php/conf.d/phalcon.ini')
source=("https://github.com/phalcon/cphalcon/archive/v$pkgver.zip")
b2sums=('c608ef57ddd8d9a83be4361b2e9bb417848edc0d3dc6f0a0795404be2de6c96ae8a00135edfbf21984f906937c0a26537741c62672f79fb0c53fe3ce1084e2f0')

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
