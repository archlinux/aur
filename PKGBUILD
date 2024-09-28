pkgname=mingw-w64-paraview-qt6
pkgver=5.13.1
pkgrel=1
pkgdesc='Parallel Visualization Application using VTK (mingw-w64)'
arch=('any')
url='https://www.paraview.org'
license=('custom')
depends=('mingw-w64-qt6-tools' 'mingw-w64-qt6-svg' 'mingw-w64-qt6-5compat' 'mingw-w64-boost' 'mingw-w64-glew' 'mingw-w64-freetype2' 'mingw-w64-libxml2' 'mingw-w64-libtiff' 'mingw-w64-jsoncpp' 'mingw-w64-hdf5' 'mingw-w64-lz4' 'mingw-w64-proj' 'mingw-w64-cgns' 'mingw-w64-netcdf' 'mingw-w64-double-conversion' 'mingw-w64-protobuf' 'mingw-w64-libtheora' 'mingw-w64-pugixml' 'mingw-w64-gl2ps' 'mingw-w64-libharu' 'mingw-w64-verdict')
makedepends=('mingw-w64-cmake' 'mingw-w64-wine' 'protobuf')
options=('!buildflags' '!strip' 'staticlibs')
source=("${url}/files/v${pkgver:0:4}/ParaView-v${pkgver}.tar.xz")
sha256sums=('a16503ce37b999c2967d84234596e7bf67ac98221851a288bb1399c7e1dc2004')

_architectures="x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}/ParaView-v${pkgver}"
  curl -L https://gitlab.kitware.com/vtk/vtk/-/merge_requests/11239.patch | patch -p1 -d VTK
}

build() {
  cd "${srcdir}/ParaView-v${pkgver}"
  for _arch in ${_architectures}; do
    ${_arch}-cmake \
      -DCMAKE_BUILD_TYPE=Release \
      -DPARAVIEW_USE_PYTHON=OFF \
      -DPARAVIEW_ENABLE_EMBEDDED_DOCUMENTATION=OFF \
      -DPARAVIEW_PLUGIN_DISABLE_XML_DOCUMENTATION=ON \
      -DPARAVIEW_USE_VTKM=OFF \
      -DPARAVIEW_BUILD_WITH_EXTERNAL=ON \
      -DPARAVIEW_QT_VERSION=6 \
      -DVTK_QT_VERSION=6 \
      -DVTK_MODULE_USE_EXTERNAL_VTK_ioss=OFF \
      -DVTK_MODULE_USE_EXTERNAL_VTK_fmt=OFF \
      -DVTK_MODULE_USE_EXTERNAL_VTK_cli11=OFF \
      -DVTK_MODULE_USE_EXTERNAL_VTK_eigen=OFF \
      -DVTK_MODULE_USE_EXTERNAL_VTK_exprtk=OFF \
      -DVTK_MODULE_USE_EXTERNAL_VTK_fast_float=OFF \
      -DVTK_MODULE_USE_EXTERNAL_VTK_nlohmannjson=OFF \
      -DVTK_MODULE_USE_EXTERNAL_VTK_pegtl=OFF \
      -DVTK_MODULE_USE_EXTERNAL_VTK_token=OFF \
      -DVTK_MODULE_USE_EXTERNAL_VTK_utf8=OFF \
      -DCMAKE_CXX_STANDARD=17 \
      -DPARAVIEW_IGNORE_CMAKE_CXX11_CHECKS=ON \
      -B build-${_arch} .
    WINEPATH="/usr/${_arch}/bin;${PWD}/bin" make -C build-${_arch}
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
