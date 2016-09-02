pkgname=osvr-vive-libre-git
pkgver=0.1.81.e11bd47
pkgrel=1
pkgdesc="Free Software HTC Vive Driver for OSVR"
arch=('x86_64')
url="https://github.com/lubosz/OSVR-Vive-Libre"
license=('LGPLv3+')
makedepends=('git' 'cmake')
depends=('osvr-core-git' 'zlib' 'hidapi')
source=("osvr-vive::git+file:///home/bmonkey/workspace/vr/OSVR-Vive-Libre")
md5sums=('SKIP')


subver() {
  PREFIX="set (com_osvr_Vive_Libre_VERSION_$1"
  echo $(grep "$PREFIX" CMakeLists.txt | eval sed "'s/$PREFIX//'" | sed 's/)//')
}
 
pkgver() {
  cd "$srcdir/osvr-vive"
  hash=$(git log --pretty=format:'%h' -n 1)
  revision=$(git rev-list --count HEAD)
  echo $(subver MAJOR).$(subver MINOR).$revision.$hash
}

prepare() {
  cd osvr-vive
  mkdir -p "$srcdir/osvr-vive-build"
}

build() {
  cd osvr-vive-build
  cmake -DCMAKE_INSTALL_PREFIX=/usr/ \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib \
    -DCMAKE_BUILD_TYPE=Release \
    ../osvr-vive
  make
}

package() {
  cd osvr-vive-build
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
