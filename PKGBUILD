# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=gnucobol-svn
pkgver=r5501
pkgrel=1
pkgdesc="A free/libre COBOL compiler"
arch=('i686' 'x86_64')
url="https://gnucobol.sourceforge.io/"
license=('GPL-3.0-or-later' 'LGPL-3.0-or-later')
depends=('glibc' 'cjson' 'db' 'gmp' 'libxml2' 'ncurses')
makedepends=('subversion' 'help2man' 'rsync')
provides=("gnucobol=$pkgver")
conflicts=('gnucobol')
options=('staticlibs')
source=("svn+https://svn.code.sf.net/p/gnucobol/code/trunk")
sha256sums=('SKIP')


pkgver() {
  cd "trunk"

  _rev="$(svnversion | sed 's/[^0-9]+//')"
  printf "r%s" "$_rev"
}

build() {
  cd "trunk"

  autoreconf -fi
  ./autogen.sh
  po/update_linguas.sh
  CFLAGS="$CFLAGS -ffat-lto-objects -std=c11 -Wno-error=implicit-function-declaration -Wno-error=incompatible-pointer-types" \
  ./configure \
    --prefix="/usr"
  make
}

check() {
  cd "trunk"

  #make check
}

package() {
  cd "trunk"

  make DESTDIR="$pkgdir" install
}
