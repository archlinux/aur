# $Id$
# Maintainer: Ray Rashif <schiv@archlinux.org>
# Contributor: Andrzej Giniewicz <gginiu@gmail.com>
# Contributor: Thomas Dziedzic < gostrc at gmail >

pkgname=vtk6
pkgver=6.3.0
_majorver=6.3
pkgrel=1
pkgdesc='A software system for 3D computer graphics, image processing, and visualization. Legacy 6.3 version.'
arch=('i686' 'x86_64')
url='http://www.vtk.org/'
license=('BSD')
depends=('gcc-libs' 'gl2ps')
makedepends=('boost' 'cmake' 'ninja' 'java-environment' 'doxygen' 'gnuplot' 'tk' 'wget' 'python2-matplotlib' 'python2-twisted' 'python2-mpi4py' 'python2-autobahn' 'unixodbc' 'gdal' 'openmpi' 'mariadb' 'glew' 'ffmpeg' 'lesstif' 'qt5-base' 'jsoncpp')
optdepends=('python2: python bindings'
            'java-runtime: java bindings'
            'tk: tcl bindings'
            'gnuplot: plotting tools'
            'graphviz: drawing tools'
            'python2-matplotlib: for Matplotlib rendering'
            'python2-twisted: for vtkWeb'
            'python2-autobahn: for vtkWeb'
            'openmpi: OpenMPI support'
            'python2-mpi4py: OpenMPI python support'
            'unixodbc'
            'glew'
            'gdal'
            'mariadb')
source=("http://www.vtk.org/files/release/${_majorver}/VTK-${pkgver}.tar.gz"
        "http://www.vtk.org/files/release/${_majorver}/VTKData-${pkgver}.tar.gz"
        "http://www.vtk.org/files/release/${_majorver}/VTKLargeData-${pkgver}.tar.gz"
        # https://github.com/Kitware/VTK/pull/21
        remove-vtkxdmf3.patch::https://github.com/nschloe/VTK/commit/a98527dfe9ce23beebf386fab07caef99b911ede.patch
        find-libxml2.patch::https://github.com/nschloe/VTK/commit/6216f98a7124e12a2c1cefd113347f94b51f3c51.patch
        gdal2.patch)
options=(staticlibs)
sha1sums=('452efab1eedf6202f2d9a3362b5f69adfc44edda'
          '424b138c079a688cd8c52c43d12b54e2f2b06acf'
          '622a2bd314262961c6d96f2686f96224e8e31de3'
          'f8c9270941707a296ff5e0ea3c73a1f0407c6f9b'
          'baa807e4495219b3104b6245ca79b8f33ff299db'
          'c60610e7c8cf0ad93d7c02cbf8a20fc415f59b3e')

prepare() {
  cd "${srcdir}"/VTK-$pkgver

  # fix compilation errors:
  patch -Np1 -i "${srcdir}"/remove-vtkxdmf3.patch
  patch -Np1 -i "${srcdir}"/find-libxml2.patch
  patch -Np1 -i "${srcdir}"/gdal2.patch

  sed -e "s|#![ ]*/usr/bin/python$|#!/usr/bin/python2|" \
      -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
      -e "s|#![ ]*/bin/env python$|#!/usr/bin/env python2|" \
      -i $(find . -name '*.py')
}

build() {
  cd "${srcdir}"
  rm -rf build
  mkdir build
  cd build

  # to help cmake find java
  export JAVA_HOME=/usr/lib/jvm/default

  # flags to enable using system libs
  local cmake_system_flags=""
  # TODO: try to use system provided XDMF2, XDMF3, LIBPROJ4 NETCDF
  # VTK fails to compile with recent netcdf-cxx package, VTK should be ported to the latest API
  # VTK does not work with XDMF2 compiled from git. TODO: make vtk compatible with system XDMF library. 
  # Note: VTK explicitly disables system GLEW dependency, it uses embedded sources with modifications
  for lib in HDF5 EXPAT FREETYPE JPEG PNG TIFF ZLIB LIBXML2 OGGTHEORA TWISTED ZOPE SIX AUTOBAHN MPI4PY JSONCPP GLEW GL2PS; do
    cmake_system_flags+="-DVTK_USE_SYSTEM_${lib}:BOOL=ON "
  done

  # flags to use python2 instead of python which is 3.x.x on archlinux
  local cmake_system_python_flags="-DPYTHON_EXECUTABLE:PATH=/usr/bin/python2 -DPYTHON_INCLUDE_DIR:PATH=/usr/include/python2.7 -DPYTHON_LIBRARY:PATH=/usr/lib/libpython2.7.so"

  cmake \
    -Wno-dev \
    -DCMAKE_SKIP_RPATH=ON \
    -DBUILD_SHARED_LIBS:BOOL=ON \
    -DCMAKE_INSTALL_PREFIX:FILEPATH=/opt/${pkgname} \
    -DBUILD_DOCUMENTATION:BOOL=ON \
    -DDOCUMENTATION_HTML_HELP:BOOL=ON \
    -DDOCUMENTATION_HTML_TARZ:BOOL=ON \
    -DBUILD_EXAMPLES:BOOL=ON \
    -DVTK_USE_FFMPEG_ENCODER:BOOL=ON \
    -DVTK_BUILD_ALL_MODULES:BOOL=ON \
    -DVTK_USE_LARGE_DATA:BOOL=ON \
    -DVTK_QT_VERSION:STRING="5" \
    -DVTK_WRAP_JAVA:BOOL=ON \
    -DVTK_WRAP_PYTHON:BOOL=ON \
    -DVTK_WRAP_TCL:BOOL=ON \
    -DCMAKE_CXX_FLAGS="-D__STDC_CONSTANT_MACROS" \
    -DVTK_CUSTOM_LIBRARY_SUFFIX="" \
    -DVTK_INSTALL_INCLUDE_DIR:PATH=include/vtk \
    ${cmake_system_flags} \
    ${cmake_system_python_flags} \
    -DCMAKE_BUILD_TYPE=Release \
    "${srcdir}/VTK-${pkgver}" \
    -GNinja

  ninja
}

package() {
  cd "${srcdir}/build"

  DESTDIR="${pkgdir}" ninja install

  # Move the vtk.jar to the arch-specific location
  install -dv "${pkgdir}/opt/${pkgname}/share/java/vtk"
  mv -v "${pkgdir}/opt/${pkgname}/lib/vtk.jar" "${pkgdir}/opt/${pkgname}/share/java/vtk"
  rm -rf "${pkgdir}/opt/${pkgname}/lib/vtk-${_majorver}/java"

  # Install license
  install -dv "${pkgdir}/opt/${pkgname}/share/licenses/vtk"
  install -m644 "${srcdir}/VTK-${pkgver}/Copyright.txt" "${pkgdir}/opt/${pkgname}/share/licenses/vtk"

  # Fix path of QtDesigner plugin
  install -dv "${pkgdir}/opt/${pkgname}/lib/qt5"
  mv "${pkgdir}"/opt/${pkgname}/plugins "${pkgdir}"/opt/${pkgname}/lib/qt5/plugins
}
