
pkgname=mingw-w64-openmesh
pkgver=3.3
pkgrel=1
pkgdesc="A generic and efficient data structure for representing and manipulating polygonal meshes (mingw-w64)"
arch=('any')
url="http://www.openmesh.org"
license=('custom')
depends=('mingw-w64-crt')
makedepends=(mingw-w64-cmake)
options=('!buildflags' '!strip' 'staticlibs')
source=("http://www.openmesh.org/media/Releases/${pkgver}/OpenMesh-${pkgver}.tar.bz2")
md5sums=('7c4cb02e7218f847e2420e3d43a04981')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "$srcdir"/OpenMesh-${pkgver}
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake \
      -DCMAKE_BUILD_TYPE=Release \
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
    #${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
  # install licenses
  install -D -m644 "$srcdir"/OpenMesh-${pkgver}/LICENSE/COPYING \
      "${pkgdir}"/usr/share/licenses/${pkgname}/COPYING
  install -D -m644 "$srcdir"/OpenMesh-${pkgver}/LICENSE/COPYING.EXCEPTIONS \
      "${pkgdir}"/usr/share/licenses/${pkgname}/COPYING.EXCEPTIONS
  install -D -m644 "$srcdir"/OpenMesh-${pkgver}/LICENSE/COPYING.LESSER \
      "${pkgdir}"/usr/share/licenses/${pkgname}/COPYING.LESSER
  install -D -m644 "$srcdir"/OpenMesh-${pkgver}/LICENSE/LICENSEHEADER \
      "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSEHEADER
}

