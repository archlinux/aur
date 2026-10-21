# Maintainer: jnkrpn

pkgname=php85-memcached
_pkgname=php-memcached
pkgver=3.4.0
pkgrel=1
pkgdesc="PHP extension for interfacing with memcached via libmemcached library"
arch=('x86_64')
url="https://github.com/php-memcached-dev/php-memcached"
license=('PHP')
depends=('libmemcached' 'zstd')
makedepends=('php85' 'git' 'php85-igbinary')
source=("git+https://github.com/php-memcached-dev/php-memcached.git#tag=v$pkgver")
sha256sums=('c31f09a009c9ab69710c1292bdb6ecf6dafc6bae28c1c90304ec191d59f17cc7')

build() {
  cd "$srcdir/$_pkgname"
  phpize85
  ./configure --prefix=/usr --with-zstd --enable-memcached-igbinary --with-php-config=/usr/bin/php-config85
  make
}

package() {
  depends+=('php85' 'php85-igbinary')
  backup=('etc/php85/conf.d/memcached.ini')

  cd "$srcdir/$_pkgname"

  make INSTALL_ROOT="$pkgdir" install
  install -d "$pkgdir/etc/php85/conf.d"
  echo -e '; this extension requires igbinary to be activated as well\n;extension=memcached.so' >"$pkgdir/etc/php85/conf.d/memcached.ini"
}
