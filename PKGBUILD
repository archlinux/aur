
pkgname=mingw-w64-vtk
_majordotminor=8.1
pkgver=${_majordotminor}.1
pkgrel=1
pkgdesc='A software system for 3D computer graphics, image processing, and visualization (mingw-w64)'
arch=('any')
url='http://www.vtk.org/'
license=('BSD')
depends=('mingw-w64-crt' 'mingw-w64-qt5-base' 'mingw-w64-jsoncpp' 'mingw-w64-expat' 'mingw-w64-netcdf' 'mingw-w64-libtiff' 'mingw-w64-libjpeg-turbo' 'mingw-w64-freetype2' 'mingw-w64-libpng' 'mingw-w64-libxml2' 'mingw-w64-hdf5' 'mingw-w64-libtheora' 'mingw-w64-freeglut' 'mingw-w64-lz4')
makedepends=('mingw-w64-cmake')
options=('!buildflags' 'staticlibs' '!strip')
source=("http://www.vtk.org/files/release/${_majordotminor}/VTK-${pkgver}.tar.gz"
        typo-glh.patch)
sha256sums=('71a09b4340f0a9c58559fe946dc745ab68a866cf20636a41d97b6046cb736324'
            '10e7824fbbc1874f4c192a34d735e149723b556bf318bf05b3e5506bce638206')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}/VTK-${pkgver}"
  # fix libharu export
  sed -i "s|WIN32 AND NOT CYGWIN|MSVC|g" ThirdParty/libharu/vtklibharu/src/CMakeLists.txt

  # https://gitlab.kitware.com/vtk/vtk/merge_requests/4016
  patch -p1 -i "${srcdir}"/typo-glh.patch
}


build() {
  cd "${srcdir}/VTK-${pkgver}"

  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake \
      -DVTK_USE_SYSTEM_LIBRARIES=ON \
      -DVTK_USE_SYSTEM_LIBPROJ4=OFF \
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
