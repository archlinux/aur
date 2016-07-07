# Maintainer: Kevin Brodsky <corax26 at gmail dot com>

_pkgbasename=ncurses
pkgname=lib32-${_pkgbasename}5-compat-libs
pkgver=6.0
pkgrel=4
pkgdesc="System V Release 4.0 curses emulation library (32-bit), ABI 5"
arch=('x86_64')
url='http://invisible-island.net/ncurses/ncurses.html'
license=('MIT')
depends=('lib32-glibc' "lib32-${_pkgbasename}")
makedepends=("gcc-multilib")
provides=('lib32-libtinfo5')
conflicts=('lib32-libtinfo5')
source=(ftp://invisible-island.net/${_pkgbasename}/${_pkgbasename}-${pkgver}.tar.gz{,.asc})
md5sums=('ee13d052e1ead260d7c28071f46eefb1'
         'SKIP')
validpgpkeys=('C52048C0C0748FEE227D47A2702353E0F7E48EDB') # Thomas Dickey

build() {
  cd ${_pkgbasename}-${pkgver}

  export CC="gcc -m32"
  export CXX="g++ -m32"

  ./configure --prefix=/usr --mandir=/usr/share/man \
     --with-shared --with-normal --without-debug --without-ada \
     --with-install-prefix=${pkgdir} --enable-widec --libdir=/usr/lib32 \
     --enable-ext-colors --enable-ext-mouse \
     --with-abi-version=5 --without-pkg-config --without-gpm
   make
}

package() {
  cd ${_pkgbasename}-${pkgver}
  make install.libs

  install -dm755 ${pkgdir}/usr/lib32

  # fool packages looking to link to non-wide-character ncurses libraries
  for lib in ncurses form panel menu; do
    ln -s lib${lib}w.so.5 "$pkgdir"/usr/lib32/lib${lib}.so.5
  done
  # Also provide a libtinfo symlink
  ln -s libncurses.so.5 "$pkgdir/usr/lib32/libtinfo.so.5"

  # Remove .so symlinks and static libraries (conflicting with lib32-ncurses)
  rm -f "${pkgdir}"/usr/{lib32/*.so,lib32/*.a}

  rm -rf "${pkgdir}"/usr/{include,share,bin}
  mkdir -p "$pkgdir/usr/share/licenses"
  ln -s $_pkgbasename "$pkgdir/usr/share/licenses/$pkgname"
}

# vim: set et ts=2 sw=2:
