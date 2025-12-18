# Maintainer: Travis Glenn Hansen <travisghansen@yahoo.com>

pkgname=php-amqp
_extname=amqp
pkgver=2.1.2
pkgrel=2
pkgdesc="PHP extension compatible with AMQP 0-9-1 message brokers"
arch=("i686" "x86_64")
url="https://pecl.php.net/package/amqp"
license=('PHP')
depends=('librabbitmq-c')
makedepends=('php')
source=("http://pecl.php.net/get/$_extname-$pkgver.tgz" "https://github.com/php-amqp/php-amqp/pull/595.patch")
backup=("etc/php/conf.d/$_extname.ini")
sha256sums=('0cb16d63752a0055de55a22062a6c1744908696d92268d76181284669025d993'
            '239760d5569f0117c33ba0beaaff01a26e943025966b82689042c5eaa17c1640')

prepare() {
  patch --directory="$srcdir/$_extname-$pkgver" --forward --strip=1 --input="$srcdir/595.patch"
}

build() {
  cd "$srcdir/$_extname-$pkgver"

  phpize
  ./configure
  make
}

package() {
  cd "$srcdir/$_extname-$pkgver"

  install -m0755 -d "$pkgdir/etc/php/conf.d/"
  echo ";extension=$_extname.so" >"$pkgdir/etc/php/conf.d/$_extname.ini"
  chmod 0644 "$pkgdir/etc/php/conf.d/$_extname.ini"
  install -m0755 -D "modules/$_extname.so" "$pkgdir$(php-config --extension-dir)/$_extname.so"
}
