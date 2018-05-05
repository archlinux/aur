pkgname=mingw-w64-fpc
pkgver=3.0.4
pkgrel=1
pkgdesc="Cross FPC for the MinGW-w64 cross compiler"
arch=('i686' 'x86_64')
url="https://freepascal.org/"
license=("GPL" "LGPL" "MPL")
makedepends=(fpc)
depends=(ncurses expat zlib mingw-w64-binutils)
options=(staticlibs !emptydirs !strip !buildflags)
source=("https://sourceforge.net/projects/freepascal/files/Source/$pkgver/fpcbuild-$pkgver.tar.gz")
sha512sums=('eedfeb4d25b3f4cb30ae9c8f30e0fec2405ef806fa565933cef7904d512f781730e3f023aea2f908c21250e3ced4f74fa780abad77b560728a88cedf591505b6')

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
