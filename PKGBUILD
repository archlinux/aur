# PACKAGER: wolftankk <wolftankk@gmail.com>
# Maintainer: Joseph R. Quinn <quinn.josephr@protonmail.com>

pkgname=php-phalcon
_pkgname=cphalcon
pkgver=4.0.6
pkgrel=2
pkgdesc="Web framework delivered as a C-extension for PHP"
url="http://phalconphp.com"
arch=('x86_64' 'i686')
[[ $CARCH == 'i686' ]] && cd _arch=32bits || _arch=64bits
license=('PHP')
depends=('php>=7.0')
makedepends=('gcc')
backup=('etc/php/conf.d/phalcon.ini')
source=("https://github.com/phalcon/cphalcon/archive/v$pkgver.zip")
sha256sums=('0bbb889457a4aaf717bafc33666111a6c121ad5aeda9fb28a707c9abf0214064')

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
