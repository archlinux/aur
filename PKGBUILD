pkgname=mingw-w64-vtk
pkgver=9.2.2
pkgrel=1
pkgdesc='A software system for 3D computer graphics, image processing, and visualization (mingw-w64)'
arch=('any')
url='http://www.vtk.org/'
license=('BSD')
depends=('mingw-w64-crt' 'mingw-w64-qt5-base' 'mingw-w64-jsoncpp' 'mingw-w64-expat' 'mingw-w64-netcdf' 'mingw-w64-libtiff' 'mingw-w64-libjpeg-turbo' 'mingw-w64-freetype2' 'mingw-w64-libpng' 'mingw-w64-libxml2' 'mingw-w64-hdf5' 'mingw-w64-libtheora' 'mingw-w64-freeglut' 'mingw-w64-lz4' 'mingw-w64-glew' 'mingw-w64-double-conversion' 'mingw-w64-pugixml' 'mingw-w64-gl2ps' 'mingw-w64-proj' 'mingw-w64-libharu')
makedepends=('mingw-w64-cmake' 'mingw-w64-eigen' 'mingw-w64-utf8cpp' 'mingw-w64-pegtl2')
options=('!buildflags' 'staticlibs' '!strip')
source=("https://www.vtk.org/files/release/${pkgver:0:3}/VTK-${pkgver}.tar.gz")
sha256sums=('1c5b0a2be71fac96ff4831af69e350f7a0ea3168981f790c000709dcf9121075')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}/VTK-${pkgver}"
}

build() {
  cd "${srcdir}/VTK-${pkgver}"

  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake \
      -DCMAKE_BUILD_TYPE=Release \
      -DVTK_USE_EXTERNAL=ON \
      -DVTK_BUILD_TESTING=OFF \
      -DVTK_MODULE_USE_EXTERNAL_VTK_ioss=OFF \
      -DVTK_MODULE_USE_EXTERNAL_VTK_fmt=OFF \
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
