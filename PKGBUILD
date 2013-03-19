# Maintainer: Evangelos Foutras <evangelos@foutrelis.com>

pkgname=php-memcache
pkgver=3.0.7
pkgrel=2
pkgdesc="Memcache module for PHP"
arch=('i686' 'x86_64')
url="http://pecl.php.net/package/memcache"
license=('PHP')
depends=('php')
backup=('etc/php/conf.d/memcache.ini')
install=php-memcache.install
source=(http://pecl.php.net/get/memcache-$pkgver.tgz
        php-memcache-3.0.7-fix-segfault-with-object-serialization.patch)
sha256sums=('f34e2ef42dd8f1f7e6a2cfbb9417a9e58e3bfd7f5db7227ca5afab686cefdd1f'
            '100bffed22ad537de1cb03653e2dbb6768617ba3b8b49b1cf05c59554270c25b')

build() {
  cd "$srcdir/memcache-$pkgver"

  # https://bugs.php.net/bug.php?id=63142
  patch -Np0 -i "$srcdir/php-memcache-3.0.7-fix-segfault-with-object-serialization.patch"

  phpize
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/memcache-$pkgver"

  make INSTALL_ROOT="$pkgdir" install
  echo ';extension=memcache.so' >memcache.ini
  install -Dm644 memcache.ini "$pkgdir/etc/php/conf.d/memcache.ini"
}

# vim:set ts=2 sw=2 et:
