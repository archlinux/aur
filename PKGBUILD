# Maintainer: maisvendoo <maisvendoo@gmail.com>
# Contributor: jmf <jmf at mesecons dot net>

pkgname=openscenegraph-dev
pkgver=3.7.0
_pkgver=3.7.0
pkgrel=1
pkgdesc="Development version of open source, high performance real-time graphics toolkit OpenSceneGraph"
arch=('x86_64')
url="http://www.openscenegraph.org"
license=('custom:OSGPL')
depends=('giflib' 'jasper' 'librsvg' 'xine-lib' 'curl' 'pth')
makedepends=('cmake' 'libvncserver' 'qt5-base' 'ffmpeg' 'mesa')
optdepends=('libvncserver' 'gdal' 'openexr' 'poppler-glib' 'qt5-base' 'ffmpeg')
provides=('openscenegraph' 'openthreads')
conflicts=('openscenegraph' 'openthreads')
source=("openscenegraph::git+https://github.com/openscenegraph/OpenSceneGraph.git#branch=master")
sha256sums=('SKIP')
options=(!strip)

prepare() {
  mkdir -p "${srcdir}/build-debug"
  mkdir -p "${srcdir}/build-release"
}

build() {
  cd "${srcdir}/build-debug"
  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIBRARY_OUTPUT_PATH=/usr/lib \
    -DCMAKE_BUILD_TYPE=Debug ../openscenegraph
    
  make  -j8  
  
  cd "${srcdir}/build-release"  
  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIBRARY_OUTPUT_PATH=/usr/lib \
    -DCMAKE_BUILD_TYPE=Release  ../openscenegraph
    
    make -j8
}

package(){
  cd "${srcdir}/build-debug"
  make DESTDIR="$pkgdir" install
  
  cd "${srcdir}/build-release"
  make DESTDIR="$pkgdir" install  
  
  mv "${pkgdir}/usr/lib64" "${pkgdir}/usr/lib"
}
