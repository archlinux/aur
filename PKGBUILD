# Maintainer: Iliya Ivanov <aur@proforge.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Jonathan Wiersma <arch aur at jonw dot org>
# Contributor: sracker <smb.sac@gmail.com>

pkgname=xdebug-zts
pkgver=2.7.1
pkgrel=1
pkgdesc="PHP debugging extension (for ZTS enabled PHP)"
arch=('x86_64')
url="https://www.xdebug.org"
license=('GPL')
depends=('php-zts')
backup=('etc/php/conf.d/xdebug.ini')
source=("https://xdebug.org/files/$pkgname-${pkgver/rc/RC}.tgz"
	'xdebug.ini')
sha256sums=('b7e9d1453975e0217667c82a9e68d4aabb307b18e8f2f70432f70d75907f24c3'
            '7c66883dc2ade69069ef84e30188b25630748aa9c8b0dd123727c00505421205')

build() {
  cd "$srcdir"/$pkgname-${pkgver/rc/RC}
  phpize
  ./configure --prefix=/usr --enable-xdebug
  make

  cd "$srcdir"/$pkgname-${pkgver/rc/RC}/debugclient
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir"/$pkgname-${pkgver/rc/RC}/debugclient
  install -D -m 755 debugclient "$pkgdir"/usr/bin/debugclient

  cd "$srcdir"/$pkgname-${pkgver/rc/RC}
  make INSTALL_ROOT="$pkgdir" install
  install -D -m 644 "$srcdir"/xdebug.ini "$pkgdir"/etc/php/conf.d/xdebug.ini
}
