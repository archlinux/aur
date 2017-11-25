# $Id$
# Maintainer: Eden Rose(endlesseden) <eenov1988 "at"  gmail.com >
# Contributor:  Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>
# Contributor: handsome <by_yeun@daum.net>

_pkgbasename=ncurses
pkgname=lib32-${_pkgbasename}-full
_pkgver=6.0-20170902
pkgver=${_pkgver/-/+}
pkgrel=1
pkgdesc='System V Release 4.0 curses emulation library, with static and shared libraries, Inclusion of libTinfo (32-bit)'
arch=(x86_64)
url='http://invisible-island.net/ncurses/ncurses.html'
license=(MIT)
depends=(lib32-glibc gcc-libs-multilib ${_pkgbasename}-full)
provides=(lib32-libtinfo lib32-ncurses)
conflicts=(lib32-libtinfo lib32-ncurses ncurses-full-git lib32-ncurses5-compat-libs)
source=(http://invisible-mirror.net/archives/ncurses/current/ncurses-${_pkgver}.tgz{,.asc})
md5sums=('b7b1cedc484172434855b00831183458'
         'SKIP')
validpgpkeys=('C52048C0C0748FEE227D47A2702353E0F7E48EDB')  # Thomas Dickey

build() {
  cd ${_pkgbasename}-${_pkgver}

  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  ./configure --prefix=/usr --mandir=/usr/share/man \
    --with-pkg-config-libdir=/usr/lib32/pkgconfig \
    --with-normal --without-debug --without-ada \
    --with-install-prefix=${pkgdir} --enable-widec --libdir=/usr/lib32 \
    --with-shared

  make
}

package() {

  cd ${_pkgbasename}-${_pkgver}
  make install

  install -dm755 ${pkgdir}/usr/lib32


  # fool packages looking to link to non-wide-character ncurses libraries
  for lib in curses ncurses form panel menu; do
    rm -f ${pkgdir}/usr/lib32/lib${lib}.so
    echo "INPUT(-l${lib}w)" >${pkgdir}/usr/lib32/lib${lib}.so
    ln -sf lib${lib}w.a ${pkgdir}/usr/lib32/lib${lib}.a
  done
  ln -sf libncurses++w.a ${pkgdir}/usr/lib32/libncurses++.a

  # some packages look for -lcurses during build
  rm -f ${pkgdir}/usr/lib32/libcursesw.so
  echo "INPUT(-lncursesw)" >${pkgdir}/usr/lib32/libcursesw.so
  ln -sf libncurses.so ${pkgdir}/usr/lib32/libcurses.so
  ln -sf libncursesw.a ${pkgdir}/usr/lib32/libcursesw.a
  ln -sf libncurses.a ${pkgdir}/usr/lib32/libcurses.a

  rm -rf "${pkgdir}"/usr/{include,share,bin}
  mkdir -p "$pkgdir/usr/share/licenses"
  ln -s $_pkgbasename "$pkgdir/usr/share/licenses/$pkgname"

  # install libtinfo
  install -d "$pkgdir"/usr/lib32
  ln -s /usr/lib32/libncursesw.so.$pkgver "$pkgdir"/usr/lib32/libtinfo.so."$pkgver"
  ln -s /usr/lib32/libtinfo.so."$pkgver" "$pkgdir"/usr/lib32/libtinfo.so
  ln -s /usr/lib32/libncursesw.a.$pkgver "$pkgdir"/usr/lib32/libtinfo.a."$pkgver"
  ln -s /usr/lib32/libtinfo.a."$pkgver" "$pkgdir"/usr/lib32/libtinfo.a

}
