# Maintainer: Anton Kudelin <kudelin at proton dot me>

pkgname=quickfix
pkgver=1.15.1
pkgrel=6
pkgdesc="C++ Fix Engine Library"
arch=(x86_64)
url="http://www.quickfixengine.org"
license=('custom:The QuickFIX Software License, Version 1.0')
depends=(python tbb)
optdepends=(mysql postgresql-libs ruby)
makedepends=(boost python-setuptools)
checkdepends=(ruby)
source=($pkgname-$pkgver.tar.gz::https://github.com/$pkgname/$pkgname/archive/v$pkgver.tar.gz
        unit_test.patch)
sha256sums=('1c4322a68704526ca3d1f213e7b0dcd30e067a8815be2a79b2ab1197ef70dcf7'
            '238110374f3082db505cd0574b67d20aeb23c36e76f68ea7b2e277d8e1b3cada')
options=(!lto)

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
    --with-allocator=tbb \
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

  # Copying SQL scripts
  install -dm755 "$pkgdir/usr/lib/$pkgname"
  cp -r src/sql "$pkgdir/usr/lib/$pkgname"
  find "$pkgdir/usr/lib/$pkgname" -name "*.bat" -exec rm {} \;
  chmod -R 755 "$pkgdir/usr/lib/$pkgname"

  install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" \
    -t "$pkgdir/usr/share/licenses/$pkgname"
} 
