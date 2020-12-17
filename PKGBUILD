
pkgname=mingw-w64-vtk-git
pkgver=r74318.228dc61c43
pkgrel=1
pkgdesc='A software system for 3D computer graphics, image processing, and visualization (mingw-w64)'
arch=('any')
url='http://www.vtk.org/'
license=('BSD')
depends=('mingw-w64-crt' 'mingw-w64-qt5-base' 'mingw-w64-jsoncpp' 'mingw-w64-expat' 'mingw-w64-netcdf' 'mingw-w64-libtiff' 'mingw-w64-libjpeg-turbo' 'mingw-w64-freetype2' 'mingw-w64-libpng' 'mingw-w64-libxml2' 'mingw-w64-hdf5' 'mingw-w64-freeglut' 'mingw-w64-lz4' 'mingw-w64-proj' 'mingw-w64-double-conversion' 'mingw-w64-glew' 'mingw-w64-pugixml' 'mingw-w64-libtheora' 'mingw-w64-gl2ps' 'mingw-w64-cgns')
makedepends=('git' 'mingw-w64-cmake' 'mingw-w64-eigen' 'mingw-w64-utf8cpp' 'mingw-w64-wine' 'mingw-w64-pegtl')
provides=('mingw-w64-vtk')
conflicts=('mingw-w64-vtk')
options=('!buildflags' 'staticlibs' '!strip')
source=("git+https://gitlab.kitware.com/vtk/vtk.git")
sha256sums=('SKIP')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

pkgver () {
  cd "${srcdir}/vtk"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/vtk"
}

build() {
  cd "${srcdir}/vtk"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake \
      -DCMAKE_BUILD_TYPE=Release \
      -DVTK_DATA_EXCLUDE_FROM_ALL=ON -DVTK_DATA_EXCLUDE_FROM_ALL_NO_WARNING=ON \
      -DVTK_USE_EXTERNAL=ON \
      -DVTK_MODULE_USE_EXTERNAL_VTK_libharu=OFF \
      -DVTK_BUILD_TESTING=OFF \
      ..
    WINEPATH="/usr/${_arch}/bin;${PWD}/bin" make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir/vtk/build-${_arch}"
    LD_PRELOAD="" make install DESTDIR="$pkgdir"
    rm -r "$pkgdir"/usr/${_arch}/share
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
