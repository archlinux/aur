# $Id$
# Maintainer: Eden Rose(endlesseden) <eenov1988 "at"  gmail.com >
# Contributor:  Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>

_pkgname=ncurses
pkgname=ncurses-full
_pkgver=6.0-20170902
pkgver=${_pkgver/-/+}
pkgrel=1
pkgdesc='System V Release 4.0 curses emulation library, with static and shared libraries, Inclusion of libTinfo.'
arch=(i686 x86_64)
url='http://invisible-island.net/ncurses/ncurses.html'
license=(MIT)
depends=(glibc gcc-libs)
provides=(libncurses++w.a libformw.a libmenuw.a libpanelw.a libncursesw.a libncurses++w.so libformw.so libmenuw.so 
libpanelw.so libncursesw.so libtinfo.a libtinfo.so ncurses ncurses-full libtinfo)
conflicts=(libtinfo ncurses ncurses-full-git ncurses5-compat-libs)
source=(http://invisible-mirror.net/archives/ncurses/current/ncurses-${_pkgver}.tgz{,.asc})
md5sums=('b7b1cedc484172434855b00831183458'
         'SKIP')
validpgpkeys=('C52048C0C0748FEE227D47A2702353E0F7E48EDB')  # Thomas Dickey

build() {
  cd $_pkgname-${_pkgver}

  ./configure --prefix=/usr --mandir=/usr/share/man \
    --with-pkg-config-libdir=/usr/lib/pkgconfig \
    --with-static --with-normal --without-debug --without-ada \
    --enable-widec --enable-pc-files --with-cxx-binding --with-cxx-static \
    --with-shared --with-cxx-shared

  make
}

package() {

  cd $_pkgname-${_pkgver}
  make DESTDIR="$pkgdir" install

  # fool packages looking to link to non-wide-character ncurses libraries
  for lib in ncurses ncurses++ form panel menu; do
    echo "INPUT(-l${lib}w)" > "$pkgdir/usr/lib/lib${lib}.a"
    echo "INPUT(-l${lib}w)" > "$pkgdir/usr/lib/lib${lib}.so"
    ln -s ${lib}w.pc "$pkgdir/usr/lib/pkgconfig/${lib}.pc"
  done

  # some packages look for -lcurses during build
  echo "INPUT(-lncursesw)" > "$pkgdir/usr/lib/libcursesw.a"
  ln -s libncurses.a "$pkgdir/usr/lib/libcurses.a"

  echo "INPUT(-lncursesw)" > "$pkgdir/usr/lib/libcursesw.so"
  ln -s libncurses.so "$pkgdir/usr/lib/libcurses.so"

  # install license, rip it from the readme
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  grep -B 100 '$Id' README > "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # install libtinfo
  install -d "$pkgdir"/usr/lib
  ln -s /usr/lib/libncursesw.so.$pkgver "$pkgdir"/usr/lib/libtinfo.so."$pkgver"
  ln -s /usr/lib/libtinfo.so."$pkgver" "$pkgdir"/usr/lib/libtinfo.so
  ln -s /usr/lib/libncursesw.a.$pkgver "$pkgdir"/usr/lib/libtinfo.a."$pkgver"
  ln -s /usr/lib/libtinfo.a."$pkgver" "$pkgdir"/usr/lib/libtinfo.a

}
