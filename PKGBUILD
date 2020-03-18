# Maintainer: Tilmann Meyer <tilmann.meyer@gmx.net>

_target=aarch64-linux-gnu

_pkgname=ncurses
pkgname=$_target-$_pkgname
pkgver=6.2
pkgrel=1
pkgdesc='System V Release 4.0 curses emulation library (ARM64)'
arch=(x86_64)
url='https://invisible-island.net/ncurses/ncurses.html'
license=(MIT)
depends=($_target-glibc)
makedepends=($_target-configure)
options=(!buildflags)
source=(
  https://ftp.gnu.org/pub/gnu/ncurses/ncurses-$pkgver.tar.gz{,.sig}
)
sha256sums=(
  '30306e0c76e0f9f1f0de987cf1c82a5c21e1ce6568b9227f7da5b71cbea86c9d'
  'SKIP'
)
validpgpkeys=(
  'C52048C0C0748FEE227D47A2702353E0F7E48EDB' # Thomas Dickey
)

_srcdir=$_pkgname-${pkgver/+/-}

strip() {
  ${_target}-strip "$@"
}

objcopy() {
  ${_target}-objcopy "$@"
}

build() {
  cd $_srcdir

  mkdir -p build-$_target && pushd build-$_target
  $_target-configure \
    --without-ada --without-debug --with-normal --with-shared --disable-stripping \
    --enable-widec --enable-pc-files --with-cxx-binding --with-cxx-shared --disable-rpath \
    --with-manpage-format=normal
  make
  popd
}

package() {
  cd $_srcdir

  pushd build-$_target
  make DESTDIR="$pkgdir" install
  popd

  mv "$pkgdir"/usr/share/pkgconfig "$pkgdir"/usr/$_target/lib/pkgconfig
  rm -rf "$pkgdir"/usr/share

  install -Dm644 COPYING "$pkgdir/usr/$_target/share/licenses/$pkgname/LICENSE"

  for lib in ncurses ncurses++ form panel menu; do
    echo "INPUT(-l${lib}w)" >"$pkgdir/usr/$_target/lib/lib${lib}.so"
    ln -s ${lib}w.pc "$pkgdir/usr/$_target/lib/pkgconfig/${lib}.pc"
  done

  # some packages look for -lcurses during build
  echo 'INPUT(-lncursesw)' >"$pkgdir/usr/$_target/lib/libcursesw.so"
  ln -s libncurses.so "$pkgdir/usr/$_target/lib/libcurses.so"
}
