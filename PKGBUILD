# Maintainer: Mikael Blomstrand <gmail: chawlindel>

# PKGBUILD based on community/ncurses:
# Contributor:  Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>

pkgname=('ncurses-nohex' 'infocmp-nohex')
conflicts=(ncurses)
pkgver=6.2
pkgrel=1
pkgdesc="System V Release 4.0 curses emulation library. Patch disables hexadecimal in infocmp."
arch=(x86_64)
url='https://invisible-island.net/ncurses/ncurses.html'
license=(MIT)
depends=(glibc gcc-libs)
provides=(ncurses libncurses++w.so libformw.so libmenuw.so libpanelw.so libncursesw.so)
source=(https://ftp.gnu.org/pub/gnu/ncurses/ncurses-$pkgver.tar.gz{,.sig}
  nohex.patch::https://github.com/mbloms/ncurses/commit/2e8af507b9ea61ca9f70e023e89faa16aa01c8b1.patch
  README.md)
md5sums=('e812da327b1c2214ac1aed440ea3ae8d'
         'SKIP'
         'ba2cd274835935bf83bf3859a131fd1e'
         '0fd492d6811b9f520fdfd6188f290069')
sha1sums=('56e410fb77f2b5501a0b2f6a995376f3cefe1097'
          'SKIP'
          '5fb4b04bd1c2c3ce89f140fffa6769dfd2e3f741'
          '0abec6eae58208ad167753fee41c63b130c16f0d')
sha256sums=('30306e0c76e0f9f1f0de987cf1c82a5c21e1ce6568b9227f7da5b71cbea86c9d'
            'SKIP'
            'c59a4209ea84a31bba0ea5721ce1ed32252a951270dda3f932cfc6ab4ca821b8'
            '77aaa2c490d561955c1e28ab7fe32976553771e6bfe1ce0ffc57848ce4edb605')

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

package_ncurses-nohex() {
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
    ln -s ncursesw.pc "$pkgdir/usr/lib/pkgconfig/${lib}.pc"
  done

  # some packages look for -lcurses during build
  echo 'INPUT(-lncursesw)' > "$pkgdir/usr/lib/libcursesw.so"
  ln -s libncurses.so "$pkgdir/usr/lib/libcurses.so"
}

package_infocmp-nohex() {
  pkgdesc='infocmp patched to not use hexadecimal when they are "close" to a power of two'
  depends=('glibc' 'libncursesw.so=6')
  conflicts=()
  provides=('infocmp')

  install -Dm755 ncurses-${pkgver}/progs/infocmp ${pkgdir}/usr/local/bin/infocmp
}
