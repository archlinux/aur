# Maintainer: Jeremy Kescher <jeremy@kescher.at>
# Based on php80-redis maintained by Timo Sarawinski <timo@it-kraut.net>

pkgname=php82-redis
_name=redis
_pkgname=php-redis
pkgver=5.3.7
pkgrel=1
pkgdesc="An API for communicating with the Redis key-value store - no igbinary"
arch=('x86_64')
url="https://github.com/phpredis/phpredis/"
license=('PHP')
depends=('glibc' 'php82' 'php82-cli')
makedepends=('liblzf')
checkdepends=('lsof' 'redis')
optdepends=('redis: use a local redis instance')
backup=("etc/php82/conf.d/40-${_name}.ini")
source=("$pkgname-$pkgver.tar.gz::https://pecl.php.net/get/redis-${pkgver}.tgz")
sha512sums=('b945d5aa86d3f58e75094369b0f324e987202f104aca7d7b46ba23cfaed54d186bb66931e200dd16d2dbeea11732dd0311da4e3d7485c3b725027f7924652832')
b2sums=('50cff3d36e189593a741ed3fe05c3558e6a0621e7ff906e4902ba39e3f7d3ae5b9bfa554480a131e32bcc0334bccbd3aa5507dc714b6d4b20ac808139c525a95')

prepare() {
  mv -v "$_name-$pkgver" "$pkgname-$pkgver"
  cd "$pkgname-$pkgver"
  # tempfile is non-standard, Debian only
  sed -e 's/tempfile/mktemp/g' -i tests/mkring.sh
  # the kill after shutdown of redis makes it exit with status code 1
  sed -e '/kill -9/d' -i tests/mkring.sh
  # disable the extension by default
  echo -e "; this extension DOES NOT requires igbinary! \n;extension=${_name}" > 40-"${_name}.ini"
  phpize82
}

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr \
	      --with-php-config=/usr/bin/php-config82 \
              --enable-redis-lzf \
              --with-liblzf=/usr
  make
}

check() {
  # tests are partly broken:
  # https://github.com/phpredis/phpredis/issues/1593
  export TEST_PHP_EXECUTABLE=/usr/bin/php82
  export TEST_PHP_ARGS="-d extension=${srcdir}/${pkgname}-${pkgver}/modules/redis.so"
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
  install -vDm 644 "40-${_name}.ini" -t "${pkgdir}/etc/php82/conf.d/"
  install -vDm 644 {{README,arrays,cluster}.markdown,CREDITS} \
    -t "${pkgdir}/usr/share/doc/${pkgname}/"
}
