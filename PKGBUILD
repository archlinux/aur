
pkgname=mingw-w64-vtk
_majordotminor=6.2
pkgver=${_majordotminor}.0
pkgrel=1
pkgdesc='A software system for 3D computer graphics, image processing, and visualization (mingw-w64)'
arch=('any')
url='http://www.vtk.org/'
license=('BSD')
depends=('mingw-w64-crt' 'mingw-w64-qt4' 'mingw-w64-expat' 'mingw-w64-libtiff' 'mingw-w64-libjpeg-turbo' 'mingw-w64-freetype' 'mingw-w64-libpng' 'mingw-w64-libxml2' 'mingw-w64-hdf5' 'mingw-w64-libodbc++' 'mingw-w64-libtheora' 'mingw-w64-freeglut')
makedepends=('mingw-w64-cmake')
options=('!buildflags' 'staticlibs' '!strip')
source=("http://www.vtk.org/files/release/${_majordotminor}/VTK-${pkgver}.tar.gz")
md5sums=('4790f8b3acdbc376997fbdc9d203f0b7')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}"/VTK-${pkgver}

  # FindThreads defines CMAKE_USE_WIN32_THREADS_INIT which enables VTK_USE_WIN32_THREADS
#   sed -i "s|set(VTK_USE_WIN32_THREADS 1)|set(VTK_USE_WIN32_THREADS 0)|g" CMakeLists.txt

  # compilation error in IO/Video/vtkWin32VideoSource.cxx for x86_64 target
  sed -i "s|if(VTK_VFW_SUPPORTS_CAPTURE)|if(0)|g" IO/Video/CMakeLists.txt
}

build() {
  cd "${srcdir}/VTK-${pkgver}"

  # native build
  mkdir -p build-native && pushd build-native
  cmake ..
  make vtkmkg3states vtkParseOGLExt  vtkEncodeString vtkHashSource
  popd

  # flags to enable using system libs
  local cmake_system_flags=""
  for lib in HDF5 FREETYPE EXPAT JPEG PNG TIFF ZLIB LIBXML2 OGGTHEORA; do
    cmake_system_flags+="-DVTK_USE_SYSTEM_${lib}:BOOL=ON "
  done

  for _arch in ${_architectures}; do
    unset LDFLAGS
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake \
      -DVTKCompileTools_DIR=$PWD/../build-native \
      ${cmake_system_flags} \
      -DBUILD_TESTING=OFF \
      -DVTK_USE_QT=ON \
      -DVTK_USE_POSTGRES=ON \
      -DCMAKE_USE_PTHREADS=ON \
      -DOGGTHEORA_NO_444_SUBSAMPLING=0 \
      -DCMAKE_REQUIRE_LARGE_FILE_SUPPORT="" -DCMAKE_REQUIRE_LARGE_FILE_SUPPORT__TRYRUN_OUTPUT="" \
      -DVTK_TYPE_CHAR_IS_SIGNED=1 \
      -DVTK_ANSI_STREAM_EOF_RESULT=0 \
      -DKWSYS_LFS_WORKS=0 -DKWSYS_LFS_WORKS__TRYRUN_OUTPUT="" \
      -DKWSYS_CHAR_IS_SIGNED=0 -DKWSYS_CHAR_IS_SIGNED__TRYRUN_OUTPUT="" \
      ..
    make
    popd
    mkdir -p build-${_arch}-static && pushd build-${_arch}-static
    ${_arch}-cmake \
      -DVTKCompileTools_DIR=$PWD/../build-native \
      ${cmake_system_flags} \
      -DBUILD_TESTING=OFF \
      -DVTK_USE_QT=ON \
      -DVTK_USE_POSTGRES=ON \
      -DCMAKE_USE_PTHREADS=ON \
      -DOGGTHEORA_NO_444_SUBSAMPLING=0 \
      -DCMAKE_REQUIRE_LARGE_FILE_SUPPORT="" -DCMAKE_REQUIRE_LARGE_FILE_SUPPORT__TRYRUN_OUTPUT="" \
      -DVTK_TYPE_CHAR_IS_SIGNED=1 \
      -DVTK_ANSI_STREAM_EOF_RESULT=0 \
      -DKWSYS_LFS_WORKS=0 -DKWSYS_LFS_WORKS__TRYRUN_OUTPUT="" \
      -DKWSYS_CHAR_IS_SIGNED=0 -DKWSYS_CHAR_IS_SIGNED__TRYRUN_OUTPUT="" \
      -DBUILD_SHARED_LIBS=OFF \
      ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir/VTK-${pkgver}/build-${_arch}-static"
    make install DESTDIR="$pkgdir"
    cd "$srcdir/VTK-${pkgver}/build-${_arch}"
    make install DESTDIR="$pkgdir"
    rm -r "$pkgdir"/usr/${_arch}/share/doc
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}

