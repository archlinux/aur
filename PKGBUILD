pkgname=mingw-w64-fpc
pkgver=3.0.0
pkgrel=1
pkgdesc="Cross FPC for the MinGW-w64 cross compiler"
arch=(i686 x86_64)
url="http://www.freepascal.org/"
license=("GPL" "LGPL" "MPL")
makedepends=(fpc)
depends=(ncurses expat zlib mingw-w64-binutils)
options=(staticlibs !emptydirs !strip !buildflags)
source=("ftp://ftp.freepascal.org/pub/fpc/dist/$pkgver/source/fpcbuild-$pkgver.tar.gz")
sha256sums=('d5913b1d5d3d13190ae7ee72c305d5da49ac2ddc1b375b814751ef09ae5c80ec')

build() {
  cd "$srcdir"/fpcbuild-$pkgver
  make NOGDB=1 all OS_TARGET=win32 CPU_TARGET=i386
  make NOGDB=1 all OS_TARGET=win64 CPU_TARGET=x86_64
}

package() {
	cd "$srcdir"/fpcbuild-$pkgver
	make -j1 NOGDB=1 PREFIX="$pkgdir"/usr crossinstall OS_TARGET=win32 CPU_TARGET=i386
	make -j1 NOGDB=1 PREFIX="$pkgdir"/usr crossinstall OS_TARGET=win64 CPU_TARGET=x86_64
	rm -rf "$pkgdir"/usr/{doc,share/doc}
	find "$pkgdir" -name '*.exe' -exec rm {} \;
	strip "$pkgdir/usr/lib/fpc/$pkgver/ppcross386"
	strip "$pkgdir/usr/lib/fpc/$pkgver/ppcrossx64"
	find "$pkgdir/usr/lib/fpc/$pkgver/units/i386-win32" -name '*.a' -o -name '*.o' | xargs i686-w64-mingw32-strip -g
  find "$pkgdir/usr/lib/fpc/$pkgver/units/x86_64-win64" -name '*.a' -o -name '*.o' | xargs x86_64-w64-mingw32-strip -g
  ln -s /usr/lib/fpc/$pkgver/ppcross386 "$pkgdir"/usr/bin/ppcross386
  ln -s /usr/lib/fpc/$pkgver/ppcrossx64 "$pkgdir"/usr/bin/ppcrossx64
}
