# Maintainer: Christoph Brill <aur@christophbrill.de>
# Contributors:
# Biswa96 <nathbappai@gmail.com>

pkgbase=cairomm16
pkgname=(cairomm16 cairomm16-docs)
pkgver=1.16.0
pkgrel=1
pkgdesc="C++ bindings for Cairo"
url="https://www.cairographics.org/cairomm/"
arch=(x86_64)
license=(LGPL MPL)
depends=(cairo libsigc++3)
makedepends=(git mm-common)
checkdepends=(boost fontconfig)
_commit=9db4b39bfe50e183130b89824a3556da09cd51cb  # tags/v1.16.0^0
source=("git+https://anongit.freedesktop.org/git/cairomm#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd cairomm
  git describe --tags | sed 's/^v//;s/-/+/g'
}

prepare() {
  cd cairomm
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd cairomm
  ./configure --prefix=/usr --enable-maintainer-mode
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package_cairomm16() {
  cd cairomm
  sed -i -e 's/^doc_subdirs/#doc_subdirs/' Makefile
  make DESTDIR="$pkgdir" install
}

package_cairomm16-docs() {
  pkgdesc+=" (documentation)"
  depends=()

  cd cairomm
  make -C docs DESTDIR="$pkgdir" install
}
