# Maintainer: Jeremy Kescher <jeremy@kescher.at>
# Based on official php-redis package, but without igbinary support

# Maintainer: David Runge <dvzrv@archlinux.org>

_name=redis
_upstream=phpredis
_pkgname=php-redis
pkgname=php82-redis
pkgver=6.0.2
pkgrel=1
pkgdesc="An API for communicating with the Redis key-value store - no igbinary dependency"
arch=(x86_64)
url="https://github.com/phpredis/phpredis/"
license=(PHP-3.01)
depends=(glibc)
makedepends=(liblzf)
checkdepends=(lsof redis)
optdepends=('redis: use a local redis instance')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('4c04b76f67e19185a0da3bcd55ce74e97b10258aa0866f8bcdd1586778d93f2113c0af9c7c71784b5ee83337a34d525e92c1b50c4b96727ce7516af8e632419e')
b2sums=('6e081838b7f66a96811848b3a4b71a76b1ad08088e698ba235badb9922c663b3acd23020403fd8a790125c2f39dc1d34050fc4bf564ff4a7196eccfe30fa68c0')

prepare() {
  mv -v "$_upstream-$pkgver" "$pkgbase-$pkgver"
  cd "$pkgbase-$pkgver"
  # tempfile is non-standard, Debian only
  sed -e 's/tempfile/mktemp/g' -i  tests/mkring.sh
  # the kill after shutdown of redis makes it exit with status code 1
  sed -e '/kill -9/d' -i tests/mkring.sh
  # disable the extension by default
  echo -e "; this extension DOES NOT requires igbinary! \n;extension=${_name}" > 40-${_name}.ini
  phpize82
}

build() {
  local configure_options=(
    --prefix=/usr
    --with-php-config=/usr/bin/php-config82
    --enable-redis-lzf
    --with-liblzf=/usr/lib/
  )

  cd "$pkgname-$pkgver"
  ./configure "${configure_options[@]}"
  make
}

check() {
  # tests are partly broken:
  # https://github.com/phpredis/phpredis/issues/1593
  local test_php=(/usr/bin/php82 -d extension="$srcdir/$pkgbase-$pkgver/modules/redis.so")
  cd "$pkgname-$pkgver"
  tests/mkring.sh start
  "${test_php[@]}" tests/TestRedis.php --class Redis
  "${test_php[@]}" tests/TestRedis.php --class RedisArray
  tests/mkring.sh stop
}

package() {
  depends+=(liblzf.so)
  backup=(etc/php82/conf.d/40-$_name.ini)

  cd "$pkgname-$pkgver"
  make INSTALL_ROOT="$pkgdir/" install
  install -vDm 644 40-$_name.ini -t "$pkgdir/etc/php82/conf.d/"
  install -vDm 644 {{CHANGELOG,README,arrays,cluster}.md,CREDITS} -t "$pkgdir/usr/share/doc/$pkgname/"
}
