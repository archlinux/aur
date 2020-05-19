pkgname=mingw-w64-metis
pkgver=5.1.0
pkgrel=1
pkgdesc='A set of serial programs for partitioning graphs, partitioning finite element meshes, and producing fill reducing orderings for sparse matrices (mingw-w64)'
url="http://glaros.dtc.umn.edu/gkhome/metis/metis/overview"
license=('custom')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake')
arch=('any')
options=('!buildflags' '!strip' 'staticlibs')
source=("http://glaros.dtc.umn.edu/gkhome/fetch/sw/metis/metis-${pkgver}.tar.gz")
sha256sums=('76faebe03f6c963127dbb73c13eab58c9a3faeae48779f049066a21c087c5db2')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare () {
  cd metis-$pkgver
  curl -L https://raw.githubusercontent.com/msys2/MINGW-packages/master/mingw-w64-metis/0001-mingw-w64-does-not-have-sys-resource-h.patch | patch -p1
  curl -L https://raw.githubusercontent.com/msys2/MINGW-packages/master/mingw-w64-metis/0002-mingw-w64-do-not-use-reserved-double-underscored-names.patch | patch -p1
  curl -L https://raw.githubusercontent.com/msys2/MINGW-packages/master/mingw-w64-metis/0003-WIN32-Install-RUNTIME-to-bin.patch | patch -p1
  curl -L https://raw.githubusercontent.com/msys2/MINGW-packages/master/mingw-w64-metis/0004-Fix-GKLIB_PATH-default-for-out-of-tree-builds.patch | patch -p1
}

build() {
  cd "${srcdir}"/metis-$pkgver
  for _arch in ${_architectures}; do
    for _shared in OFF ON; do
      mkdir -p build-${_arch}-${_shared} && pushd build-${_arch}-${_shared}
      ${_arch}-cmake -DSHARED=${_shared} ..
      make
      popd
    done
  done
}

package() {
  for _arch in ${_architectures}; do
    for _shared in OFF ON; do
      cd "${srcdir}"/metis-$pkgver/build-${_arch}-${_shared}
      make install DESTDIR="${pkgdir}"
    done
    rm "$pkgdir"/usr/${_arch}/bin/*.exe
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a  
  done
}
