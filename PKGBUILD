pkgname=mingw-w64-med
pkgver=4.1.1
pkgrel=1
pkgdesc='Modelisation et Echanges de Donnees, i.e. Data Modelization and Exchanges - code-aster exchange module linked to hdf5'
arch=('any')
url='https://www.salome-platform.org/downloads'
license=('LGPL')
depends=('mingw-w64-hdf5')
makedepends=('mingw-w64-cmake')
options=('!buildflags' '!strip' 'staticlibs')
source=("https://files.salome-platform.org/Salome/other/med-${pkgver}.tar.gz")
sha256sums=('dc2b5d54ebf0666e3ff2e974041d2ab0da906061323537023ab165d573389dd0')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}/med-${pkgver}_SRC"
  curl -L https://raw.githubusercontent.com/archlinux/svntogit-community/packages/med/trunk/hdf5-1.12.patch | patch -p1
  sed -i "s|Lmcons.h|lmcons.h|g" src/2.3.6/ci/MEDunvCr.c src/ci/MEDmeshUniversalNameWr.c
}

build() {
  cd "${srcdir}/med-${pkgver}_SRC"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    CPPFLAGS="-DH5_USE_110_API" ${_arch}-cmake -DMEDFILE_BUILD_TESTS=OFF -DMEDFILE_INSTALL_DOC=OFF ..
    make
    popd
  done
}

package() {
  for _arch in $_architectures; do
    cd "$srcdir"/med-${pkgver}_SRC/build-${_arch}
    make install DESTDIR="$pkgdir"
    rm "$pkgdir"/usr/${_arch}/bin/*.exe
    mv "$pkgdir"/usr/${_arch}/lib/*.dll "$pkgdir"/usr/${_arch}/bin
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
