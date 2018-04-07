pkgname=mingw-w64-paraview
_majordotminor=5.5
pkgver=${_majordotminor}.0
_pkgver=${pkgver}
pkgrel=1
pkgdesc='Parallel Visualization Application using VTK (mingw-w64)'
arch=('any')
url='http://www.paraview.org'
license=('custom')
depends=('mingw-w64-qt5-xmlpatterns' 'mingw-w64-qt5-tools' 'mingw-w64-boost' 'mingw-w64-glew' 'mingw-w64-expat'  'mingw-w64-freetype2'  'mingw-w64-libjpeg'  'mingw-w64-libxml2' 'mingw-w64-libtheora' 'mingw-w64-libpng' 'mingw-w64-libtiff' 'mingw-w64-zlib' 'mingw-w64-jsoncpp' 'mingw-w64-pugixml' 'mingw-w64-hdf5' 'mingw-w64-lz4' 'mingw-w64-cgns' 'mingw-w64-netcdf-cxx-legacy')
makedepends=('mingw-w64-cmake' 'mingw-w64-eigen')
options=('!buildflags' '!strip' 'staticlibs')
source=("http://paraview.org/files/v${_majordotminor}/ParaView-v${_pkgver}.tar.gz")
sha256sums=('1b619e326ff574de808732ca9a7447e4cd14e94ae6568f55b6581896cd569dff')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}/ParaView-v${_pkgver}"

  # cannot be modified upstream, see https://gitlab.kitware.com/paraview/paraview/merge_requests/1716
  sed -i "s|IF(NOT CMAKE_CROSSCOMPILING)|IF(NOT PARAVIEW_COMPILE_TOOLS_IMPORTED)|g" ThirdParty/protobuf/vtkprotobuf/src/CMakeLists.txt

  # https://gitlab.kitware.com/vtk/vtk/merge_requests/4017
  sed -i "s|GetLibraryPathForSymbolWin32(\&function)|GetLibraryPathForSymbolWin32(reinterpret_cast<const void*>(\&function))|g" VTK/Common/Misc/vtkResourceFileLocator.h
}

build() {
  cd "${srcdir}/ParaView-v${_pkgver}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake \
    -DPARAVIEW_INSTALL_DEVELOPMENT_FILES:BOOL=ON \
    -DPARAVIEW_ENABLE_FFMPEG:BOOL=OFF \
    -DPARAVIEW_ENABLE_PYTHON:BOOL=OFF \
    -DPARAVIEW_PYTHON_VERSION=2 \
    -DPARAVIEW_ENABLE_EMBEDDED_DOCUMENTATION=OFF \
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
    -DHDF5_ROOT=/usr/${_arch}/ ..
    make
    popd
  done
}


package() {
  for _arch in ${_architectures}; do
    cd "$srcdir"/ParaView-v${_pkgver}/build-${_arch}
    make install/fast DESTDIR="$pkgdir"
    rm -r "$pkgdir"/usr/${_arch}/share
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
