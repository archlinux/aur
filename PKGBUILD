# $Id$
# Maintainer: Vadzim Dambrouski <pftbest@gmail.com>

_pkgbasename=ncurses
pkgname=lib32-${_pkgbasename}5
pkgver=6.0
pkgrel=2
pkgdesc="System V Release 4.0 curses emulation library (32-bit) ABI 5"
arch=('x86_64')
url="http://www.gnu.org/software/ncurses/"
license=('MIT')
depends=('lib32-glibc' ${_pkgbasename})
makedepends=("gcc-multilib")
source=(ftp://invisible-island.net/${_pkgbasename}/${_pkgbasename}-${pkgver}.tar.gz{,.asc})
md5sums=('ee13d052e1ead260d7c28071f46eefb1'
         'SKIP')
validpgpkeys=('C52048C0C0748FEE227D47A2702353E0F7E48EDB') # Thomas Dickey

build() {
  cd ${_pkgbasename}-${pkgver}

  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  ./configure --prefix=/usr --mandir=/usr/share/man \
     --with-shared --with-normal --without-debug --without-ada \
     --with-install-prefix=${pkgdir} --enable-widec --libdir=/usr/lib32 \
     --with-abi-version=5 --with-gpm=no
  make
}

package() {
  cd ${_pkgbasename}-${pkgver}
  make install.libs
  rm -rf "$pkgdir"/usr/bin/
  rm -rf "$pkgdir"/usr/include/
  #rm -rf "$pkgdir"/usr/lib32/pkgconfig
  rm -rf "$pkgdir"/usr/lib32/*.a
  rm -rf "$pkgdir"/usr/lib32/*.so

  # fool packages looking to link to non-wide-character ncurses libraries
  for lib in ncurses ncurses++ form panel menu; do
    ln -s /usr/lib32/lib${lib}w.so.5 "$pkgdir"/usr/lib32/lib${lib}.so.5
  done

  # install license, rip it from the readme
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  grep -B 100 '$Id' README > "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim: set et ts=2 sw=2:
