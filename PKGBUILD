# Maintainer: Evangelos Foutras <foutrelis@archlinux.org>

pkgname=('php-memcache' 'php-legacy-memcache')
pkgver=8.2
pkgrel=6
pkgdesc="Memcache module for PHP"
arch=('x86_64')
url="https://pecl.php.net/package/memcache"
license=('PHP-3.01')
makedepends=('php' 'php-legacy')
checkdepends=('memcached')
source=(https://pecl.php.net/get/memcache-$pkgver.tgz php-8.5.patch)
sha256sums=('b3f0640eacdeb9046c6c86a1546d7fb8a4e9f219e5d9a36a287e59b2dd8208e5'
            '88cbbafbf6339ca67103795ea45cdf3b5728d4c593c7f69bf2efec5d9f9ad3e9')

prepare() {
  cd memcache-$pkgver

  # Ignore broken tests
  rm tests/pecl63142.phpt

  patch -p1 -i $srcdir/php-8.5.patch

  cp -a $srcdir/memcache-$pkgver{,-php-legacy}
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
