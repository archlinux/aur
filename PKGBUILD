# Maintainer: Timo Sarawinski <timo@it-kraut.net>

pkgname=php73-memcache
_pkgname=php-memcache
pkgver=4.0.5.2
pkgrel=1
pkgdesc="Memcache module for PHP"
arch=('x86_64')
url="https://pecl.php.net/package/memcache"
license=('PHP')
depends=('php73')
checkdepends=('memcached')
backup=('etc/php73/conf.d/memcache.ini')
install=php73-memcache.install
source=(https://pecl.php.net/get/memcache-$pkgver.tgz)
sha256sums=('7b7667813baea003671f174bbec849e43ff235a8ea4ab7e36c3a0380c2a9ed63')

build() {
  cd "$srcdir/memcache-$pkgver"

  phpize73
  ./configure --prefix=/usr
  make
}

check() {
  cd "$srcdir/memcache-$pkgver"

  sed -i "s|^\(\$domainsocket =\) .*|\1 'unix://$PWD/memcached.sock';|" \
    tests/connect.inc

  memcached_pids=()
  memcached -p 11211 -U 11211 >/dev/null        & memcached_pids+=($!)
  memcached -p 11212 -U 11212 >/dev/null        & memcached_pids+=($!)
  memcached -s "$PWD/memcached.sock" >/dev/null & memcached_pids+=($!)

  local ret=0
  make test NO_INTERACTION=1 REPORT_EXIT_STATUS=1 || ret=1

  kill ${memcached_pids[@]}

  return $ret
}

package() {
  cd "$srcdir/memcache-$pkgver"

  make INSTALL_ROOT="$pkgdir" install
  echo ';extension=memcache.so' >memcache.ini
  install -Dm644 memcache.ini "$pkgdir/etc/php73/conf.d/memcache.ini"
}

# vim:set ts=2 sw=2 et:
