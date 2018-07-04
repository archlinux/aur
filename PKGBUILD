# Maintainer: drakkan <nicola.murino at gmail dot com>
# Contributor: drakkan <nicola.murino at gmail dot com>

pkgname="mingw-w64-kdsoap"
pkgver=1.7.0
pkgrel=2
pkgdesc="Qt-based client-side and server-side SOAP component (mingw-w64)"
arch=('any')
license=('GPL3' 'LGPL' 'custom')
url='https://github.com/KDAB/KDSoap'
options=('!buildflags' 'staticlibs' '!strip')
depends=('mingw-w64-qt5-base')
makedepends=('mingw-w64-cmake')

source=("https://github.com/KDAB/KDSoap/releases/download/kdsoap-${pkgver}/kdsoap-${pkgver}.tar.gz")
sha256sums=('c13cd01cc576e22d51f2cd336f1473894a3c78ce5300ceaa23b20420f99234bd')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}/kdsoap-${pkgver}"
  sed -i 's/add_subdirectory(examples)//g' CMakeLists.txt
}

build() { 
  unset LDFLAGS
  cd "$srcdir/kdsoap-$pkgver/"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake ..
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
