# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Andre Klitzing <andre () incubo () de>

pkgname=nsis
pkgver=2.50
pkgrel=2
pkgdesc='A professional open source system to create Windows installers'
arch=('i686' 'x86_64')
url='http://nsis.sourceforge.net'
license=('custom:zlib')
depends=('gcc-libs')
makedepends=('scons' 'mingw-w64-gcc')
options=(!strip)
source=(http://downloads.sourceforge.net/project/nsis/NSIS%202/$pkgver/$pkgname-$pkgver-src.tar.bz2
        nsis-2.43-64bit-fixes.patch
        nsis-2.45-static-libgcc.patch
        nsis-2.46-missing-unistd-include.patch
        nsis-2.46-static-libstdc++.patch
        nsis-add-mingw-w64-support.patch
        nsis-948074.patch)
md5sums=('076850a971589a787d30224bfde936aa'
         '9eead3b78da54e3afda8f6a5b663aea9'
         '28f1002dd3c6a57cd3e1f8bb09c81fc5'
         'c4f912f0ca7fa455948f9f6a73314d93'
         '3d41bf574cd3bed0c4f14afca9bc4819'
         'd72c910fa1e9b8372fadf1ba905139ab'
         '9b94bfb75b4dcfd3872c7fa2573d2ee5')

prepare() {
  cd "$srcdir/$pkgname-$pkgver-src"
  # http://pkgs.fedoraproject.org/cgit/mingw-nsis.git/tree/
  patch -p1 -i "$srcdir/nsis-2.43-64bit-fixes.patch"
  patch -p1 -i "$srcdir/nsis-2.45-static-libgcc.patch"
  patch -p1 -i "$srcdir/nsis-2.46-missing-unistd-include.patch"
  patch -p1 -i "$srcdir/nsis-2.46-static-libstdc++.patch"
  patch -p1 -i "$srcdir/nsis-add-mingw-w64-support.patch"

  # https://bugzilla.redhat.com/show_bug.cgi?id=948074
  patch -p1 -i "$srcdir/nsis-948074.patch"
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
