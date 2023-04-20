pkgname=mingw-w64-paraview-git
pkgver=r79815.8a74ec4e9b
pkgrel=1
pkgdesc='Parallel Visualization Application using VTK (mingw-w64)'
arch=('any')
url='https://www.paraview.org'
license=('custom')
depends=('mingw-w64-qt5-tools' 'mingw-w64-qt5-svg' 'mingw-w64-boost' 'mingw-w64-glew' 'mingw-w64-freetype2' 'mingw-w64-libxml2' 'mingw-w64-libtiff' 'mingw-w64-jsoncpp' 'mingw-w64-hdf5' 'mingw-w64-lz4' 'mingw-w64-proj' 'mingw-w64-cgns' 'mingw-w64-netcdf' 'mingw-w64-double-conversion' 'mingw-w64-protobuf' 'mingw-w64-libtheora' 'mingw-w64-pugixml' 'mingw-w64-gl2ps' 'mingw-w64-libharu' 'mingw-w64-verdict')
makedepends=('mingw-w64-cmake' 'mingw-w64-eigen' 'mingw-w64-utf8cpp' 'mingw-w64-cli11' 'mingw-w64-exprtk' 'mingw-w64-wine' 'protobuf' 'mingw-w64-nlohmann-json' 'git')
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
}

build() {
  cd "${srcdir}/paraview"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake \
      -DCMAKE_BUILD_TYPE=Release \
      -DPARAVIEW_USE_PYTHON=OFF \
      -DPARAVIEW_ENABLE_EMBEDDED_DOCUMENTATION=OFF \
      -DPARAVIEW_PLUGIN_DISABLE_XML_DOCUMENTATION=ON \
      -DPARAVIEW_USE_VTKM=OFF \
      -DPARAVIEW_BUILD_WITH_EXTERNAL=ON \
      -DVTK_MODULE_USE_EXTERNAL_VTK_ioss=OFF \
      -DVTK_MODULE_USE_EXTERNAL_VTK_fmt=OFF \
      ..
    WINEPATH="/usr/${_arch}/bin;${PWD}/bin" make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir"/paraview/build-${_arch}
    make install/fast DESTDIR="$pkgdir"
    rm -r "$pkgdir"/usr/${_arch}/share
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
