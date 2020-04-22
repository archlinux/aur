# Maintainer: Iliya Ivanov <aur@proforge.org>

_pkgname=xdebug
pkgname=${_pkgname}-zts
pkgver=2.9.4

pkgrel=1
pkgdesc="PHP debugging extension (for ZTS enabled PHP)"
arch=('x86_64')
url="https://www.xdebug.org"
license=('GPL')
depends=('php-zts')
backup=('etc/php/conf.d/xdebug.ini')
source=("https://xdebug.org/files/${_pkgname}-${pkgver/rc/RC}.tgz"
	'xdebug.ini')
sha256sums=('fbe2f5990c2888093f0e0921f75004c47cba13368df94f290b4698193f6a7575'
            '7c66883dc2ade69069ef84e30188b25630748aa9c8b0dd123727c00505421205')

build() {
  cd "$srcdir"/${_pkgname}-${pkgver/rc/RC}
  phpize
  ./configure --prefix=/usr --enable-xdebug
  make

  cd "$srcdir"/${_pkgname}-${pkgver/rc/RC}/debugclient
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir"/${_pkgname}-${pkgver/rc/RC}/debugclient
  install -D -m 755 debugclient "$pkgdir"/usr/bin/debugclient

  cd "$srcdir"/${_pkgname}-${pkgver/rc/RC}
  make INSTALL_ROOT="$pkgdir" install
  install -D -m 644 "$srcdir"/xdebug.ini "$pkgdir"/etc/php/conf.d/xdebug.ini
}
