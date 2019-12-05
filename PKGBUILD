
pkgname=mingw-w64-vtk
_majordotminor=8.2
pkgver=${_majordotminor}.0
pkgrel=1
pkgdesc='A software system for 3D computer graphics, image processing, and visualization (mingw-w64)'
arch=('any')
url='http://www.vtk.org/'
license=('BSD')
depends=('mingw-w64-crt' 'mingw-w64-qt5-base' 'mingw-w64-jsoncpp' 'mingw-w64-expat' 'mingw-w64-netcdf' 'mingw-w64-libtiff' 'mingw-w64-libjpeg-turbo' 'mingw-w64-freetype2' 'mingw-w64-libpng' 'mingw-w64-libxml2' 'mingw-w64-hdf5' 'mingw-w64-libtheora' 'mingw-w64-freeglut' 'mingw-w64-lz4' 'mingw-w64-glew' 'mingw-w64-double-conversion' 'mingw-w64-pugixml')
makedepends=('mingw-w64-cmake')
options=('!buildflags' 'staticlibs' '!strip')
source=("http://www.vtk.org/files/release/${_majordotminor}/VTK-${pkgver}.tar.gz")
sha256sums=('34c3dc775261be5e45a8049155f7228b6bd668106c72a3c435d95730d17d57bb')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}/VTK-${pkgver}"
  # fix libharu export
  sed -i "s|WIN32 AND NOT CYGWIN|MSVC|g" ThirdParty/libharu/vtklibharu/src/CMakeLists.txt
}


build() {
  cd "${srcdir}/VTK-${pkgver}"

  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake \
      -DVTK_USE_SYSTEM_LIBRARIES=ON \
      -DVTK_USE_SYSTEM_LIBPROJ=OFF \
      -DVTK_USE_SYSTEM_GL2PS=OFF \
      -DVTK_USE_SYSTEM_LIBHARU=OFF \
      -DHDF5_ROOT=/usr/${_arch}/ \
      ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir/VTK-${pkgver}/build-${_arch}"
    make install DESTDIR="$pkgdir"
    rm -r "$pkgdir"/usr/${_arch}/share
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
