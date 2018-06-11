
pkgname=mingw-w64-openexr
pkgver=2.2.1
pkgrel=1
pkgdesc="An high dynamic-range image file format library (mingw-w64)"
url="http://www.openexr.com/"
arch=(any)
license=('BSD')
depends=('mingw-w64-crt' 'mingw-w64-zlib' 'mingw-w64-ilmbase')
makedepends=('mingw-w64-cmake' 'wine')
options=('staticlibs' '!buildflags' '!strip')
source=("http://download.savannah.gnu.org/releases/openexr/openexr-${pkgver}.tar.gz"
        openexr-2.1.0_aligned-malloc.patch
        openexr-2.1.0_cast.patch)
sha256sums=('8f9a5af6131583404261931d9a5c83de0a425cb4b8b25ddab2b169fbf113aecd'
        SKIP
        SKIP)

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}/openexr-${pkgver}"
  # fedora patches
  patch -p1 -i "${srcdir}"/openexr-2.1.0_aligned-malloc.patch
  patch -p1 -i "${srcdir}"/openexr-2.1.0_cast.patch

  # https://github.com/openexr/openexr/pull/159
  sed -i "s|COMMAND \${CMAKE_CURRENT_BINARY_DIR}/\${CMAKE_CFG_INTDIR}/b44ExpLogTable >|COMMAND wine \${CMAKE_CURRENT_BINARY_DIR}/\${CMAKE_CFG_INTDIR}/b44ExpLogTable.exe >|g" IlmImf/CMakeLists.txt
  sed -i "s|COMMAND \${CMAKE_CURRENT_BINARY_DIR}/\${CMAKE_CFG_INTDIR}/dwaLookups >|COMMAND wine \${CMAKE_CURRENT_BINARY_DIR}/\${CMAKE_CFG_INTDIR}/dwaLookups.exe >|g" IlmImf/CMakeLists.txt


  sed -i "/ADD_SUBDIRECTORY ( IlmImfTest )/d" CMakeLists.txt
  sed -i "/ADD_SUBDIRECTORY ( IlmImfUtilTest )/d" CMakeLists.txt
  sed -i "/ADD_SUBDIRECTORY ( IlmImfFuzzTest )/d" CMakeLists.txt
  sed -i "/ADD_SUBDIRECTORY ( exr/d" CMakeLists.txt # binaries/utilities
}

build() {
  cd "${srcdir}/openexr-${pkgver}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake -DNAMESPACE_VERSIONING=OFF -DILMBASE_PACKAGE_PREFIX=/usr/${_arch} ..
    cp /usr/${_arch}/bin/*.dll IlmImf
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/openexr-${pkgver}/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    install -d "$pkgdir"/usr/${_arch}/bin
    mv "$pkgdir"/usr/${_arch}/lib/*.dll "$pkgdir"/usr/${_arch}/bin
    rm -r "$pkgdir"/usr/${_arch}/share
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
