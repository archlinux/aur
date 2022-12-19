# Maintainer: Evangelos Foutras <evangelos@foutrelis.com>

pkgname=('php-geoip' 'php-legacy-geoip')
pkgver=1.1.1
pkgrel=9
pkgdesc="GeoIP module for PHP"
arch=('x86_64')
url="https://pecl.php.net/package/geoip"
license=('PHP')
depends=('geoip')
makedepends=('php' 'php-legacy')
source=(https://pecl.php.net/get/geoip-$pkgver.tgz
        php8.patch)
sha256sums=('b2d05c03019d46135c249b5a7fa0dbd43ca5ee98aea8ed807bc7aa90ac8c0f06'
            'da576049b0c69b3c22c0defa7313a22c0244fbf3a10555e6549f7957f7a429c6')

prepare() {
  patch -Np0 -d geoip-$pkgver <php8.patch
  cp -a geoip-$pkgver{,-php-legacy}
}

build() {
  cd geoip-$pkgver
  phpize
  ./configure --prefix=/usr
  make

  cd ../geoip-$pkgver-php-legacy
  phpize-legacy
  ./configure --prefix=/usr
  make
}

package_php-geoip() {
  depends+=('php')
  backup=('etc/php/conf.d/geoip.ini')

  cd geoip-$pkgver

  make INSTALL_ROOT="$pkgdir" install
  install -d "$pkgdir/etc/php/conf.d"
  echo ';extension=geoip.so' >"$pkgdir/etc/php/conf.d/geoip.ini"
}

package_php-legacy-geoip() {
  pkgdesc=${pkgdesc/PHP/PHP Legacy}
  depends+=('php-legacy')
  backup=('etc/php-legacy/conf.d/geoip.ini')

  cd geoip-$pkgver-php-legacy

  make INSTALL_ROOT="$pkgdir" install
  install -d "$pkgdir/etc/php-legacy/conf.d"
  echo ';extension=geoip.so' >"$pkgdir/etc/php-legacy/conf.d/geoip.ini"
}

# vim:set ts=2 sw=2 et:
