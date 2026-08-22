pkgname=mingw-w64-paraview-git
pkgver=r86744.72df957f2c
pkgrel=1
pkgdesc='Parallel Visualization Application using VTK (mingw-w64)'
arch=('any')
url='https://www.paraview.org'
license=('custom')
depends=('mingw-w64-qt5-base' 'mingw-w64-qt5-tools' 'mingw-w64-qt5-svg' 'mingw-w64-freetype2' 'mingw-w64-libxml2' 'mingw-w64-libtiff' 'mingw-w64-jsoncpp' 'mingw-w64-hdf5' 'mingw-w64-lz4' 'mingw-w64-proj' 'mingw-w64-cgns' 'mingw-w64-netcdf' 'mingw-w64-double-conversion' 'mingw-w64-protobuf' 'mingw-w64-libtheora' 'mingw-w64-pugixml' 'mingw-w64-gl2ps' 'mingw-w64-libharu' 'mingw-w64-verdict' 'mingw-w64-scnlib')
makedepends=('mingw-w64-cmake' 'mingw-w64-wine' 'mingw-w64-boost' 'protobuf' 'git' 'ninja-makeflags')
provides=('mingw-w64-paraview')
conflicts=('mingw-w64-paraview')
options=('!buildflags' '!strip' 'staticlibs')
source=("git+https://gitlab.kitware.com/paraview/paraview.git"
        "git+https://gitlab.kitware.com/vtk/vtk.git"
        "git+https://gitlab.kitware.com/paraview/visitbridge.git"
        "git+https://gitlab.kitware.com/paraview/icet.git"
        "git+https://gitlab.kitware.com/paraview/qttesting.git")
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

_architectures="x86_64-w64-mingw32"

pkgver () {
  cd "${srcdir}/paraview"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/paraview"
  git submodule init
  git config submodule.VTK.url "$srcdir"/vtk
  git config submodule.Utilities/VisItBridge.git "$srcdir"/visitbridge
  git config submodule.ThirdParty/IceT/vtkicet.git "$srcdir"/icet
  git config submodule.ThirdParty/QtTesting/vtkqttesting.git "$srcdir"/qttesting
  git -c protocol.file.allow=always submodule update -f --init

  # https://gitlab.kitware.com/cmake/cmake/-/issues/25079
  # undefined reference to absl::lts_20250814::log_internal::LogMessageFatal::LogMessageFatal(char const*, int, char const*)
  echo "target_link_libraries(vtkRemotingServerManager PRIVATE absl_log_internal_message)" >> Remoting/ServerManager/CMakeLists.txt

  # absl/types/compare.h:60:12: error: 'partial_ordering' has not been declared in 'std'
  # abseil assumes client code use a higher c++ standard than how it was itself compiled (gcc default=c++20, paraview=c++17) and sets ABSL_OPTION_USE_STD_ORDERING=1
  # locally override abseil options.h to force ABSL_OPTION_USE_STD_ORDERING=0, keep other settings to their defaults
  #echo "target_compile_definitions(vtkRemotingServerManager PRIVATE ABSL_BASE_OPTIONS_H_ ABSL_OPTION_USE_STD_SOURCE_LOCATION=1 ABSL_OPTION_USE_STD_ORDERING=0 ABSL_OPTION_USE_INLINE_NAMESPACE=1 ABSL_OPTION_INLINE_NAMESPACE_NAME=lts_20260526 ABSL_OPTION_HARDENED=0 ABSL_OPTION_INLINE_HW_ACCEL_STRATEGY=0)" >> Remoting/ServerManager/CMakeLists.txt

  # qt5
  curl -L https://gitlab.kitware.com/paraview/paraview/-/merge_requests/7922.patch | patch -p1
}

build() {
  cd "${srcdir}/paraview"
  for _arch in ${_architectures}; do
    ${_arch}-cmake -G Ninja \
      -DCMAKE_MAKE_PROGRAM=/usr/bin/ninja-makeflags \
      -DCMAKE_BUILD_TYPE=Release \
      -DPARAVIEW_BUILD_SHARED_LIBS=ON -UBUILD_SHARED_LIBS \
      -DPARAVIEW_USE_PYTHON=OFF \
      -DPARAVIEW_ENABLE_EMBEDDED_DOCUMENTATION=OFF \
      -DPARAVIEW_PLUGIN_DISABLE_XML_DOCUMENTATION=ON \
      -DPARAVIEW_USE_VISKORES=OFF \
      -DPARAVIEW_BUILD_WITH_EXTERNAL=ON \
      -DPARAVIEW_QT_VERSION=5 \
      -DVTK_QT_VERSION=5 \
      -DVTK_MODULE_USE_EXTERNAL_VTK_ioss=OFF \
      -DVTK_MODULE_USE_EXTERNAL_VTK_cli11=OFF \
      -DVTK_MODULE_USE_EXTERNAL_VTK_eigen=OFF \
      -DVTK_MODULE_USE_EXTERNAL_VTK_exprtk=OFF \
      -DVTK_MODULE_USE_EXTERNAL_VTK_fast_float=OFF \
      -DVTK_MODULE_USE_EXTERNAL_VTK_fmt=OFF \
      -DVTK_MODULE_USE_EXTERNAL_VTK_nlohmannjson=OFF \
      -DVTK_MODULE_USE_EXTERNAL_VTK_pegtl=OFF \
      -DVTK_MODULE_USE_EXTERNAL_VTK_token=OFF \
      -DVTK_MODULE_USE_EXTERNAL_VTK_utf8=OFF \
      -B build-${_arch} .
    WINEPATH="/usr/${_arch}/bin;${PWD}/bin" cmake --build build-${_arch}
  done
}

package() {
  cd "$srcdir"/paraview/
  for _arch in ${_architectures}; do
    DESTDIR="$pkgdir" cmake --install build-${_arch}
    rm -r "$pkgdir"/usr/${_arch}/share
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
