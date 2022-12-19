# Maintainer: Evangelos Foutras <evangelos@foutrelis.com>

pkgname=('php-memcache' 'php-legacy-memcache')
pkgver=8.0
pkgrel=4
pkgdesc="Memcache module for PHP"
arch=('x86_64')
url="https://pecl.php.net/package/memcache"
license=('PHP')
makedepends=('php' 'php-legacy')
checkdepends=('memcached')
source=(https://pecl.php.net/get/memcache-$pkgver.tgz
       'php-8.2.patch')
sha256sums=('defe33e6f7831d82b7283b95e14a531070531acbf21278f3f0d7050505cf3395'
            'faa23fc8fca696264b5e1159e44cfda772adca0b97ce43c9b6ee2b57d7e0ea4e')

prepare() {
  # Fix test: https://github.com/websupport-sk/pecl-memcache/issues/91
  sed -i 's/memcache_connect(\$domainsocket, null)/memcache_connect(\$domainsocket, 0)/' memcache-$pkgver/tests/035.phpt
  patch -p1 -d memcache-$pkgver -i "$srcdir/php-8.2.patch"
  cp -a memcache-$pkgver{,-php-legacy}
}

build() {
  cd memcache-$pkgver
  phpize
  ./configure --prefix=/usr
  make

  cd ../memcache-$pkgver-php-legacy
  phpize-legacy
  ./configure --prefix=/usr
  make
}

check() {
  sed -i "s|^\(\$domainsocket =\) .*|\1 'unix://$PWD/memcached.sock';|" \
    memcache-$pkgver{,-php-legacy}/tests/connect.inc

  memcached_pids=()
  memcached -p 11211 -U 11211 >/dev/null        & memcached_pids+=($!)
  memcached -p 11212 -U 11212 >/dev/null        & memcached_pids+=($!)
  memcached -s "$PWD/memcached.sock" >/dev/null & memcached_pids+=($!)

  local ret=0 dir=
  for dir in memcache-$pkgver{,-php-legacy}; do
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

package_php-legacy-memcache() {
  pkgdesc=${pkgdesc/PHP/PHP Legacy}
  depends+=('php-legacy')
  backup=('etc/php-legacy/conf.d/memcache.ini')
  install=$pkgname.install

  cd memcache-$pkgver-php-legacy

  make INSTALL_ROOT="$pkgdir" install
  install -d "$pkgdir/etc/php-legacy/conf.d"
  echo ';extension=memcache.so' >"$pkgdir/etc/php-legacy/conf.d/memcache.ini"
}

# vim:set ts=2 sw=2 et:
