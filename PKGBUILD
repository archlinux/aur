
pkgname=mingw-w64-vtk
_majordotminor=7.1
pkgver=${_majordotminor}.0
pkgrel=1
pkgdesc='A software system for 3D computer graphics, image processing, and visualization (mingw-w64)'
arch=('any')
url='http://www.vtk.org/'
license=('BSD')
depends=('mingw-w64-crt' 'mingw-w64-qt5-base' 'mingw-w64-jsoncpp' 'mingw-w64-expat' 'mingw-w64-netcdf' 'mingw-w64-libtiff' 'mingw-w64-libjpeg-turbo' 'mingw-w64-freetype2' 'mingw-w64-libpng' 'mingw-w64-libxml2' 'mingw-w64-hdf5' 'mingw-w64-libtheora' 'mingw-w64-freeglut')
makedepends=('mingw-w64-cmake')
options=('!buildflags' 'staticlibs' '!strip')
source=("http://www.vtk.org/files/release/${_majordotminor}/VTK-${pkgver}.tar.gz"
         6541e9c.patch
         332e61a.patch)
md5sums=('a7e814c1db503d896af72458c2d0228f' SKIP SKIP)

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}/VTK-${pkgver}"

  # https://gitlab.kitware.com/vtk/vtk/commit/6541e9c7662d3987baded0ea90de80937fa23d7a
  patch -p1 -i "${srcdir}"/6541e9c.patch

  # https://gitlab.kitware.com/vtk/vtk/merge_requests/2540
  patch -p1 -i "${srcdir}"/332e61a.patch
}


build() {
  cd "${srcdir}/VTK-${pkgver}"

  # native build
  mkdir -p build-native && pushd build-native
  cmake ..
  make vtkEncodeString vtkHashSource
  popd

  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake \
      -DVTKCompileTools_DIR=$PWD/../build-native \
      -DVTK_USE_SYSTEM_LIBRARIES=ON \
      -DVTK_USE_SYSTEM_LIBPROJ4=OFF \
      -DVTK_USE_SYSTEM_NETCDF=OFF \
      -DVTK_USE_SYSTEM_GL2PS=OFF \
      ..

    # fix some generation rules where the executable appears twice
    sed -i "s|bin/vtkEncodeString-${_majordotminor} vtkEncodeString|bin/vtkEncodeString-${_majordotminor}|g" Rendering/VolumeOpenGL2/CMakeFiles/vtkRenderingVolumeOpenGL2.dir/build.make Rendering/OpenGL2/CMakeFiles/vtkRenderingOpenGL2.dir/build.make
    sed -i "s|bin/vtkHashSource-${_majordotminor} vtkHashSource|bin/vtkHashSource-${_majordotminor}|g" Parallel/Core/CMakeFiles/vtkParallelCore.dir/build.make

    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir/VTK-${pkgver}/build-${_arch}"
    make install DESTDIR="$pkgdir"
    rm -r "$pkgdir"/usr/${_arch}/share
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
