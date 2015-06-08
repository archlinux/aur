# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Andre Klitzing <andre () incubo () de>

pkgname=nsis
pkgver=2.46
pkgrel=7
pkgdesc='A professional open source system to create Windows installers'
arch=('i686' 'x86_64')
url='http://nsis.sourceforge.net'
license='custom:zlib'
depends=('gcc-libs')
makedepends=('scons' 'mingw-w64-gcc')
options=(!strip)
source=(http://downloads.sourceforge.net/project/nsis/NSIS%202/$pkgver/$pkgname-$pkgver-src.tar.bz2
        nsis-2.43-64bit-fixes.patch
        nsis-2.45-static-libgcc.patch
        nsis-2.46-missing-unistd-include.patch
        nsis-2.46-static-libstdc++.patch
        nsis-add-mingw-w64-support.patch)
md5sums=('61c2e81739436b06d7cf7bcce1d533ac'
         '9eead3b78da54e3afda8f6a5b663aea9'
         '28f1002dd3c6a57cd3e1f8bb09c81fc5'
         'c4f912f0ca7fa455948f9f6a73314d93'
         '3d41bf574cd3bed0c4f14afca9bc4819'
         'd72c910fa1e9b8372fadf1ba905139ab')

prepare() {
  cd "$srcdir/$pkgname-$pkgver-src"
  # http://pkgs.fedoraproject.org/cgit/mingw-nsis.git/tree/
  patch -p1 -i "$srcdir/nsis-2.43-64bit-fixes.patch"
  patch -p1 -i "$srcdir/nsis-2.45-static-libgcc.patch"
  patch -p1 -i "$srcdir/nsis-2.46-missing-unistd-include.patch"
  patch -p1 -i "$srcdir/nsis-2.46-static-libstdc++.patch"
  patch -p1 -i "$srcdir/nsis-add-mingw-w64-support.patch"
}

build() {
  cd "$srcdir/$pkgname-$pkgver-src"
  scons VERSION=$pkgver PREFIX=/usr PREFIX_CONF=/etc SKIPUTILS='NSIS Menu' STRIP_CP=false
}

package() {
  cd "$srcdir/$pkgname-$pkgver-src"
  scons VERSION=$pkgver PREFIX=/usr PREFIX_CONF=/etc SKIPUTILS='NSIS Menu' STRIP_CP=false PREFIX_DEST="$pkgdir" install
  install -Dm644 ${srcdir}/$pkgname-$pkgver-src/Docs/src/license.but "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
