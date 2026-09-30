pkgname=mingw-w64-paraview
pkgver=6.2.0
pkgrel=1
pkgdesc='Parallel Visualization Application using VTK (mingw-w64)'
arch=('any')
url='https://www.paraview.org'
license=('custom')
depends=('mingw-w64-vtk' 'mingw-w64-qt6-base' 'mingw-w64-qt6-tools' 'mingw-w64-qt6-svg' 'mingw-w64-qt6-5compat' 'mingw-w64-cgns' 'mingw-w64-protobuf')
makedepends=('mingw-w64-cmake' 'mingw-w64-wine' 'mingw-w64-boost' 'protobuf' 'qt6-base')
options=('!buildflags' '!strip' 'staticlibs')
source=("${url}/files/v${pkgver:0:3}/ParaView-v${pkgver}.tar.xz")
md5sums=('a65e2c083a69eb3ab2e597b58d6f33ec')

_architectures=${MINGW_W64_ARCHS:-x86_64-w64-mingw32}

prepare() {
  cd "${srcdir}/ParaView-v${pkgver}"

  # undefined reference to absl::lts_20250814::log_internal::LogMessageFatal::LogMessageFatal(char const*, int, char const*)
  echo "target_link_libraries(vtkRemotingServerManager PRIVATE absl_log_internal_message)" >> Remoting/ServerManager/CMakeLists.txt
}

build() {
  cd "${srcdir}/ParaView-v${pkgver}"
  for _arch in ${_architectures}; do
    ${_arch}-cmake \
      -DCMAKE_BUILD_TYPE=Release \
      -DPARAVIEW_USE_PYTHON=OFF \
      -DPARAVIEW_ENABLE_EMBEDDED_DOCUMENTATION=OFF \
      -DPARAVIEW_PLUGIN_DISABLE_XML_DOCUMENTATION=ON \
      -DPARAVIEW_USE_VISKORES=OFF \
      -DPARAVIEW_BUILD_WITH_EXTERNAL=ON \
      -DPARAVIEW_USE_EXTERNAL_VTK=ON \
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
