# Maintainer: gucong <gucong43216@gmail.com>
# Contributor: Oliver Goethel <deezy>
# Contributor: eolianoe eolianoe <eolianoe [at] gmail [DoT] com>
# Contributor: George Eleftheriou <eleftg>
# Contributor: Mathias Anselmann <mathias.anselmann@gmail.com>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Michele Mocciola <mickele>
# Contributor: Simon Zilliken <simon____AT____zilliken____DOT____name>
# Contributor: chuckdaniels

pkgname=paraview-manta
_pkgver=5.4.0
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc='Parallel Visualization Application using VTK (with MantaView plugin, Qt4, legacy OpenGL)'
arch=('i686' 'x86_64')
url='http://www.paraview.org'
license=('custom')
depends=('qt4'
         'openmpi' 'python-matplotlib' 'python-numpy'
         'ffmpeg' 'boost' 'glew' 'protobuf'
	     'expat' 'freetype2' 'libjpeg' 'libxml2' 'libtheora' 'libpng' 'libtiff' 'zlib'
         'ospray' 'cgns'
         'manta' 'intel-tbb' 'lz4')
makedepends=('cmake' 'mesa' 'gcc-fortran' 'ninja')
conflicts=('paraview')
provides=('paraview')
source=("ParaView-v${_pkgver}.tar.gz::http://paraview.org/files/v${pkgver:0:3}/ParaView-v${_pkgver}.tar.gz")
sha1sums=('d1bc9112d76f603d3232069b4ea9c507c4e1b1a7')

prepare() {
  cd "${srcdir}/ParaView-v${_pkgver}"

  rm -rf "${srcdir}/build"
  mkdir -p "${srcdir}/build"
}

build() {
  cd "${srcdir}/build"
  
  # flags to enable system libs
  local VTK_USE_SYSTEM_LIB=""
  for lib in CGNS EXPAT FREETYPE GLEW HDF5 JPEG LIBXML2 OGGTHEORA PNG PROTOBUF TIFF ZLIB LZ4; do
    VTK_USE_SYSTEM_LIB+="-DVTK_USE_SYSTEM_${lib}:BOOL=ON "
  done

  cmake \
      -DBUILD_DOCUMENTATION:BOOL=OFF \
      -DBUILD_EXAMPLES:BOOL=ON \
      -DBUILD_SHARED_LIBS:BOOL=ON \
      -DBUILD_TESTING:BOOL=OFF \
      -DCMAKE_BUILD_TYPE:STRING=Release \
      -DCMAKE_C_COMPILER:STRING=mpicc \
      -DCMAKE_CXX_COMPILER:STRING=mpicxx \
      -DCMAKE_INSTALL_PREFIX:PATH=/usr \
      -DOSPRAY_INSTALL_DIR:PATH=/usr \
      -DPARAVIEW_ENABLE_CGNS:BOOL=ON \
      -DPARAVIEW_ENABLE_FFMPEG:BOOL=ON \
      -DPARAVIEW_ENABLE_MATPLOTLIB:BOOL=ON \
      -DPARAVIEW_ENABLE_PYTHON:BOOL=ON \
      -DPARAVIEW_INSTALL_DEVELOPMENT_FILES:BOOL=ON \
      -DPARAVIEW_QT_VERSION:STRING=4 \
      -DPARAVIEW_USE_MPI:BOOL=ON \
      -DPARAVIEW_USE_VISITBRIDGE:BOOL=OFF \
      -DPARAVIEW_USE_OSPRAY:BOOL=ON \
      -DVISIT_BUILD_READER_CGNS:BOOL=ON \
      -DVTK_PYTHON_FULL_THREADSAFE:BOOL=ON \
      -DVTK_PYTHON_VERSION:STRING=3 \
      -DVTK_QT_VERSION:STRING=4 \
      -DVTK_RENDERING_BACKEND:STRING=OpenGL \
      -DVTK_SMP_IMPLEMENTATION_TYPE:STRING=OpenMP \
      -DPARAVIEW_BUILD_PLUGIN_MantaView:BOOL=ON \
      -DMANTA_BUILD:PATH=/usr \
      -DMANTA_SOURCE:PATH=/usr/include \
      ${VTK_USE_SYSTEM_LIB} \
      -GNinja \
      ../ParaView-v${_pkgver}

  ninja ${MAKEFLAGS}
}

package() {
  cd "${srcdir}/build"

  DESTDIR="${pkgdir}" ninja install

  #Install license
  install -Dm644 "${srcdir}/ParaView-v${_pkgver}/License_v1.2.txt" "${pkgdir}/usr/share/licenses/paraview/LICENSE"

  # Remove IceT man pages to avoid conflicts
  rm -- "${pkgdir}/usr/share/man/man3/icet"*.3
}
