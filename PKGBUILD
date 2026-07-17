# Maintainer: Jeremy Kescher <jeremy@kescher.at>
# Based on official php-redis package, but without igbinary support

# Maintainer: David Runge <dvzrv@archlinux.org>

_name=redis
_upstream=phpredis
_pkgname=php-redis
pkgname=php82-redis
pkgver=6.3.0
pkgrel=1
pkgdesc="An API for communicating with the Redis key-value store - no igbinary dependency"
arch=(x86_64)
url="https://github.com/phpredis/phpredis/"
license=(PHP-3.01)
depends=(glibc liblzf php82)
makedepends=(liblzf)
checkdepends=(lsof redis)
optdepends=('redis: use a local redis instance')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('44050095de7815547ca6f0ae263ea3a71eb7d1db9164cbc1df496ac25698546ae8fd3b9bd98863039b8ea5116f36f2d0fb3063370ab427b15472628939d8c7c5')
b2sums=('c35bb8b5d487c9350e4e988de48ba25dfdaf094d66fd390fc09959635cc78ae70860a3e3d617acea24f33e1f72886d39465df362eea72b0f322e058926333c41')

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
  #local test_php=(/usr/bin/php82 -d extension="$srcdir/$pkgbase-$pkgver/modules/redis.so")
  cd "$pkgname-$pkgver"
  #tests/mkring.sh start
  #"${test_php[@]}" tests/TestRedis.php --class Redis
  #"${test_php[@]}" tests/TestRedis.php --class RedisArray
  #tests/mkring.sh stop
}

package() {
  backup=(etc/php82/conf.d/40-$_name.ini)
  cd "$pkgname-$pkgver"
  make INSTALL_ROOT="$pkgdir/" install
  install -vDm 644 40-$_name.ini -t "$pkgdir/etc/php82/conf.d/"
  install -vDm 644 {{CHANGELOG,README,arrays,cluster}.md,CREDITS} -t "$pkgdir/usr/share/doc/$pkgname/"
}
