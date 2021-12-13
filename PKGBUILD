# Maintainer: Anton Kudelin <kudelin at protonmail dot com>

pkgname=quickfix
pkgver=1.15.1
pkgrel=3
pkgdesc="C++ Fix Engine Library"
arch=("x86_64")
url="http://www.quickfixengine.org/"
license=('custom:The QuickFIX Software License, Version 1.0')
depends=('tbb' 'python')
makedepends=('boost')
conflicts=('quickfix-git')
source=("https://github.com/$pkgname/$pkgname/archive/v$pkgver.tar.gz"
        "unit_test.patch")
sha256sums=('1c4322a68704526ca3d1f213e7b0dcd30e067a8815be2a79b2ab1197ef70dcf7'
            '238110374f3082db505cd0574b67d20aeb23c36e76f68ea7b2e277d8e1b3cada')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -p1 < ../unit_test.patch
  ./bootstrap
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure \
    --prefix=/usr \
    --with-boost=/usr \
    --with-openssl=/usr \
    --with-tbb=/usr \
    --with-python3
  make
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  make check
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -dm755 "$pkgdir/usr/share/licenses/quickfix"
  install -m755 LICENSE "$pkgdir/usr/share/licenses/quickfix"
} 
