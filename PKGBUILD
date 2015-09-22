# $Id$
# Maintainer: Laszlo Papp <lpapp@kde.org>

_pkgbasename=ncurses5-compat-libs
pkgname=lib32-${_pkgbasename}
pkgver=5.9
pkgrel=1
pkgdesc="System V Release 4.0 curses emulation library (32-bit), ABI 5"
arch=('x86_64')
url="http://www.gnu.org/software/ncurses/"
license=('MIT')
depends=('lib32-glibc' ${_pkgbasename})
makedepends=("gcc-multilib")
source=(ftp://ftp.gnu.org/pub/gnu/${_pkgbasename}/${_pkgbasename}-${pkgver}.tar.gz)
md5sums=('8cb9c412e5f2d96bc6f459aa8c6282a1')

build() {
  export CPPFLAGS="-P"
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cd ${srcdir}/
  mkdir ncurses{,w}-build

  cd ${srcdir}/ncursesw-build
  ../${_pkgbasename}-${pkgver}/configure --prefix=/usr --mandir=/usr/share/man \
     --with-shared --with-normal --without-debug --without-ada \
     --with-install-prefix=${pkgdir} --enable-widec --libdir=/usr/lib32 \
     --without-gpm --with-abi-version=5
  make

  # libraries for external binary support
  cd ${srcdir}/ncurses-build
#  [ $CARCH = "x86_64" ] && CONFIGFLAG="--with-chtype=long"
  ../${_pkgbasename}-${pkgver}/configure --prefix=/usr \
    --with-shared --with-normal --without-debug --without-ada \
    --with-install-prefix=${pkgdir} $CONFIGFLAG --libdir=/usr/lib32 \
     --without-gpm --with-abi-version=5
  make
}

package() {
  cd ${srcdir}/ncursesw-build
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

  # non-widec compatibility libraries
  cd ${srcdir}/ncurses-build
  for lib in ncurses form panel menu; do
    install -Dm755 lib/lib${lib}.so.${pkgver} ${pkgdir}/usr/lib32/lib${lib}.so.${pkgver}
    ln -s lib${lib}.so.${pkgver} ${pkgdir}/usr/lib32/lib${lib}.so.5
  done

  rm -rf "${pkgdir}"/usr/{include,share,bin}
  mkdir -p "$pkgdir/usr/share/licenses"
  ln -s $_pkgbasename "$pkgdir/usr/share/licenses/$pkgname"
}

# vim: set et ts=2 sw=2:

