pkgname=openmeca-git
pkgver=r29.3fabc05
pkgrel=1
pkgdesc="Simulating mechanical systems easily"
license=('GPL')
arch=('i686' 'x86_64')
url="https://gitlab.com/damien.andre/openmeca"
depends=('boost-libs' 'qwt' 'libqglviewer-qt4')
makedepends=('cmake')
source=("git+https://gitlab.com/damien.andre/openmeca.git")
sha1sums=('SKIP')

pkgver() {
  cd openmeca/SRC/OpenMeca
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd openmeca/SRC/OpenMeca
  # hardcoded
  grep -lr '#include "Boost/BUILD/include' .|xargs sed -i 's|#include "Boost/BUILD/include/|#include "|g'
  grep -lr '#include "QGLViewer/BUILD/include' .|xargs sed -i 's|#include "QGLViewer/BUILD/include/|#include "|g'

  sed -i 's|../QGLViewer/BUILD/lib/libQGLViewer.a|-lQGLViewer|g' BUILD.pro
  sed -i 's|../Boost/BUILD/lib/libboost_serialization.a|-lboost_serialization|g' BUILD.pro
  # seems it's a custom chronoengine version
#   sed -i 's|../ChronoEngine/BUILD/libchronoengine.a|-lChronoEngine|g' BUILD.pro
}

build() {
  cd openmeca/SRC/ChronoEngine
  qmake-qt4
  make
  cd -
  cd openmeca/SRC/OpenMeca
  lrelease-qt4 ./BUILD.pro
  qhelpgenerator-qt4 ./Help/Help.qhp -o ./Help/Help.qch
  qcollectiongenerator-qt4 ./Help/Help.qhcp -o ./Help/Help.qhc
  qmake-qt4
  make
}

package() {
  cd openmeca/SRC/OpenMeca
#   make DESTDIR="$pkgdir" install
  install -d "$pkgdir"/usr/bin
  install -m755 BUILD/openmeca "$pkgdir"/usr/bin
}

