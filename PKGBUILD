# Maintainer: eolianoe <eolianoe [at] gmail [DoT] com>
# Contributor: Ray Rashif <schiv@archlinux.org>
# Contributor: Andrzej Giniewicz <gginiu@gmail.com>
# Contributor: Thomas Dziedzic < gostrc at gmail >

# Based on the PKGBUILD of vtk in community

pkgname='vtk-visit'
_pkgname=vtk
_PKGNAME=VTK
pkgver=6.1.0
pkgrel=4
pkgdesc='A software system for 3D computer graphics, image processing, and visualization (legacy version for VisIt).'
arch=('i686' 'x86_64')
url='http://www.vtk.org/'
license=('BSD')
depends=('gcc-libs')
makedepends=('boost' 'cmake' 'java-environment' 'doxygen' 'gnuplot'
             'tk' 'wget'
             'python2-matplotlib' 'python2-twisted' 'python2-mpi4py' 'python2-autobahn'
             'unixodbc' 'gdal' 'openmpi' 'mariadb' 'glew' 'gl2ps'
             'ffmpeg' 'lesstif' 'qt5-webkit' 'jsoncpp')
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
provides=('vtk=6.1.0')
source=("http://www.vtk.org/files/release/${pkgver:0:3}/${_PKGNAME}-${pkgver}.tar.gz"
        'mesa.patch' 'hdf5.patch' 'vtk-type.patch' 'gdal2.patch' 'gcc6.patch')
sha256sums=('bd7df10a479606d529a8b71f466c44a2bdd11fd534c62ce0aa44fad91883fa34'
            '47fee3346c0d751ef58d1049c2c2160f741b3122058c0f0482ff6153c6c2f3f8'
            'd081f31463c1cab05e8e628550c89559236813af2b7511198e5768868ad601f0'
            '32a2a771cc6b0aa8c98399fa0b0294e2a1f98c15a5d7ad9cccf2bc50c68da492'
            '57ae622a7e281887f7948f4d5a53ff0e0301bbdf70594691dd74f20f14b6e882'
            '44ed94ca9fcc073f93938f44050a8af883f211b126fafaf860fa1be5af60c769')

prepare() {
  cd "${srcdir}/${_PKGNAME}-${pkgver}"

  # fix compilation errors:
  patch -Np1 -i "${srcdir}/mesa.patch"
  patch -Np1 -i "${srcdir}/hdf5.patch"
  patch -Np1 -i "${srcdir}/vtk-type.patch"
  patch -Np1 -i "${srcdir}/gdal2.patch"
  patch -Np1 -i "${srcdir}/gcc6.patch"

  # Use python2
  sed -e "s|#![ ]*/usr/bin/python$|#!/usr/bin/python2|" \
      -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
      -e "s|#![ ]*/bin/env python$|#!/usr/bin/env python2|" \
      -i $(find . -name '*.py')

  # Out of source build
  cd "${srcdir}"
  rm -rf -- build
  mkdir -p build
}

build() {
  cd "${srcdir}/build"

  # To help cmake find java
  export JAVA_HOME=/usr/lib/jvm/default

  # Flags to enable using system libs
  local vtk_system_flags=""
  for lib in AUTHOBAHN EXPAT FREETYPE GLEW GL2PS HDF5 JPEG JSONCPP LIBXML2 MPI4PY OGGTHEORA PNG SIX TIFF TWISTED ZLIB ZOPE; do
    vtk_system_flags+="-DVTK_USE_SYSTEM_${lib}:BOOL=ON "
  done

  cmake \
    -Wno-dev \
    -DBUILD_SHARED_LIBS:BOOL=ON \
    -DCMAKE_BUILD_TYPE:STRING=Release \
    -DCMAKE_INSTALL_PREFIX:FILEPATH=/opt/${_pkgname}-${pkgver} \
    -DPYTHON_EXECUTABLE:PATH=/usr/bin/python2 \
    -DPYTHON_INCLUDE_DIR:PATH=/usr/include/python2.7 \
    -DPYTHON_LIBRARY:PATH=/usr/lib/libpython2.7.so \
    -DPYTHON_VERSION:STRING=2 \
    -DVTK_BUILD_ALL_MODULES:BOOL=ON \
    -DVTK_USE_FFMPEG_ENCODER:BOOL=ON \
    ${vtk_system_flags} \
    -DVTK_QT_VERSION:STRING=5 \
    -DVTK_WRAP_JAVA:BOOL=ON \
    -DVTK_WRAP_PYTHON:BOOL=ON \
    -DVTK_WRAP_TCL:BOOL=ON \
    "${srcdir}/${_PKGNAME}-${pkgver}"

  make
}

package() {
  cd "${srcdir}/build"

  make DESTDIR="${pkgdir}" install

  # Install license
  install -dv "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 "${srcdir}/${_PKGNAME}-$pkgver/Copyright.txt"\
    "${pkgdir}/usr/share/licenses/${pkgname}"
}
