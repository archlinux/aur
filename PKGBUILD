# Maintainer: Mikael Blomstrand <mbloms ÅT kth DÖT se>

# PKGBUILD based on community/ncurses:
# Contributor:  Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>

pkgname=ncurses-nohex
conflicts=(ncurses)
pkgver=6.1
pkgrel=2
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
sha1sums=('57acf6bc24cacd651d82541929f726f4def780cc'
          'SKIP'
          '5fb4b04bd1c2c3ce89f140fffa6769dfd2e3f741')
sha256sums=('aa057eeeb4a14d470101eff4597d5833dcef5965331be3528c08d99cebaa0d17'
            'SKIP'
            'c59a4209ea84a31bba0ea5721ce1ed32252a951270dda3f932cfc6ab4ca821b8')

validpgpkeys=('C52048C0C0748FEE227D47A2702353E0F7E48EDB')  # Thomas Dickey

prepare() {
  patch -p1 -d $conflicts-$pkgver < nohex.patch 
}

build() {
  cd $conflicts-$pkgver

  ./configure --prefix=/usr --mandir=/usr/share/man \
    --with-pkg-config-libdir=/usr/lib/pkgconfig \
    --with-shared --with-normal --without-debug --without-ada \
    --enable-widec --enable-pc-files --with-cxx-binding --with-cxx-shared \
    --with-manpage-format=normal
  make
}

package() {
  cd $conflicts-$pkgver
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
