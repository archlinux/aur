# $Id: PKGBUILD 78820 2012-10-25 06:47:28Z foutrelis $
# Upstream Maintainer: Allan McRae <allan@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>
# Maintainer: Fantix King <fantix.king at gmail.com>

_pkgbasename=ncurses
pkgname=libx32-${_pkgbasename}
pkgver=5.9
pkgrel=1.1
pkgdesc="System V Release 4.0 curses emulation library (x32 ABI)"
arch=('x86_64')
url="http://www.gnu.org/software/ncurses/"
license=('MIT')
depends=('libx32-glibc' ${_pkgbasename})
makedepends=("gcc-multilib-x32")
source=(ftp://ftp.gnu.org/pub/gnu/${_pkgbasename}/${_pkgbasename}-${pkgver}.tar.gz)
md5sums=('8cb9c412e5f2d96bc6f459aa8c6282a1')

build() {
  export CC="gcc -mx32"
  export CXX="g++ -mx32"
  export PKG_CONFIG_PATH="/usr/libx32/pkgconfig"

  cd ${srcdir}/
  mkdir ncurses{,w}-build

  cd ${srcdir}/ncursesw-build
  ../${_pkgbasename}-${pkgver}/configure --prefix=/usr --mandir=/usr/share/man \
     --with-shared --with-normal --without-debug --without-ada \
     --with-install-prefix=${pkgdir} --enable-widec --libdir=/usr/libx32
  make

  # libncurses.so.5 for external binary support 
  cd ${srcdir}/ncurses-build
#  [ $CARCH = "x86_64" ] && CONFIGFLAG="--with-chtype=long"
  ../${_pkgbasename}-${pkgver}/configure --prefix=/usr \
    --with-shared --with-normal --without-debug --without-ada \
    --with-install-prefix=${pkgdir} $CONFIGFLAG --libdir=/usr/libx32
  make
}

package() {
  cd ${srcdir}/ncursesw-build
  make install

  install -dm755 ${pkgdir}/usr/libx32

  # Fool packages looking to link to non-wide-character ncurses libraries
  for lib in curses ncurses form panel menu; do
    rm -f ${pkgdir}/usr/libx32/lib${lib}.so
    echo "INPUT(-l${lib}w)" >${pkgdir}/usr/libx32/lib${lib}.so
    ln -sf lib${lib}w.a ${pkgdir}/usr/libx32/lib${lib}.a
  done
  ln -sf libncurses++w.a ${pkgdir}/usr/libx32/libncurses++.a

  # Some packages look for -lcurses during build
  rm -f ${pkgdir}/usr/libx32/libcursesw.so
  echo "INPUT(-lncursesw)" >${pkgdir}/usr/libx32/libcursesw.so
  ln -sf libncurses.so ${pkgdir}/usr/libx32/libcurses.so
  ln -sf libncursesw.a ${pkgdir}/usr/libx32/libcursesw.a
  ln -sf libncurses.a ${pkgdir}/usr/libx32/libcurses.a

  # non-widec compatibility library
  cd ${srcdir}/ncurses-build        
  install -Dm755 lib/libncurses.so.${pkgver} ${pkgdir}/usr/libx32/libncurses.so.${pkgver}
  ln -sf libncurses.so.${pkgver} ${pkgdir}/usr/libx32/libncurses.so.5

  rm -rf "${pkgdir}"/usr/{include,share,bin}
}
