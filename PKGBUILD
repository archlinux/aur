# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgbase=gtkmm
pkgname=(gtkmm gtkmm-docs)
pkgver=2.24.5+6+g85967ecc
pkgrel=2
pkgdesc="C++ bindings for GTK+ 2"
url="http://www.gtkmm.org/"
arch=(x86_64)
license=(LGPL)
depends=(gtk2 pangomm atkmm)
makedepends=(git mm-common glibmm-docs cairomm-docs pangomm-docs atkmm-docs)
_commit=85967ecc93d16892896626dfac54143b16ba9b9c  # gtkmm-2-24
source=("git+https://git.gnome.org/browse/gtkmm#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd $pkgbase
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd $pkgbase
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd $pkgbase

  # glibmm 2.46 uses C++11 features
  CXXFLAGS+=' -std=c++11'

  ./configure --prefix=/usr --enable-maintainer-mode
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package_gtkmm() {
  cd $pkgbase
  sed -i -e 's/^doc_subdirs/#doc_subdirs/' Makefile
  make DESTDIR="$pkgdir" install
}

package_gtkmm-docs() {
  pkgdesc+=" (documentation)"
  depends=()

  cd $pkgbase
  make -C docs DESTDIR="$pkgdir" install
}
