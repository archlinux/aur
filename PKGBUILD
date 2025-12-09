# Maintainer: John Karpn <johnkarpn@gmail.com>

_name=igbinary
pkgname=php84-igbinary
pkgver=3.2.17RC1
pkgrel=2
pkgdesc="A drop in replacement for the standard php serializer"
arch=(x86_64)
url="https://github.com/igbinary/igbinary"
license=(BSD-3-Clause)
depends=(glibc)
makedepends=(php84)
source=($pkgname-$pkgver.tar.gz::https://github.com/$_name/$_name/archive/$pkgver.tar.gz)
sha512sums=('d26b58abb5624deeb29824d1ab9544e8cdd209f05fa361c33f1dad0c559ba6b96cf415908b9430a93aec220052f6ae84f5fa9414497ff685837f5823320a7d99')
b2sums=('7186601e747b4b48c8d969ff16c5a0eb462f616842a43a49d16d74992ca4d6d30a0008d8d3c9e500f218dfda536a032c18fd29dff65cecb300c60b4c80179ef0')

prepare() {
  mv -v $_name-$pkgver $pkgname-$pkgver
  # disable the extension by default
  sed 's/extension/;extension/g' -i $pkgname-$pkgver/$_name.php.ini

  (
    cd $pkgname-$pkgver
    # remove deprecated error level
    sed 's/E_ALL|E_STRICT/E_ALL/g' -i tests/igbinary_009b_php8.phpt
    phpize84
  )
}

build() {
  local configure_options=(
    --prefix=/usr
    --enable-igbinary
    --with-php-config=/usr/bin/php-config84
  )

  (
    cd $pkgname-$pkgver
    ./configure "${configure_options[@]}"
    make
  )
}

check() {
  NO_INTERACTION=1 make -k test -C $pkgname-$pkgver
}

package() {
  depends+=(php84)
  backup=(etc/php84/conf.d/$_name.ini)

  cd $pkgname-$pkgver
  make INSTALL_ROOT="$pkgdir" install
  install -vDm 644 $_name.php.ini "$pkgdir/etc/php84/conf.d/$_name.ini"
  install -vDm 644 COPYING -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 {CREDITS,NEWS,README.md} -t "$pkgdir/usr/share/doc/$pkgname/"
}