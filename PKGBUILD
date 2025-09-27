pkgname=mingw-w64-vtk
pkgver=9.5.2
pkgrel=1
pkgdesc='A software system for 3D computer graphics, image processing, and visualization (mingw-w64)'
arch=('any')
url='http://www.vtk.org/'
license=('BSD')
depends=('mingw-w64-crt' 'mingw-w64-qt5-base' 'mingw-w64-qt5-tools' 'mingw-w64-qt5-svg' 'mingw-w64-jsoncpp' 'mingw-w64-expat' 'mingw-w64-netcdf' 'mingw-w64-libtiff' 'mingw-w64-libjpeg-turbo' 'mingw-w64-freetype2' 'mingw-w64-libpng' 'mingw-w64-libxml2' 'mingw-w64-hdf5' 'mingw-w64-libtheora' 'mingw-w64-freeglut' 'mingw-w64-lz4' 'mingw-w64-double-conversion' 'mingw-w64-pugixml' 'mingw-w64-gl2ps' 'mingw-w64-proj' 'mingw-w64-libharu' 'mingw-w64-cgns' 'mingw-w64-verdict')
makedepends=('mingw-w64-cmake' 'mingw-w64-wine' 'mingw-w64-boost')
options=('!buildflags' 'staticlibs' '!strip')
source=("https://www.vtk.org/files/release/${pkgver:0:3}/VTK-${pkgver}.tar.gz")
sha256sums=('cee64b98d270ff7302daf1ef13458dff5d5ac1ecb45d47723835f7f7d562c989')

_architectures="x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}/VTK-${pkgver}"
}

build() {
  cd "${srcdir}/VTK-${pkgver}"
  for _arch in ${_architectures}; do
    ${_arch}-cmake \
      -DCMAKE_BUILD_TYPE=Release \
      -DVTK_USE_EXTERNAL=ON \
      -DVTK_BUILD_TESTING=OFF \
      -DVTK_QT_VERSION=5 \
      -DVTK_MODULE_USE_EXTERNAL_VTK_cli11=OFF \
      -DVTK_MODULE_USE_EXTERNAL_VTK_ioss=OFF \
      -DVTK_MODULE_USE_EXTERNAL_VTK_eigen=OFF \
      -DVTK_MODULE_USE_EXTERNAL_VTK_exprtk=OFF \
      -DVTK_MODULE_USE_EXTERNAL_VTK_fmt=OFF \
      -DVTK_MODULE_USE_EXTERNAL_VTK_fast_float=OFF \
      -DVTK_MODULE_USE_EXTERNAL_VTK_nlohmannjson=OFF \
      -DVTK_MODULE_USE_EXTERNAL_VTK_pegtl=OFF \
      -DVTK_MODULE_USE_EXTERNAL_VTK_token=OFF \
      -DVTK_MODULE_USE_EXTERNAL_VTK_utf8=OFF \
      -DVTK_MODULE_ENABLE_VTK_GUISupportQt=YES \
      -DVTK_MODULE_ENABLE_VTK_cli11=YES \
      -DVTK_MODULE_ENABLE_VTK_FiltersParallelStatistics=YES \
      -DVTK_MODULE_ENABLE_VTK_FiltersParallelVerdict=YES \
      -DVTK_MODULE_ENABLE_VTK_FiltersParallelDIY2=YES \
      -DVTK_MODULE_ENABLE_VTK_IOAvmesh=YES \
      -DVTK_MODULE_ENABLE_VTK_IOH5part=YES \
      -DVTK_MODULE_ENABLE_VTK_IOH5Rage=YES \
      -DVTK_MODULE_ENABLE_VTK_IOOMF=YES \
      -DVTK_MODULE_ENABLE_VTK_IOParallelExodus=YES \
      -DVTK_MODULE_ENABLE_VTK_IOParallelLSDyna=YES \
      -DVTK_MODULE_ENABLE_VTK_IOPIO=YES \
      -DVTK_MODULE_ENABLE_VTK_IOTRUCHAS=YES \
      -DVTK_MODULE_ENABLE_VTK_IOVPIC=YES \
      -DVTK_MODULE_ENABLE_VTK_IOXdmf2=YES \
      -DVTK_MODULE_ENABLE_VTK_RenderingParallel=YES \
      -DVTK_MODULE_ENABLE_VTK_RenderingVolumeAMR=YES \
      -B build-${_arch} .
    make -C build-${_arch}
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir/VTK-${pkgver}/build-${_arch}"
    make install/fast DESTDIR="$pkgdir"
    rm -r "$pkgdir"/usr/${_arch}/share
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
