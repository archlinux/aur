pkgname=mingw-w64-metis
pkgver=5.1.0.p11
_pkgver=5.1.0-p11
pkgrel=1
pkgdesc='A set of serial programs for partitioning graphs, partitioning finite element meshes, and producing fill reducing orderings for sparse matrices (mingw-w64)'
url="http://glaros.dtc.umn.edu/gkhome/metis/metis/overview"
license=('custom')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake')
arch=('any')
options=('!buildflags' '!strip' 'staticlibs')
source=($pkgname-$pkgver.tar.bz2::https://bitbucket.org/petsc/pkg-metis/get/v$_pkgver.tar.bz2)
sha256sums=('c2d5eb5a731335a2d7168eedcf2b683b990492b5ffceab1eedc2acbb7a422ff0')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare () {
  mv petsc-pkg-metis-* metis-$_pkgver
  cd metis-$_pkgver
  curl -L https://raw.githubusercontent.com/msys2/MINGW-packages/master/mingw-w64-metis/0003-WIN32-Install-RUNTIME-to-bin.patch | patch -p1
}

build() {
  cd "${srcdir}"/metis-$_pkgver
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
      cd "${srcdir}"/metis-$_pkgver/build-${_arch}-${_shared}
      make install DESTDIR="${pkgdir}"
    done
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a  
  done
}
