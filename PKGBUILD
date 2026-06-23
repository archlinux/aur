# Maintainer: Anton Kudelin <kudelin at proton dot me>

pkgname=quickfix
pkgver=1.16.0
pkgrel=1
pkgdesc="C++ Fix Engine Library"
arch=(x86_64 aarch64)
url="http://www.quickfixengine.org"
license=('LicenseRef-QuickFIX')
depends=(python tbb)
optdepends=(mysql postgresql-libs ruby)
makedepends=(boost python-setuptools)
checkdepends=(ruby psmisc)
source=($pkgname-$pkgver.tar.gz::https://github.com/$pkgname/$pkgname/archive/v$pkgver.tar.gz)
sha256sums=('6eb0e678288473e57db220d3bf53c4d5c92814629ca548af09ca7e365fd7ee70')
options=(!lto)

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  # kill leftover test server that hangs the build
  sed -i 's| 2 &&> /dev/null| 2>/dev/null|' test/runat.sh
  sed -i 's|^exit $RESULT|kill "$PROCID" 2>/dev/null\n&|' test/runat.sh
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
