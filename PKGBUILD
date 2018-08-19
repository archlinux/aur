
# Maintainer: Gicu Gorodenco <cyclopsihus 'at' gmail 'dot' com>
# Contributor: Kevin <kevin 'at' archlinux 'dot' org>
# Contributor: criminy <criminy 'at' gmail 'dot' com>

_pkgbasename=cairomm
pkgname=lib32-$_pkgbasename
pkgver=1.12.2
pkgrel=1
pkgdesc="C++ bindings to Cairo vector graphics library (32 bit)"
arch=(x86_64)
url="http://www.cairographics.org"
license=(LGPL MPL)
depends=(lib32-cairo lib32-libsigc++ "$_pkgbasename")
makedepends=(pkgconfig gcc-multilib git mm-common)
options=('!libtool' '!emptydirs')
_commit=e9ef515b7b8db5b4f024ddfefe5dfc03f2b8ccea  # tags/v1.12.2^0
source=("git+https://anongit.freedesktop.org/git/cairomm#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd ${_pkgbasename}
  git describe --tags | sed 's/^v//;s/-/+/g'
}

prepare() {
  cd ${_pkgbasename}
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd ${_pkgbasename}
  ./configure --prefix=/usr --enable-maintainer-mode --libdir=/usr/lib32 CC='gcc -m32' CXX='g++ -m32'
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd ${_pkgbasename}
  sed -i -e 's/^doc_subdirs/#doc_subdirs/' Makefile
  make DESTDIR="${pkgdir}" install
  # Cleanup for a lib32 package
  rm -rf ${pkgdir}/usr/{include,lib32/cairomm*,share}
}
