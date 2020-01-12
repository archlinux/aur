# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=ncurses-git
pkgver=6.1.20200111.r0.g431911e0
pkgrel=1
pkgdesc="Screen handling and optimization package"
arch=('i686' 'x86_64')
url="https://invisible-island.net/ncurses/ncurses.html"
license=('MIT')
depends=('glibc')
makedepends=('git')
provides=('ncurses' 'libncurses++w.so' 'libformw.so' 'libmenuw.so' 'libpanelw.so' 'libncursesw.so')
conflicts=('ncurses')
options=('staticlibs')
source=("git+https://github.com/ThomasDickey/ncurses-snapshots.git")
sha256sums=('SKIP')


pkgver() {
  cd "ncurses-snapshots"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g;s/_/./g'
}

build() {
  cd "ncurses-snapshots"

  ./configure \
    --prefix="/usr" \
    --mandir="/usr/share/man" \
    --enable-pc-files \
    --enable-widec \
    --with-cxx-shared \
    --with-pkg-config-libdir="/usr/lib/pkgconfig" \
    --with-shared \
    --without-debug
  make
}

package() {
  cd "ncurses-snapshots"

  make DESTDIR="$pkgdir" install
  install -Dm644 "COPYING" -t "$pkgdir/usr/share/licenses/ncurses"

  # fool packages looking to link to non-wide-character ncurses libraries
  for lib in ncurses ncurses++ form panel menu; do
    echo "INPUT(-l${lib}w)" > "$pkgdir/usr/lib/lib${lib}.so"
    ln -s "${lib}w.pc" "$pkgdir/usr/lib/pkgconfig/${lib}.pc"
  done

  for lib in tic tinfo; do
    echo "INPUT(libncursesw.so.${pkgver:0:1})" > "$pkgdir/usr/lib/lib${lib}.so"
    ln -s "libncursesw.so.${pkgver:0:1}" "$pkgdir/usr/lib/lib${lib}.so.${pkgver:0:1}"
    ln -s "ncursesw.pc" "$pkgdir/usr/lib/pkgconfig/${lib}.pc"
  done

  # some packages look for -lcurses during build
  echo 'INPUT(-lncursesw)' > "$pkgdir/usr/lib/libcursesw.so"
  ln -s "libncurses.so" "$pkgdir/usr/lib/libcurses.so"
}
