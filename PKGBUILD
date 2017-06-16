pkgname=mingw-w64-paraview
_majordotminor=5.4
pkgver=${_majordotminor}.0
pkgrel=1
pkgdesc='Parallel Visualization Application using VTK (mingw-w64)'
arch=('any')
url='http://www.paraview.org'
license=('custom')
depends=('mingw-w64-qt5-xmlpatterns' 'mingw-w64-qt5-tools' 'mingw-w64-boost' 'mingw-w64-glew' 'mingw-w64-expat'  'mingw-w64-freetype2'  'mingw-w64-libjpeg'  'mingw-w64-libxml2' 'mingw-w64-libtheora' 'mingw-w64-libpng' 'mingw-w64-libtiff' 'mingw-w64-zlib' 'mingw-w64-jsoncpp' 'mingw-w64-pugixml' 'mingw-w64-hdf5' 'mingw-w64-lz4' 'mingw-w64-cgns' 'mingw-w64-netcdf-cxx-legacy')
makedepends=('mingw-w64-cmake')
options=('!buildflags' '!strip' 'staticlibs')
source=("http://paraview.org/files/v${_majordotminor}/ParaView-v${pkgver}.tar.gz")
sha1sums=('d1bc9112d76f603d3232069b4ea9c507c4e1b1a7')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}/ParaView-v${pkgver}"

  # https://gitlab.kitware.com/paraview/paraview/merge_requests/1716
  sed -i "s|if (CMAKE_CROSSCOMPILING AND NOT COMPILE_TOOLS_IMPORTED)|if (CMAKE_CROSSCOMPILING AND NOT COMPILE_TOOLS_IMPORTED AND NOT DEFINED CMAKE_CROSSCOMPILING_EMULATOR AND CMAKE_VERSION VERSION_LESS 3.8)|g" CMakeLists.txt
  sed -i "s|if (NOT CMAKE_CROSSCOMPILING)|if (NOT COMPILE_TOOLS_IMPORTED)|g" Utilities/WrapClientServer/CMakeLists.txt Utilities/ProcessXML/CMakeLists.txt 
  sed -i "s|IF(NOT CMAKE_CROSSCOMPILING)|if (NOT COMPILE_TOOLS_IMPORTED)|g" ThirdParty/protobuf/vtkprotobuf/src/CMakeLists.txt
  
  # https://gitlab.kitware.com/vtk/vtk/merge_requests/2931
  sed -i "s|NOT CMAKE_CROSSCOMPILING OR DEFINED CMAKE_CROSSCOMPILING_EMULATOR|NOT VTK_COMPILE_TOOLS_IMPORTED|g" VTK/Utilities/EncodeString/CMakeLists.txt  

  # https://gitlab.kitware.com/paraview/protobuf/merge_requests/4
  sed -i "s|string Subprocess::Win32ErrorMessage|string Win32ErrorMessage|g" ThirdParty/protobuf/vtkprotobuf/src/google/protobuf/compiler/subprocess.h

  # vtkParse.tab.c reads an extra (empty) new line
  sed -i "12210i    if((n == 0) && (lineno > 0)) continue;" VTK/Wrapping/Tools/vtkParse.tab.c

  # fix libharu export
  sed -i "s|WIN32 AND NOT CYGWIN|MSVC|g" VTK/ThirdParty/libharu/vtklibharu/src/CMakeLists.txt 
}

build() {
  cd "${srcdir}/ParaView-v${pkgver}"
  mkdir -p build-native
  if ! test -d "build-native"
  then
    # native build
    mkdir -p build-native && pushd build-native
    cmake ..
    make vtkEncodeString vtkHashSource vtkWrapClientServer protoc_compiler kwProcessXML
    popd
  fi

  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake \
    -DPARAVIEW_INSTALL_DEVELOPMENT_FILES:BOOL=ON \
    -DOSPRAY_INSTALL_DIR:PATH=/usr \
    -DPARAVIEW_ENABLE_FFMPEG:BOOL=OFF \
    -DPARAVIEW_ENABLE_PYTHON:BOOL=OFF \
    -DPARAVIEW_PYTHON_VERSION=2 \
    -DPARAVIEW_QT_VERSION=5 \
    -DPARAVIEW_USE_VISITBRIDGE:BOOL=OFF \
    -DPARAVIEW_USE_OSPRAY:BOOL=OFF \
    -DVTK_USE_SYSTEM_LIBRARIES=ON \
    -DVTK_USE_SYSTEM_QTTESTING=OFF \
    -DVTK_USE_SYSTEM_XDMF2=OFF \
    -DVTK_USE_SYSTEM_PROTOBUF:BOOL=OFF \
    -DVTK_USE_SYSTEM_GL2PS=OFF \
    -DVTK_USE_SYSTEM_LIBHARU=OFF \
    -DVTK_PYTHON_VERSION=2 \
    -DVTK_QT_VERSION=5 \
    -DVTK_RENDERING_BACKEND:STRING=OpenGL2 \
    -DVTK_SMP_IMPLEMENTATION_TYPE:STRING=OpenMP \
    -DHDF5_ROOT=/usr/${_arch}/ \
    ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir"/ParaView-v${pkgver}/build-${_arch}
    make install DESTDIR="$pkgdir"
    rm -r "$pkgdir"/usr/${_arch}/share
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/paraview-${_majordotminor}/*.a
  done
}
