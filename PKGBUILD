pkgname=mingw-w64-fpc
pkgver=3.2.2
pkgrel=1
pkgdesc="Cross FPC for the MinGW-w64 cross compiler"
arch=('i686' 'x86_64')
url="https://freepascal.org/"
license=("GPL" "LGPL" "MPL")
makedepends=(fpc)
depends=(ncurses expat zlib mingw-w64-binutils)
options=(staticlibs !emptydirs !strip !buildflags)
source=("https://sourceforge.net/projects/freepascal/files/Source/$pkgver/fpcbuild-$pkgver.tar.gz")
b2sums=('88848308c93f949b59197649cc344498082b6520e43eb1d4413bf68eb251fcab75c863794a188a2298d9e8aba47346253a596ac630b30049ac8bd6f6934aa5a2')
b2sums=('88848308c93f949b59197649cc344498082b6520e43eb1d4413bf68eb251fcab75c863794a188a2298d9e8aba47346253a596ac630b30049ac8bd6f6934aa5a2')

build() {
  cd "fpcbuild-$pkgver"

  make NOGDB=1 all OS_TARGET=win32 CPU_TARGET=i386
  make NOGDB=1 all OS_TARGET=win64 CPU_TARGET=x86_64
}

package() {
  cd "fpcbuild-$pkgver"

  make -j1 NOGDB=1 PREFIX="$pkgdir"/usr crossinstall \
       OS_TARGET=win32 CPU_TARGET=i386
  make -j1 NOGDB=1 PREFIX="$pkgdir"/usr crossinstall \
       OS_TARGET=win64 CPU_TARGET=x86_64

  rm -rf "$pkgdir"/usr/{doc,share/doc}
  rm "$pkgdir"/usr/bin/*

  find "$pkgdir" -name '*.exe' -exec rm {} \;
  strip "$pkgdir/usr/lib/fpc/$pkgver/ppcross386"
  strip "$pkgdir/usr/lib/fpc/$pkgver/ppcrossx64"
  find "$pkgdir/usr/lib/fpc/$pkgver/units/i386-win32" -name '*.a' \
       -o -name '*.o' -exec i686-w64-mingw32-strip -g {} +
  find "$pkgdir/usr/lib/fpc/$pkgver/units/x86_64-win64" -name '*.a' \
       -o -name '*.o' -exec x86_64-w64-mingw32-strip -g {} +

  ln -s /usr/lib/fpc/$pkgver/ppcross386 "$pkgdir"/usr/bin/ppcross386
  ln -s /usr/lib/fpc/$pkgver/ppcrossx64 "$pkgdir"/usr/bin/ppcrossx64
}
