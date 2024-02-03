# Maintainer: Matt Harrison <matt@harrison.us.com>
# Contributor: David Runge <dvzrv@archlinux.org>

pkgname=php73-redis
_name=redis
_upstream=phpredis
pkgver=6.0.2
pkgrel=1
pkgdesc="An API for communicating with the Redis key-value store"
arch=('x86_64')
url="https://github.com/phpredis/phpredis/"
license=('PHP')
depends=('glibc' 'php73-igbinary')
makedepends=('liblzf')
checkdepends=('lsof' 'redis')
optdepends=('redis: use a local redis instance')
backup=("etc/php73/conf.d/${_name}.ini")
source=("$pkgname-$pkgver.tar.gz::https://github.com/${_upstream}/${_upstream}/archive/${pkgver}.tar.gz")
sha512sums=('4c04b76f67e19185a0da3bcd55ce74e97b10258aa0866f8bcdd1586778d93f2113c0af9c7c71784b5ee83337a34d525e92c1b50c4b96727ce7516af8e632419e')
b2sums=('6e081838b7f66a96811848b3a4b71a76b1ad08088e698ba235badb9922c663b3acd23020403fd8a790125c2f39dc1d34050fc4bf564ff4a7196eccfe30fa68c0')

prepare() {
  mv -v "${_upstream}-${pkgver}" "$pkgname-$pkgver"
  cd "$pkgname-$pkgver"
  # tempfile is non-standard, Debian only
  sed -e 's/tempfile/mktemp/g' -i tests/mkring.sh
  # the kill after shutdown of redis makes it exit with status code 1
  sed -e '/kill -9/d' -i tests/mkring.sh
  # disable the extension by default
  echo -e "; this extension requires igbinary to be activated as well\n;extension=${_name}" > "${_name}.ini"
  phpize73
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
  export TEST_PHP_EXECUTABLE=/usr/bin/php73
  export TEST_PHP_ARGS="-d extension=igbinary -d extension=${srcdir}/${pkgname}-${pkgver}/modules/redis.so"
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
  install -vDm 644 "${_name}.ini" -t "${pkgdir}/etc/php73/conf.d/"
  install -vDm 644 {{README,arrays,cluster}.markdown,CREDITS} \
    -t "${pkgdir}/usr/share/doc/${pkgname}/"
}
