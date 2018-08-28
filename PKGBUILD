# Maintainer: Alex "grevus" Lobtsov <alex@lobtsov.com>
# Maintainer: Kai Korla <balticer@balticer.de>
# Maintainer: Pedro Junior <pedro@sysnet.net.br>
pkgname=php70-redis-noconflict
pkgver=4.1.1
pkgrel=1
pkgdesc="PHP extension for interfacing with Redis"
url="http://pecl.php.net/package/redis"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
license=('PHP')
makedepends=(
   'php>=7.0.0'
   'php-igbinary'
   'php70-noconflict'
)
depends=(
    'php>=7.0.0'
    'php-igbinary'
    'php70-noconflict'
)
conflicts=(
    'phpredis-git'
)
backup=('etc/php70/conf.d/redis.ini')

source=(
    http://pecl.php.net/get/redis-${pkgver}.tgz
)

sha256sums=('e407583431386d82307c4bef5dedafe50ad2f0288501b9922fb31b5b700bc9dc')

build() {
  cd "$srcdir/redis-$pkgver"

  /usr/bin/phpize70
  ./configure \
	  --prefix=/usr \
	  --libdir=/usr/lib/php70 \
	  --enable-redis-igbinary \
	  --enable-redis-lzf
  make
}

package() {
  cd "$srcdir/redis-$pkgver"

  make INSTALL_ROOT="$pkgdir" install
  echo ';extension=redis.so' > redis.ini
  install -Dm644 redis.ini "$pkgdir/etc/php70/conf.d/redis.ini"
}
