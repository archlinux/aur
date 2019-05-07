# Maintainer: Iliya Ivanov <aur@proforge.org>

_pkgname=xdebug
pkgname=${_pkgname}-zts
pkgver=2.7.2
pkgrel=1
pkgdesc="PHP debugging extension (for ZTS enabled PHP)"
arch=('x86_64')
url="https://www.xdebug.org"
license=('GPL')
depends=('php-zts')
backup=('etc/php/conf.d/xdebug.ini')
source=("https://xdebug.org/files/${_pkgname}-${pkgver/rc/RC}.tgz"
	'xdebug.ini')
sha256sums=('b0f3283aa185c23fcd0137c3aaa58554d330995ef7a3421e983e8d018b05a4a6'
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
