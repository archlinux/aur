
pkgname=mingw-w64-openmesh
pkgver=7.1
pkgrel=1
pkgdesc="A generic and efficient data structure for representing and manipulating polygonal meshes (mingw-w64)"
arch=('any')
url="http://www.openmesh.org"
license=('BSD')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake')
options=('!buildflags' '!strip' 'staticlibs')
source=("http://www.openmesh.org/media/Releases/${pkgver}/OpenMesh-${pkgver}.tar.bz2")
sha256sums=('71cd5eb25893b0369ac766bb8305a525ffbb39b7f796d2878c7f9b8e0827cbac')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare () {
  cd "$srcdir"/OpenMesh-${pkgver}
}

build() {
  cd "$srcdir"/OpenMesh-${pkgver}
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake \
      -DOPENMESH_BUILD_SHARED=ON \
      -DBUILD_APPS=OFF \
      ..
    make
    popd
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

