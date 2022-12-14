# Maintainer: Evangelos Foutras <evangelos@foutrelis.com>

pkgname=('php-memcache' 'php7-memcache')
pkgver=8.0
pkgrel=3
pkgdesc="Memcache module for PHP"
arch=('x86_64')
url="https://pecl.php.net/package/memcache"
license=('PHP')
makedepends=('php' 'php7')
checkdepends=('memcached')
source=(https://pecl.php.net/get/memcache-$pkgver.tgz)
sha256sums=('defe33e6f7831d82b7283b95e14a531070531acbf21278f3f0d7050505cf3395')

prepare() {
  # Fix test: https://github.com/websupport-sk/pecl-memcache/issues/91
  sed -i 's/memcache_connect(\$domainsocket, null)/memcache_connect(\$domainsocket, 0)/' memcache-$pkgver/tests/035.phpt
  cp -a memcache-$pkgver{,-php7}
}

build() {
  cd memcache-$pkgver
  phpize
  ./configure --prefix=/usr
  make

  cd ../memcache-$pkgver-php7
  phpize7
  ./configure --prefix=/usr
  make
}

check() {
  sed -i "s|^\(\$domainsocket =\) .*|\1 'unix://$PWD/memcached.sock';|" \
    memcache-$pkgver{,-php7}/tests/connect.inc

  memcached_pids=()
  memcached -p 11211 -U 11211 >/dev/null        & memcached_pids+=($!)
  memcached -p 11212 -U 11212 >/dev/null        & memcached_pids+=($!)
  memcached -s "$PWD/memcached.sock" >/dev/null & memcached_pids+=($!)

  local ret=0 dir=
  for dir in memcache-$pkgver{,-php7}; do
    cd "$srcdir/$dir"
    make test NO_INTERACTION=1 REPORT_EXIT_STATUS=1 || ret=1
  done

  kill ${memcached_pids[@]}

  return $ret
}

package_php-memcache() {
  depends+=('php')
  backup=('etc/php/conf.d/memcache.ini')
  install=$pkgname.install

  cd memcache-$pkgver

  make INSTALL_ROOT="$pkgdir" install
  install -d "$pkgdir/etc/php/conf.d"
  echo ';extension=memcache.so' >"$pkgdir/etc/php/conf.d/memcache.ini"
}

package_php7-memcache() {
  pkgdesc=${pkgdesc/PHP/PHP 7}
  depends+=('php7')
  backup=('etc/php7/conf.d/memcache.ini')
  install=$pkgname.install

  cd memcache-$pkgver-php7

  make INSTALL_ROOT="$pkgdir" install
  install -d "$pkgdir/etc/php7/conf.d"
  echo ';extension=memcache.so' >"$pkgdir/etc/php7/conf.d/memcache.ini"
}

# vim:set ts=2 sw=2 et:
