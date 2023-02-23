pkgname=mingw-w64-paraview510
pkgver=5.10.1
pkgrel=1
pkgdesc='Parallel Visualization Application using VTK (mingw-w64)'
arch=('any')
url='https://www.paraview.org'
license=('custom')
depends=('mingw-w64-qt5-tools' 'mingw-w64-qt5-svg' 'mingw-w64-boost' 'mingw-w64-glew' 'mingw-w64-freetype2' 'mingw-w64-libxml2' 'mingw-w64-libtiff' 'mingw-w64-jsoncpp' 'mingw-w64-hdf5' 'mingw-w64-lz4' 'mingw-w64-cgns' 'mingw-w64-netcdf' 'mingw-w64-double-conversion' 'mingw-w64-protobuf' 'mingw-w64-libtheora' 'mingw-w64-pugixml' 'mingw-w64-gl2ps' 'mingw-w64-libharu')
makedepends=('mingw-w64-cmake' 'mingw-w64-eigen' 'mingw-w64-utf8cpp' 'mingw-w64-cli11' 'mingw-w64-exprtk' 'mingw-w64-wine' 'protobuf')
provides=('mingw-w64-paraview')
conflicts=('mingw-w64-paraview')
options=('!buildflags' '!strip' 'staticlibs')
source=("${url}/files/v${pkgver:0:4}/ParaView-v${pkgver}.tar.xz")
sha256sums=('520e3cdfba4f8592be477314c2f6c37ec73fb1d5b25ac30bdbd1c5214758b9c2')

_architectures="x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}/ParaView-v${pkgver}"
  # libharu 2.4.0
  curl -L https://gitlab.kitware.com/vtk/vtk/-/commit/c8b27677ee410233.patch | patch -p1 -d VTK
  # _isatty
  curl -L https://github.com/gsjaardema/seacas/commit/175e2ecf.patch | patch -p6 -d VTK/ThirdParty/ioss/vtkioss
  # disable pluginxs xml
  sed -i "s|_paraview_add_plugin_XML_DOCUMENTATION ON|_paraview_add_plugin_XML_DOCUMENTATION OFF|g" CMake/ParaViewPlugin.cmake
  sed -i "s|NOT _paraview_add_plugin_XML_DOCUMENTATION|FALSE|g" CMake/ParaViewPlugin.cmake
  # https://gitlab.kitware.com/paraview/paraview/-/issues/21442
  curl -L https://github.com/sandialabs/seacas/commit/5e1b1918.patch | patch -p5 -d VTK/ThirdParty/exodusII/vtkexodusII || true
  # plot fixes
  curl -L https://gitlab.kitware.com/paraview/paraview/-/merge_requests/5616.patch | patch -p1
  curl -L https://gitlab.kitware.com/paraview/paraview/-/commit/21389980b7183439a1b193a03fc0fed6915bcb44.patch | patch -p1
  curl -L https://gitlab.kitware.com/vtk/vtk/-/merge_requests/9227.patch | patch -p1 -d VTK
  curl -L https://gitlab.kitware.com/vtk/vtk/-/merge_requests/9228.patch | patch -p1 -d VTK
  sed -i '28i#include "vtkDataSetAttributes.h"' VTK/Charts/Core/vtkScatterPlotMatrix.cxx
  curl -L https://gitlab.kitware.com/vtk/vtk/-/merge_requests/9711.patch | patch -p1 -d VTK
}

build() {
  cd "${srcdir}/ParaView-v${pkgver}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake \
      -DCMAKE_BUILD_TYPE=Release \
      -DPARAVIEW_USE_PYTHON=OFF \
      -DPARAVIEW_ENABLE_EMBEDDED_DOCUMENTATION=OFF \
      -DPARAVIEW_USE_VTKM=OFF \
      -DPARAVIEW_BUILD_WITH_EXTERNAL=ON \
      -DVTK_MODULE_USE_EXTERNAL_VTK_exprtk=OFF \
      -DVTK_MODULE_USE_EXTERNAL_VTK_ioss=OFF \
      -DVTK_MODULE_USE_EXTERNAL_VTK_fmt=OFF \
      -DVTK_MODULE_USE_EXTERNAL_ParaView_vtkcatalyst=OFF \
      -DVTK_QT_VERSION=5 \
      ..
    WINEPATH="/usr/${_arch}/bin;${PWD}/bin" make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir"/ParaView-v${pkgver}/build-${_arch}
    make install/fast DESTDIR="$pkgdir"
    rm -r "$pkgdir"/usr/${_arch}/share
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
