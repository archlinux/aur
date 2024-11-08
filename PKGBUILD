pkgname=mingw-w64-openmesh
pkgver=11.0.0
pkgrel=1
pkgdesc="A generic and efficient data structure for representing and manipulating polygonal meshes (mingw-w64)"
arch=('any')
url="http://www.openmesh.org"
license=('BSD')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake')
options=('!buildflags' '!strip' 'staticlibs')
source=("https://www.graphics.rwth-aachen.de/media/openmesh_static/Releases/11.0/OpenMesh-${pkgver}.tar.bz2")
sha256sums=('9d22e65bdd6a125ac2043350a019ec4346ea83922cafdf47e125a03c16f6fa07')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare () {
  cd "$srcdir"/OpenMesh-${pkgver}
  sed -i "s|libdata|lib|g" CMakeLists.txt
}

build() {
  cd "$srcdir"/OpenMesh-${pkgver}
  for _arch in ${_architectures}; do
    ${_arch}-cmake -DOPENMESH_BUILD_SHARED=ON \
      -DBUILD_APPS=OFF -DOPENMESH_DOCS=OFF \
      -B build-${_arch} .
    make -C build-${_arch}
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir"/OpenMesh-${pkgver}/build-${_arch}
    make DESTDIR="${pkgdir}" install
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}

