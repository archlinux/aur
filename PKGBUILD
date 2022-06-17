# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=ncurses-git
pkgver=6.3.20220612.r0.g3f2a6304
pkgrel=1
pkgdesc="Screen handling and optimization package"
arch=('i686' 'x86_64')
url="https://invisible-island.net/ncurses/ncurses.html"
license=('MIT')
depends=('gcc-libs')
makedepends=('git')
provides=("ncurses=$pkgver" 'libncurses++w.so' 'libformw.so' 'libmenuw.so' 'libpanelw.so' 'libncursesw.so')
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
    --with-versioned-syms \
    --with-xterm-kbs=del \
    --without-ada \
    --without-debug
  make
}

package() {
  cd "ncurses-snapshots"

  make DESTDIR="$pkgdir" install
  install -Dm644 "COPYING" -t "$pkgdir/usr/share/licenses/ncurses"

  # fool packages looking to link to non-wide-character ncurses libraries
  for lib in ncurses ncurses++ form panel menu; do
    printf "INPUT(-l%sw)\n" "${lib}" > "$pkgdir/usr/lib/lib${lib}.so"
    ln -sv ${lib}w.pc "$pkgdir/usr/lib/pkgconfig/${lib}.pc"
  done

  # some packages look for -lcurses during build
  printf 'INPUT(-lncursesw)\n' > "$pkgdir/usr/lib/libcursesw.so"
  ln -sv libncurses.so "$pkgdir/usr/lib/libcurses.so"

  # tic and ticinfo functionality is built in by default
  # make sure that anything linking against it links against libncursesw.so instead
  for lib in tic tinfo; do
    printf "INPUT(libncursesw.so.%s)\n" "${pkgver:0:1}" > "$pkgdir/usr/lib/lib${lib}.so"
    ln -sv libncursesw.so.${pkgver:0:1} "$pkgdir/usr/lib/lib${lib}.so.${pkgver:0:1}"
    ln -sv ncursesw.pc "$pkgdir/usr/lib/pkgconfig/${lib}.pc"
  done
}
