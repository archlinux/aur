pkgname=mingw-w64-med
pkgver=4.1.0
pkgrel=1
pkgdesc='Modelisation et Echanges de Donnees, i.e. Data Modelization and Exchanges - code-aster exchange module linked to hdf5'
arch=('any')
url='https://www.salome-platform.org/downloads'
license=('LGPL')
depends=('mingw-w64-hdf5')
makedepends=('mingw-w64-cmake')
options=('!buildflags' '!strip' 'staticlibs')
source=("https://files.salome-platform.org/Salome/other/med-${pkgver}.tar.gz")
sha256sums=('847db5d6fbc9ce6924cb4aea86362812c9a5ef6b9684377e4dd6879627651fce')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}/med-${pkgver}"
  curl -L https://gist.githubusercontent.com/jedbrown/527ef81ff59a0dccf833da40fdd15a47/raw/7482f9a42fdd277f5f9cf0167ea7a3381032ca7a/hdf5-1.12.patch | patch -p1
  sed -i 's/if H5_VERS_MINOR > 10/if 0/g' src/ci/MEDfileCompatibility.c
  sed -i "s|Lmcons.h|lmcons.h|g" src/2.3.6/ci/MEDunvCr.c src/ci/MEDmeshUniversalNameWr.c
}

build() {
  cd "${srcdir}/med-${pkgver}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    CPPFLAGS="-DH5_USE_110_API" ${_arch}-cmake -DMEDFILE_BUILD_TESTS=OFF -DMEDFILE_INSTALL_DOC=OFF ..
    make
    popd
  done
}

package() {
  for _arch in $_architectures; do
    cd "$srcdir"/med-${pkgver}/build-${_arch}
    make install DESTDIR="$pkgdir"
    rm "$pkgdir"/usr/${_arch}/bin/*.exe
    mv "$pkgdir"/usr/${_arch}/lib/*.dll "$pkgdir"/usr/${_arch}/bin
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
