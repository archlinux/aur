# Maintainer: Tomasz Gruszka <tompear79@gmail.com>
# Contributor: Matt Harrison <matt@harrison.us.com>
# Contributor: David Runge <dvzrv@archlinux.org>

pkgname=php74-redis
_name=redis
_upstream=phpredis
pkgver=6.0.2
pkgrel=4
pkgdesc="An API for communicating with the Redis key-value store"
arch=('x86_64')
url="https://pecl.php.net/package/redis"
license=('PHP')
depends=('glibc' 'php74' 'php74-cli' 'php74-json' 'php74-igbinary')
makedepends=('liblzf')
checkdepends=('lsof' 'redis')
optdepends=('redis: use a local redis instance')
backup=("etc/php74/conf.d/${_name}.ini")
source=("https://pecl.php.net/get/${_name}-${pkgver}.tgz")
sha512sums=('1918d15433d1b4d782a9fb0364f6dfeed8d9e6c2ae70c34e235be5f890992c73a40ef19842e0aabb181da86dd2cde28b9aebab8698b387738321298a2ab94aa6')

prepare() {
  mv -v "${_name}-${pkgver}" "$pkgname-$pkgver"
  cd "$pkgname-$pkgver"
  # tempfile is non-standard, Debian only
  sed -e 's/tempfile/mktemp/g' -i tests/mkring.sh
  # the kill after shutdown of redis makes it exit with status code 1
  sed -e '/kill -9/d' -i tests/mkring.sh
  # disable the extension by default
  echo -e "; this extension requires igbinary to be activated as well\n;extension=${_name}" > "${_name}.ini"
  phpize74
}

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr \
              --enable-redis-igbinary \
              --enable-redis-lzf \
              --with-liblzf=/usr/lib/
  make
}

check() {
  # tests are partly broken:
  # https://github.com/phpredis/phpredis/issues/1593
  export TEST_PHP_EXECUTABLE=/usr/bin/php74
  export TEST_PHP_ARGS="--no-php-ini -d extension=json -d extension=igbinary -d extension=${srcdir}/${pkgname}-${pkgver}/modules/redis.so"
  cd "$pkgname-$pkgver"
  tests/mkring.sh start
  $TEST_PHP_EXECUTABLE $TEST_PHP_ARGS tests/TestRedis.php --class Redis
  $TEST_PHP_EXECUTABLE $TEST_PHP_ARGS tests/TestRedis.php --class RedisArray
  tests/mkring.sh stop
}

package() {
  depends+=('liblzf.so')
  cd "$pkgname-$pkgver"
  make INSTALL_ROOT="$pkgdir/" install
  install -vDm 644 "${_name}.ini" -t "${pkgdir}/etc/php74/conf.d/"
}
