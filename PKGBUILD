# Maintainer: George Eleftheriou <eleftg>
# Contributor: Mathias Anselmann <mathias.anselmann@gmail.com>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Michele Mocciola <mickele>
# Contributor: Simon Zilliken <simon____AT____zilliken____DOT____name>

pkgname=paraview-manta
pkgver=5.2.0
pkgrel=1
pkgdesc='Parallel Visualization Application using VTK (with MantaView plugin, Qt4, legacy OpenGL backend)'
arch=('i686' 'x86_64')
url='http://www.paraview.org'
license=('custom')
depends=('qtwebkit' 'openmpi' 'python2' 'ffmpeg' 'boost' 'glew'
	     'expat' 'freetype2' 'libjpeg' 'libxml2' 'libtheora' 'libpng' 'libtiff' 'zlib'
         'manta' 'ospray')
makedepends=('cmake' 'mesa' 'gcc-fortran')
optdepends=('python2-matplotlib: Needed to support equation rendering using MathText markup language'
	        'python2-numpy: Needed for using some filters such as "Python Calculator"')
conflicts=('paraview')
provides=('paraview')
source=("http://paraview.org/files/v${pkgver:0:3}/ParaView-v${pkgver}.tar.gz"
        'paraview-desktop.patch'
        'paraview-mantaview.patch')
sha1sums=('c578cdad44673cd3311bd5c5fec52075ea923701'
          'd7da23daca34cd015294c4d2f702cdc4a81f0853'
          'edd6f34c0a715f86e2304bb3458afb4f17562528')

prepare() {
  cd "${srcdir}/ParaView-v${pkgver}"

  patch -p1 -i ../paraview-desktop.patch
  patch -p1 -i ../paraview-mantaview.patch

  rm -rf "${srcdir}/build"
  mkdir "${srcdir}/build"
  cd "${srcdir}/build"
}

build() {
  cd "${srcdir}/build"
  
  # flags to enable system libs
  # add PROTOBUF when https://gitlab.kitware.com/paraview/paraview/issues/13656 gets fixed
  local VTK_USE_SYSTEM_LIB=""
  for lib in EXPAT FREETYPE GLEW JPEG LIBXML2 OGGTHEORA PNG TIFF ZLIB; do
    VTK_USE_SYSTEM_LIB+="-DVTK_USE_SYSTEM_${lib}:BOOL=ON "
  done

  cmake \
      -DBUILD_SHARED_LIBS:BOOL=ON \
      -DBUILD_TESTING:BOOL=OFF \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_C_COMPILER=mpicc \
      -DCMAKE_CXX_COMPILER=mpicxx \
      -DCMAKE_INSTALL_PREFIX:PATH=/usr \
      -DCMAKE_VERBOSE_MAKEFILE:BOOL=OFF \
      -DPARAVIEW_ENABLE_CGNS:BOOL=OFF \
      -DPARAVIEW_ENABLE_FFMPEG:BOOL=ON \
      -DPARAVIEW_ENABLE_PYTHON:BOOL=ON \
      -DPARAVIEW_PYTHON_VERSION=2 \
      -DPARAVIEW_QT_VERSION=4 \
      -DPARAVIEW_USE_MPI:BOOL=ON \
      -DPARAVIEW_USE_VISITBRIDGE:BOOL=ON \
      -DVISIT_BUILD_READER_CGNS:BOOL=OFF \
      -DVTK_PYTHON_VERSION=2 \
      -DVTK_QT_VERSION=4 \
      -DVTK_RENDERING_BACKEND:STRING=OpenGL \
      -DVTK_SMP_IMPLEMENTATION_TYPE:STRING=OpenMP \
      -DVTK_USE_SYSTEM_HDF5:BOOL=OFF \
      -DPARAVIEW_INSTALL_DEVELOPMENT_FILES:BOOL=ON \
      -DPARAVIEW_USE_OSPRAY=ON \
      -DOSPRAY_INSTALL_DIR:PATH=/usr \
      -DPARAVIEW_BUILD_PLUGIN_MantaView:BOOL=ON \
      -DMANTA_BUILD:PATH=/usr \
      -DMANTA_SOURCE:PATH=/usr/include \
      ${VTK_USE_SYSTEM_LIB} \
      ../ParaView-v${pkgver}

  make
}

package() {
  cd "${srcdir}/build"

  make DESTDIR="${pkgdir}" install

  #Install license
  install -Dm644 "${srcdir}/ParaView-v${pkgver}/License_v1.2.txt" "${pkgdir}/usr/share/licenses/paraview/LICENSE"
}
