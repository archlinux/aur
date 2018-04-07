# $Id$
# Maintainer:  Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>

pkgname=ncurses-nohex
conflicts=(ncurses)
pkgver=6.1
pkgrel=1
pkgdesc='System V Release 4.0 curses emulation library'
arch=(x86_64)
url='http://invisible-island.net/ncurses/ncurses.html'
license=(MIT)
depends=(glibc gcc-libs)
provides=(ncurses libncurses++w.so libformw.so libmenuw.so libpanelw.so libncursesw.so)
source=(https://ftp.gnu.org/pub/gnu/ncurses/ncurses-$pkgver.tar.gz{,.sig}
	nohex.patch::https://github.com/mbloms/ncurses/commit/2e8af507b9ea61ca9f70e023e89faa16aa01c8b1.patch)
md5sums=('98c889aaf8d23910d2b92d65be2e737a'
         'SKIP'
         'ba2cd274835935bf83bf3859a131fd1e')
validpgpkeys=('C52048C0C0748FEE227D47A2702353E0F7E48EDB')  # Thomas Dickey

prepare() {
  patch -p1 -d $provides-$pkgver < nohex.patch 
}

build() {
  cd $provides-$pkgver

  ./configure --prefix=/usr --mandir=/usr/share/man \
    --with-pkg-config-libdir=/usr/lib/pkgconfig \
    --with-shared --with-normal --without-debug --without-ada \
    --enable-widec --enable-pc-files --with-cxx-binding --with-cxx-shared
  make
}

package() {
  cd $provides-$pkgver
  make DESTDIR="$pkgdir" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # fool packages looking to link to non-wide-character ncurses libraries
  for lib in ncurses ncurses++ form panel menu; do
    echo "INPUT(-l${lib}w)" > "$pkgdir/usr/lib/lib${lib}.so"
    ln -s ${lib}w.pc "$pkgdir/usr/lib/pkgconfig/${lib}.pc"
  done

  for lib in tic tinfo; do
    echo "INPUT(libncursesw.so.${pkgver:0:1})" > "$pkgdir/usr/lib/lib${lib}.so"
    ln -s libncursesw.so.${pkgver:0:1} "$pkgdir/usr/lib/lib${lib}.so.${pkgver:0:1}"
  done

  # some packages look for -lcurses during build
  echo 'INPUT(-lncursesw)' > "$pkgdir/usr/lib/libcursesw.so"
  ln -s libncurses.so "$pkgdir/usr/lib/libcurses.so"
}
