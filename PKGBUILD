# Maintainer: drakkan <nicola.murino@gmail.com>
# Contributor: drakkan <nicola.murino@gmail.com>

pkgname="mingw-w64-kdsoap"
pkgver=1.5.1
pkgrel=1
pkgdesc="Qt-based client-side and server-side SOAP component (mingw-w64)"
arch=('any')
license=('GPL3' 'LGPL' 'custom')
url='https://github.com/KDAB/KDSoap'
options=('!buildflags' 'staticlibs' '!strip')
depends=('mingw-w64-qt5-base')
makedepends=('mingw-w64-cmake')

source=("https://github.com/KDAB/KDSoap/releases/download/kdsoap-${pkgver}/kdsoap-${pkgver}.tar.gz")
sha256sums=('fc4506a91db59aef33aadba9fa828c59047ac7bfdd13a23fe4ba7b66450d4844')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}/kdsoap-${pkgver}"
  sed -i 's/\-ansi//g' g++.pri
  sed -i 's/add_subdirectory(examples)//g' CMakeLists.txt
}

build() { 
  unset LDFLAGS
  cd "$srcdir/kdsoap-$pkgver/"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake \
      -DCMAKE_BUILD_TYPE=Release \
      ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/kdsoap-$pkgver/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    find "${pkgdir}/usr/${_arch}" -name "*.exe" -exec ${_arch}-strip --strip-all {} \;
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}

# vim: ts=2 sw=2 et:
