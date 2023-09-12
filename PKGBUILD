# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=gnucobol-svn
pkgver=r5155
pkgrel=1
pkgdesc="A free/libre COBOL compiler"
arch=('i686' 'x86_64')
url="https://gnucobol.sourceforge.io/"
license=('GPL' 'LGPL')
depends=('cjson' 'db' 'gmp' 'libxml2' 'ncurses')
makedepends=('subversion' 'gcc' 'help2man' 'rsync')
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
  # skip check
  sed -i 's|test "$(GETTEXT_MACRO_VERSION)" = "@GETTEXT_MACRO_VERSION@"|true|g' "po/Makefile.in.in"
  po/update_linguas.sh
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
