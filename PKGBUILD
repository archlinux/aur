
pkgname=mingw-w64-openmesh
pkgver=6.3
pkgrel=1
pkgdesc="A generic and efficient data structure for representing and manipulating polygonal meshes (mingw-w64)"
arch=('any')
url="http://www.openmesh.org"
license=('BSD')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake')
options=('!buildflags' '!strip' 'staticlibs')
source=("http://www.openmesh.org/media/Releases/${pkgver}/OpenMesh-${pkgver}.tar.bz2")
sha1sums=('c749ee7c9c1cbfad2d53a8cf43e8a9f77de6f7cd')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare () {
  cd "$srcdir"/OpenMesh-${pkgver}

  # https://www.graphics.rwth-aachen.de:9000/OpenMesh/OpenMesh/merge_requests/72
  sed -i "s|WIN32 AND NOT MINGW|WIN32|g" src/OpenMesh/Core/CMakeLists.txt
}

build() {
  cd "$srcdir"/OpenMesh-${pkgver}
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake \
      -DCMAKE_BUILD_TYPE=Release \
      -DOPENMESH_BUILD_SHARED=ON \
      -DOPENMESH_BUILD_PYTHON_BINDINGS=OFF \
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

  # install licenses
  install -D -m644 "$srcdir"/OpenMesh-${pkgver}/LICENSE \
    "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}

