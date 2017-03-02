pkgname=mingw-w64-paraview
_majordotminor=5.2
pkgver=${_majordotminor}.0
pkgrel=1
pkgdesc='Parallel Visualization Application using VTK (mingw-w64)'
arch=('any')
url='http://www.paraview.org'
license=('custom')
depends=('mingw-w64-qt5-xmlpatterns' 'mingw-w64-qt5-tools' 'mingw-w64-boost' 'mingw-w64-glew' 'mingw-w64-expat'  'mingw-w64-freetype2'  'mingw-w64-libjpeg'  'mingw-w64-libxml2' 'mingw-w64-libtheora' 'mingw-w64-libpng' 'mingw-w64-libtiff' 'mingw-w64-zlib' 'mingw-w64-jsoncpp' 'mingw-w64-pugixml' 'mingw-w64-hdf5' 'mingw-w64-lz4')
makedepends=('mingw-w64-cmake')
options=('!buildflags' '!strip' 'staticlibs')
source=("http://paraview.org/files/v${pkgver}/ParaView-v${pkgver}.tar.gz"
        'vtk_hdf5_internal.patch' 332e61a.patch 6541e9c.patch)
sha1sums=('c578cdad44673cd3311bd5c5fec52075ea923701'
          'cbadaa87cd775d1edb1dbc1db4dedb9f3cdc4fd5' SKIP SKIP)

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}/ParaView-v${pkgver}"

  patch -p1 -i ../vtk_hdf5_internal.patch

  # disable all plugins ~ -DPARAVIEW_BUILD_PLUGIN_XXX
  sed -i "s|if (PARAVIEW_BUILD_PLUGIN|if(OFF|g" CMake/ParaViewPluginsMacros.cmake

  pushd VTK && patch -p1 -i "${srcdir}"/332e61a.patch && popd
  pushd VTK && patch -p1 -i "${srcdir}"/6541e9c.patch && popd

  # https://gitlab.kitware.com/paraview/paraview/merge_requests/1434
  sed -i "s|#include <Windows.h>|#include <windows.h>|g" ParaViewCore/ServerManager/SMApplication/vtkInitializationHelper.cxx

  # https://gitlab.kitware.com/paraview/paraview/merge_requests/1436
  echo "target_link_libraries(paraview LINK_PRIVATE msvcr90)" >> Applications/ParaView/CMakeLists.txt
}

build() {
  cd "${srcdir}/ParaView-v${pkgver}"
  # native build
  mkdir -p build-native && pushd build-native
  cmake ..
  make vtkEncodeString vtkHashSource vtkWrapClientServer protoc_compiler kwProcessXML
  popd

  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake \
    -DCOMPILE_TOOLS_IMPORTED=OFF \
    -DParaViewCompileTools_DIR=$PWD/../build-native \
    -DBUILD_TESTING:BOOL=OFF \
    -DCMAKE_VERBOSE_MAKEFILE:BOOL=OFF \
    -DOSPRAY_INSTALL_DIR:PATH=/usr \
    -DPARAVIEW_ENABLE_CGNS:BOOL=OFF \
    -DPARAVIEW_ENABLE_FFMPEG:BOOL=OFF \
    -DPARAVIEW_ENABLE_PYTHON:BOOL=OFF \
    -DPARAVIEW_PYTHON_VERSION=2 \
    -DPARAVIEW_QT_VERSION=5 \
    -DPARAVIEW_USE_MPI:BOOL=OFF \
    -DPARAVIEW_USE_VISITBRIDGE:BOOL=OFF \
    -DPARAVIEW_USE_OSPRAY:BOOL=OFF \
    -DVTK_USE_SYSTEM_LIBRARIES=ON \
    -DVTK_USE_SYSTEM_QTTESTING=OFF \
    -DVTK_USE_SYSTEM_NETCDF=OFF \
    -DVTK_USE_SYSTEM_XDMF2=OFF \
    -DVTK_USE_SYSTEM_PROTOBUF:BOOL=OFF \
    -DVTK_USE_SYSTEM_GL2PS=OFF \
    -DVISIT_BUILD_READER_CGNS:BOOL=OFF \
    -DVTK_PYTHON_VERSION=2 \
    -DVTK_QT_VERSION=5 \
    -DVTK_RENDERING_BACKEND:STRING=OpenGL2 \
    -DVTK_SMP_IMPLEMENTATION_TYPE:STRING=OpenMP \
    -DPARAVIEW_BUILD_PLUGIN_AcceleratedAlgorithms=OFF \
    -DPARAVIEW_BUILD_PLUGIN_AnalyzeNIfTIIO=OFF \
    ..

    # fix some generation rules
    find . -name build.make | xargs sed -i "s|bin/rcc Qt5::rcc|bin/rcc|g"
    find . -name build.make | xargs sed -i "s|bin/moc Qt5::moc|bin/moc|g"
    find . -name build.make | xargs sed -i "s|bin/vtkEncodeString-pv${_majordotminor} vtkEncodeString|bin/vtkEncodeString-pv${_majordotminor}|g"
    find . -name build.make | xargs sed -i "s|bin/vtkHashSource-pv${_majordotminor} vtkHashSource|bin/vtkHashSource-pv${_majordotminor}|g"
    find . -name build.make | xargs sed -i "s|bin/protoc protoc_compiler|bin/protoc|g"
    find . -name build.make | xargs sed -i "s|bin/vtkkwProcessXML-pv${_majordotminor} kwProcessXML|bin/vtkkwProcessXML-pv${_majordotminor}|g"
    find . -name build.make | xargs sed -i "s|bin/vtkWrapClientServer-pv${_majordotminor} vtkWrapClientServer|bin/vtkWrapClientServer-pv${_majordotminor}|g"

    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir"/ParaView-v${pkgver}/build-${_arch}
    make install DESTDIR="$pkgdir"
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
#     ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
