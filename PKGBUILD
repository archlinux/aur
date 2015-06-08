
pkgname=mingw-w64-openexr
pkgver=2.2.0
pkgrel=1
pkgdesc="An high dynamic-range image file format library (mingw-w64)"
url="http://www.openexr.com/"
arch=(any)
license=('BSD')
depends=('mingw-w64-crt' 'mingw-w64-zlib' 'mingw-w64-ilmbase')
makedepends=('mingw-w64-configure')
options=('staticlibs' '!buildflags' '!strip')
source=("http://download.savannah.nongnu.org/releases/openexr/openexr-${pkgver}.tar.gz" openexr-2.1.0_aligned-malloc.patch openexr-2.1.0_cast.patch)
md5sums=('b64e931c82aa3790329c21418373db4e' SKIP SKIP)

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}/openexr-${pkgver}"
  # fedora patches
  patch -p1 -i "${srcdir}"/openexr-2.1.0_aligned-malloc.patch
  patch -p1 -i "${srcdir}"/openexr-2.1.0_cast.patch

  # https://github.com/openexr/openexr/pull/159
  sed -i "s|COMMAND \${CMAKE_CURRENT_BINARY_DIR}/\${CMAKE_CFG_INTDIR}/b44ExpLogTable >|COMMAND wine \${CMAKE_CURRENT_BINARY_DIR}/\${CMAKE_CFG_INTDIR}/b44ExpLogTable.exe >|g" IlmImf/CMakeLists.txt
  sed -i "s|COMMAND \${CMAKE_CURRENT_BINARY_DIR}/\${CMAKE_CFG_INTDIR}/dwaLookups >|COMMAND wine \${CMAKE_CURRENT_BINARY_DIR}/\${CMAKE_CFG_INTDIR}/dwaLookups.exe >|g" IlmImf/CMakeLists.txt
}

build() {
  cd "${srcdir}/openexr-${pkgver}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake -DNAMESPACE_VERSIONING=OFF -DILMBASE_PACKAGE_PREFIX=/usr/${_arch} ..
    cp /usr/${_arch}/bin/*.dll IlmImf
    make VERBOSE=1
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
    rm "$pkgdir"/usr/${_arch}/bin/*.exe
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
