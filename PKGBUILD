# Maintainer: Kevin Brodsky <corax26 at gmail dot com>

_pkgbasename=ncurses
pkgname=lib32-${_pkgbasename}5-compat-libs
pkgver=6.0
_compatpkgver=5.9
pkgrel=3
pkgdesc="System V Release 4.0 curses emulation library (32-bit), ABI 5"
arch=('x86_64')
url="http://www.gnu.org/software/ncurses/"
license=('MIT')
makedepends=("gcc-multilib")
source=(ftp://ftp.gnu.org/pub/gnu/${_pkgbasename}/${_pkgbasename}-${pkgver}.tar.gz)
md5sums=('ee13d052e1ead260d7c28071f46eefb1')

build() {
  cd ${_pkgbasename}-${pkgver}

  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  ./configure --prefix=/usr --mandir=/usr/share/man \
      --with-shared --with-normal --without-debug --without-ada \
      --with-install-prefix=${pkgdir} --enable-widec --libdir=/usr/lib32 \
      --enable-ext-colors --enable-ext-mouse --without-gpm --with-abi-version=5
   make
}

package() {
  cd ${_pkgbasename}-${pkgver}
  make install

  install -dm755 ${pkgdir}/usr/lib32

  # fool packages looking to link to non-wide-character ncurses libraries
  for lib in ncurses form panel menu; do
    ln -s lib${lib}w.so.5 "$pkgdir"/usr/lib32/lib${lib}.so.5
  done

  # Also remove .so symlinks and static libraries (conflicting with lib32-ncurses)
  rm -rf "${pkgdir}"/usr/{include,share,bin,lib32/*.so,lib32/*.a}

  mkdir -p "$pkgdir/usr/share/licenses"
  ln -s $_pkgbasename "$pkgdir/usr/share/licenses/$pkgname"
}

# vim: set et ts=2 sw=2:
