# Contributor: Jesse Juhani Jaara <gmail.com: jesse.jaara>

pkgname=mingw-w64-pugixml
pkgver=1.8
pkgrel=1
pkgdesc="Light-weight, simple and fast XML parser for C++ with XPath support (mingw-w64)"
arch=('any')
url="http://pugixml.org/"
license=('MIT')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake')
options=('!buildflags' 'staticlibs' '!strip')
source=("http://github.com/zeux/pugixml/releases/download/v${pkgver}/pugixml-${pkgver}.tar.gz")
sha256sums=('8ef26a51c670fbe79a71e9af94df4884d5a4b00a2db38a0608a87c14113b2904')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "${srcdir}/pugixml-${pkgver}"
  for _arch in ${_architectures}; do

    mkdir -p build-${_arch}-static && pushd build-${_arch}-static
    ${_arch}-cmake \
      -DLIB_INSTALL_DIR=lib \
      -DBUILD_SHARED_LIBS=OFF \
      ..
    make
    popd

    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake \
      -DLIB_INSTALL_DIR=lib \
      ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/pugixml-${pkgver}/build-${_arch}-static"
    make install DESTDIR="$pkgdir"
    
    cd "${srcdir}/pugixml-${pkgver}/build-${_arch}"
    make install DESTDIR="$pkgdir"

    ${_arch}-strip --strip-unneeded "${pkgdir}"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "${pkgdir}"/usr/${_arch}/lib/*.a
  done
}
