# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Andre Klitzing <andre () incubo () de>

pkgname=nsis
pkgver=3.0
pkgrel=1
pkgdesc='A professional open source system to create Windows installers'
arch=('i686' 'x86_64')
url='http://nsis.sourceforge.net'
license=('custom:zlib')
depends=('gcc-libs')
makedepends=('scons' 'mingw-w64-gcc' 'mingw-w64-zlib')
options=(!strip)
source=(http://downloads.sourceforge.net/project/nsis/NSIS%203/$pkgver/$pkgname-$pkgver-src.tar.bz2
        nsis-add-mingw-w64-support.patch)
md5sums=('23d2e0f58e7ea3b2df2c16791896a6f1'
         '39c4d9f24fd18b999c2a487e2bbcb788')

prepare() {
  cd "$srcdir/$pkgname-$pkgver-src"

  # https://github.com/kichik/nsis/commit/4677332
  patch -p1 -i "$srcdir/nsis-add-mingw-w64-support.patch"
}

build() {
  cd "$srcdir/$pkgname-$pkgver-src"
  scons VERSION=$pkgver PREFIX=/usr PREFIX_CONF=/etc SKIPUTILS='NSIS Menu' STRIP_CP=false ZLIB_W32=/usr/i686-w64-mingw32/
}

package() {
  cd "$srcdir/$pkgname-$pkgver-src"
  scons VERSION=$pkgver PREFIX=/usr PREFIX_CONF=/etc SKIPUTILS='NSIS Menu' STRIP_CP=false  ZLIB_W32=/usr/i686-w64-mingw32/ PREFIX_DEST="$pkgdir" install
  install -Dm644 ${srcdir}/$pkgname-$pkgver-src/Docs/src/license.but "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
