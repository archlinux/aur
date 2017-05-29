# Maintainer:  saxonbeta saxonbeta at _gmail____com
# Contributor: Ray Rashif <schiv@archlinux.org>
# Contributor: Andrzej Giniewicz <gginiu@gmail.com>
# Contributor: Thomas Dziedzic < gostrc at gmail >

pkgname=vtk-qt4
pkgver=7.1.1
_majorver=7.1
pkgrel=1
pkgdesc='A software system for 3D computer graphics, image processing, and visualization. Linked against QT4'
arch=('i686' 'x86_64')
url='http://www.vtk.org/'
license=('BSD')
depends=('boost-libs' 'gcc-libs')
makedepends=('boost' 'cmake' 'ninja' 'java-environment' 'doxygen' 'gnuplot' 'tk' 'wget' 'python2-matplotlib' 'python2-twisted' 'python2-mpi4py' 'python2-autobahn' 'unixodbc' 'gdal' 'openmpi' 'mariadb' 'glew' 'ffmpeg' 'lesstif' 'jsoncpp' )
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
            'mariadb'
            'jsoncpp'
            'ffmpeg'
            'qtwebkit')
source=("http://www.vtk.org/files/release/${_majorver}/VTK-${pkgver}.tar.gz"
        "http://www.vtk.org/files/release/${_majorver}/VTKData-${pkgver}.tar.gz"
        "http://www.vtk.org/files/release/${_majorver}/VTKLargeData-${pkgver}.tar.gz"
       )

options=(staticlibs)
sha1sums=('8b3433e408ba3408354356dee4d295ea599a817c'
          'e0021056162e72e0dac20fa833ea4f9ee29dee48'
          '1ba20c351ac8237c168198a89504c3d93ea699c7'
          )

prepare() {
  cd "${srcdir}"/VTK-$pkgver

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
  # TODO: try to use system provided XDMF2, XDMF3, LIBPROJ4 NETCDF, HDF5
  # VTK fails to compile with recent netcdf-cxx package, VTK should be ported to the latest API
  # VTK does not work with XDMF2 compiled from git. TODO: make vtk compatible with system XDMF library. 
  # Note: VTK explicitly disables system GLEW dependency, it uses embedded sources with modifications
  # Note: system HDF5 is incompatible
  for lib in EXPAT FREETYPE JPEG PNG TIFF ZLIB LIBXML2 OGGTHEORA TWISTED ZOPE SIX AUTOBAHN MPI4PY JSONCPP GLEW; do
    cmake_system_flags+="-DVTK_USE_SYSTEM_${lib}:BOOL=ON "
  done
  
  # flags to use python2 instead of python which is 3.x.x on archlinux
  local cmake_system_python_flags="-DPYTHON_EXECUTABLE:PATH=/usr/bin/python2 -DPYTHON_INCLUDE_DIR:PATH=/usr/include/python2.7 -DPYTHON_LIBRARY:PATH=/usr/lib/libpython2.7.so"

  local _tkver=$(echo 'puts $tcl_version' | tclsh)
  
  cmake \
    -Wno-dev \
    -DCMAKE_SKIP_RPATH=ON \
    -DBUILD_SHARED_LIBS:BOOL=ON \
    -DCMAKE_INSTALL_PREFIX:FILEPATH=/opt/${pkgname} \
    -DBUILD_DOCUMENTATION:BOOL=ON \
    -DDOCUMENTATION_HTML_HELP:BOOL=ON \
    -DDOCUMENTATION_HTML_TARZ:BOOL=ON \
    -DBUILD_EXAMPLES:BOOL=OFF \
    -DVTK_USE_FFMPEG_ENCODER:BOOL=ON \
    -DVTK_BUILD_ALL_MODULES:BOOL=ON \
    -DVTK_USE_LARGE_DATA:BOOL=ON \
    -DVTK_USE_SYSTEM_HDF5:BOOL=OFF \
    -DVTK_QT_VERSION:STRING="4" \
    -DVTK_WRAP_JAVA:BOOL=ON \
    -DVTK_WRAP_PYTHON:BOOL=ON \
    -DVTK_WRAP_TCL:BOOL=ON \
    -DCMAKE_CXX_FLAGS="-D__STDC_CONSTANT_MACROS" \
    -DVTK_CUSTOM_LIBRARY_SUFFIX="" \
    -DVTK_INSTALL_INCLUDE_DIR:PATH=include \
    -DVTK_INSTALL_TCL_DIR=/opt/${pkgname}/lib/tcl${_tkver}/vtk/ \
    ${cmake_system_flags} \
    ${cmake_system_python_flags} \
    -DCMAKE_BUILD_TYPE=Release \
    "${srcdir}/VTK-$pkgver" \
    "${srcdir}/VTK-$pkgver" \
    -GNinja

  ninja
}

package() {
  cd "${srcdir}/build"

  DESTDIR="${pkgdir}" ninja install
  
  mkdir -p "$pkgdir/etc/ld.so.conf.d/"
  printf "%s\n" "/opt/${pkgname}/lib" > "$pkgdir/etc/ld.so.conf.d/$pkgname.conf"

  # Move the vtk.jar to the arch-specific location
  install -dv "${pkgdir}/opt/${pkgname}/share/java/vtk"
  mv -v "${pkgdir}/opt/${pkgname}/lib/vtk.jar" "${pkgdir}/opt/${pkgname}/share/java/vtk"
  rm -rf "${pkgdir}/opt/${pkgname}/lib/vtk-${_majorver}/java"
  
  # Install license
  install -dv "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 "${srcdir}/VTK-${pkgver}/Copyright.txt" "${pkgdir}/usr/share/licenses/${pkgname}"
  
  # Fix path of QtDesigner plugin
  install -dv "${pkgdir}/opt/${pkgname}/lib/qt4"
  mv "${pkgdir}"/opt/${pkgname}/plugins "${pkgdir}"/opt/${pkgname}/lib/qt4/plugins
}

