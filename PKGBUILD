# Maintainer:  saxonbeta saxonbeta at _gmail____com
# Contributor: Ray Rashif <schiv@archlinux.org>
# Contributor: Andrzej Giniewicz <gginiu@gmail.com>
# Contributor: Thomas Dziedzic < gostrc at gmail >

pkgname=vtk-qt4
pkgver=6.3.0
_majorver=6.3
pkgrel=3
pkgdesc='A software system for 3D computer graphics, image processing, and visualization. Linked against QT4'
arch=('i686' 'x86_64')
url='http://www.vtk.org/'
license=('BSD')
provides=(vtk=6.3.0)
conflicts=(vtk)
depends=('boost-libs' 'ffmpeg' 'qtwebkit' 'lesstif' 'jsoncpp'  'gl2ps')
makedepends=('boost' 'cmake' 'ninja'  'java-environment' 'doxygen' 'gnuplot' 'tk' 'wget' 'python2-matplotlib' 'python2-twisted' 'python2-mpi4py' 'python2-autobahn' 'unixodbc' 'gdal' 'openmpi' 'mariadb' 'glew' )
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
            'gl2ps'
            'gdal'
            'mariadb')
source=("http://www.vtk.org/files/release/${_majorver}/VTK-${pkgver}.tar.gz"
        "http://www.vtk.org/files/release/${_majorver}/VTKData-${pkgver}.tar.gz"
        "http://www.vtk.org/files/release/${_majorver}/VTKLargeData-${pkgver}.tar.gz"
        remove-vtkxdmf3.patch
        find-libxml2.patch
        gdal2.patch
        ffmpeg3.patch)
options=(staticlibs)
sha1sums=('452efab1eedf6202f2d9a3362b5f69adfc44edda'
          '424b138c079a688cd8c52c43d12b54e2f2b06acf'
          '622a2bd314262961c6d96f2686f96224e8e31de3'
          'f8c9270941707a296ff5e0ea3c73a1f0407c6f9b'
          'baa807e4495219b3104b6245ca79b8f33ff299db'
          'c60610e7c8cf0ad93d7c02cbf8a20fc415f59b3e'
          'a78177f8dd6dedd9ad189fa12730ec53c7d02508')

prepare() {
  cd "${srcdir}"/VTK-$pkgver

  # fix compilation errors:
  patch -Np1 -i "${srcdir}"/remove-vtkxdmf3.patch
  patch -Np1 -i "${srcdir}"/find-libxml2.patch
  patch -Np1 -i "${srcdir}"/gdal2.patch
  patch -Np1 -i "${srcdir}"/ffmpeg3.patch

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
  for lib in HDF5 EXPAT FREETYPE JPEG PNG TIFF ZLIB LIBXML2 OGGTHEORA TWISTED ZOPE SIX AUTOBAHN MPI4PY JSONCPP GLEW GL2PS; do
    cmake_system_flags+="-DVTK_USE_SYSTEM_${lib}:BOOL=ON "
  done

  # flags to use python2 instead of python which is 3.x.x on archlinux
  local cmake_system_python_flags="-DPYTHON_EXECUTABLE:PATH=/usr/bin/python2 -DPYTHON_INCLUDE_DIR:PATH=/usr/include/python2.7 -DPYTHON_LIBRARY:PATH=/usr/lib/libpython2.7.so"

  cmake \
    -Wno-dev \
    -DCMAKE_SKIP_RPATH=ON \
    -DBUILD_SHARED_LIBS:BOOL=ON \
    -DCMAKE_INSTALL_PREFIX:FILEPATH=/usr \
    -DBUILD_DOCUMENTATION:BOOL=ON \
    -DDOCUMENTATION_HTML_HELP:BOOL=ON \
    -DDOCUMENTATION_HTML_TARZ:BOOL=ON \
    -DBUILD_EXAMPLES:BOOL=ON \
    -DVTK_USE_FFMPEG_ENCODER:BOOL=ON \
    -DVTK_BUILD_ALL_MODULES:BOOL=ON \
    -DVTK_USE_LARGE_DATA:BOOL=ON \
    -DVTK_QT_VERSION:STRING="4" \
    -DVTK_WRAP_JAVA:BOOL=ON \
    -DVTK_WRAP_PYTHON:BOOL=ON \
    -DVTK_WRAP_TCL:BOOL=ON \
    -DCMAKE_CXX_FLAGS="-D__STDC_CONSTANT_MACROS" \
    -DVTK_CUSTOM_LIBRARY_SUFFIX="" \
    -DVTK_INSTALL_INCLUDE_DIR:PATH=include/vtk \
    ${cmake_system_flags} \
    ${cmake_system_python_flags} \
    -DCMAKE_BUILD_TYPE=Release \
    "${srcdir}/VTK-$pkgver" \
    -GNinja

  ninja
}

package() {
  cd "${srcdir}/build"

  DESTDIR="${pkgdir}" ninja install
  
  #mkdir -p "$pkgdir/etc/ld.so.conf.d/"
  #printf "%s\n" "/opt/vtk6/lib" > "$pkgdir/etc/ld.so.conf.d/$pkgname.conf"

  # Move the vtk.jar to the arch-specific location
  install -dv "${pkgdir}/usr/share/java/vtk"
  mv -v "${pkgdir}/usr/lib/vtk.jar" "${pkgdir}/usr/share/java/vtk"
  rm -rf "${pkgdir}/usr/lib/vtk-${_majorver}/java"

  # Install license
  install -dv "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 "${srcdir}/VTK-$pkgver/Copyright.txt" "${pkgdir}/usr/share/licenses/${pkgname}"

  # Fix path of QtDesigner plugin
  install -dv "${pkgdir}/usr/lib/qt4"
  mv "$pkgdir"/usr/plugins "$pkgdir"/usr/lib/qt4/plugins
}

