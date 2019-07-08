pkgname=mingw-w64-paraview-git
pkgver=r71412.10938cd09b
pkgrel=1
pkgdesc='Parallel Visualization Application using VTK (mingw-w64)'
arch=('any')
url='http://www.paraview.org'
license=('custom')
depends=('mingw-w64-qt5-xmlpatterns' 'mingw-w64-qt5-tools' 'mingw-w64-boost' 'mingw-w64-glew' 'mingw-w64-freetype2' 'mingw-w64-libxml2' 'mingw-w64-libtheora' 'mingw-w64-libtiff' 'mingw-w64-jsoncpp' 'mingw-w64-hdf5' 'mingw-w64-lz4' 'mingw-w64-cgns' 'mingw-w64-netcdf' 'mingw-w64-double-conversion')
makedepends=('mingw-w64-cmake' 'mingw-w64-eigen' 'mingw-w64-wine')
provides=('mingw-w64-paraview')
conflicts=('mingw-w64-paraview')
options=('!buildflags' '!strip' 'staticlibs')
source=("git+https://gitlab.kitware.com/paraview/paraview.git"
        "git+https://gitlab.kitware.com/vtk/vtk.git"
        "git+https://gitlab.kitware.com/paraview/visitbridge.git"
        "git+https://gitlab.kitware.com/paraview/icet.git"
        "git+https://gitlab.kitware.com/paraview/qttesting.git")
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

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
  git submodule update -f --init

  # missing protobuf::protoc for target vtkPVMessage_protobuf_compile
  sed -i "1iset_target_properties(protobuf::protoc PROPERTIES IMPORTED_LOCATION \${Protobuf_PROTOC_EXECUTABLE})" ParaViewCore/ServerImplementation/Core/CMakeLists.txt
  sed -i "1iadd_executable(protobuf::protoc IMPORTED)" ParaViewCore/ServerImplementation/Core/CMakeLists.txt
  # vtkPVDefaultPass.cxx:(.text+0x2b3): undefined reference to `glGetError@0'
  echo "vtk_module_link(ParaView::VTKExtensionsRendering PRIVATE opengl32) " >> ParaViewCore/VTKExtensions/Rendering/CMakeLists.txt

  cd VTK
  # https://gitlab.kitware.com/vtk/vtk/issues/17637
  sed -i "s|find_package(netCDF|#find_package(netCDF|g" CMake/FindNetCDF.cmake
  # https://gitlab.kitware.com/vtk/vtk/issues/17630
  sed -i "s|VTK::netcdf|VTK::netcdf VTK::hdf5|g" ThirdParty/exodusII/vtk.module
  # vtkQWidgetTexture.cxx:(.text+0x14c): undefined reference to `_imp__glPixelStorei@8'
  echo "vtk_module_link(VTK::GUISupportQt PRIVATE opengl32) " >> GUISupport/Qt/CMakeLists.txt
}

build() {
  cd "${srcdir}/paraview"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake \
      -DPARAVIEW_INSTALL_DEVELOPMENT_FILES=ON \
      -DPARAVIEW_ENABLE_PYTHON=OFF \
      -DPARAVIEW_ENABLE_EMBEDDED_DOCUMENTATION=OFF \
      -DPARAVIEW_USE_VTKM=OFF \
      -DPARAVIEW_PLUGINS_DEFAULT=OFF \
      -DVTK_MODULE_USE_EXTERNAL_VTK_doubleconversion=ON \
      -DVTK_MODULE_USE_EXTERNAL_VTK_eigen=ON \
      -DVTK_MODULE_USE_EXTERNAL_VTK_expat=ON \
      -DVTK_MODULE_USE_EXTERNAL_VTK_freetype=ON \
      -DVTK_MODULE_USE_EXTERNAL_VTK_gl2ps=OFF \
      -DVTK_MODULE_USE_EXTERNAL_VTK_glew=ON \
      -DVTK_MODULE_USE_EXTERNAL_VTK_hdf5=ON \
      -DVTK_MODULE_USE_EXTERNAL_VTK_jpeg=ON \
      -DVTK_MODULE_USE_EXTERNAL_VTK_jsoncpp=ON \
      -DVTK_MODULE_USE_EXTERNAL_VTK_libharu=OFF \
      -DVTK_MODULE_USE_EXTERNAL_VTK_libproj=ON \
      -DVTK_MODULE_USE_EXTERNAL_VTK_libxml2=ON \
      -DVTK_MODULE_USE_EXTERNAL_VTK_lz4=ON \
      -DVTK_MODULE_USE_EXTERNAL_VTK_lzma=ON \
      -DVTK_MODULE_USE_EXTERNAL_VTK_netcdf=ON \
      -DVTK_MODULE_USE_EXTERNAL_VTK_png=ON \
      -DVTK_MODULE_USE_EXTERNAL_VTK_sqlite=ON \
      -DVTK_MODULE_USE_EXTERNAL_VTK_tiff=ON \
      -DVTK_MODULE_USE_EXTERNAL_VTK_utf8=ON \
      -DVTK_MODULE_USE_EXTERNAL_VTK_zlib=ON \
      -DVTK_MODULE_USE_EXTERNAL_ParaView_protobuf=ON \
      -DVTK_MODULE_USE_EXTERNAL_ParaView_cgns=ON \
      ..
    make
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
