# Maintainer:  Oliver Goethel <deezy>
# Contributor: George Eleftheriou <eleftg>
# Contributor: Mathias Anselmann <mathias.anselmann@gmail.com>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Michele Mocciola <mickele>
# Contributor: Simon Zilliken <simon____AT____zilliken____DOT____name>

pkgname=paraview
pkgver=5.1.2
pkgrel=4
pkgdesc='Parallel Visualization Application using VTK'
arch=('i686' 'x86_64')
url='http://www.paraview.org'
license=('custom')
depends=('qt5-tools' 'qt5-x11extras'  'qt5-xmlpatterns'
         'openmpi' 'python2' 'ffmpeg' 'boost' 'glew'
         'expat' 'freetype2' 'libjpeg' 'libxml2' 'libtheora' 'libpng' 'libtiff' 'zlib'
        )
makedepends=('cmake' 'mesa' 'gcc-fortran')
optdepends=('python2-matplotlib: Needed to support equation rendering using MathText markup language'
            'python2-numpy: Needed for using some filters such as "Python Calculator"')
source=("http://paraview.org/files/v${pkgver:0:3}/ParaView-v${pkgver}.tar.gz"
        'paraview_32bit.patch'
        'paraview-desktop.patch'
        'vtk_hdf5_internal.patch')
sha1sums=('449f104090b1fa84d1ee4b852dbfc6269cba9db4'
          'c25134330c582371e1009b51445cdb435144b53f'
          'd7da23daca34cd015294c4d2f702cdc4a81f0853'
          'cbadaa87cd775d1edb1dbc1db4dedb9f3cdc4fd5')

prepare() {
  cd "${srcdir}/ParaView-v${pkgver}"

  patch -p1 -i ../paraview_32bit.patch
  patch -p1 -i ../paraview-desktop.patch
  patch -p1 -i ../vtk_hdf5_internal.patch

  rm -rf "${srcdir}/build"
  mkdir -p "${srcdir}/build"
}

build() {
  cd "${srcdir}/build"

  # flags to enable system libs
  # add PROTOBUF when http://www.vtk.org/Bug/view.php?id=13656 gets fixed
  local cmake_system_flags=""
  for lib in EXPAT FREETYPE GLEW JPEG LIBXML2 OGGTHEORA PNG TIFF ZLIB; do
    cmake_system_flags+="-DVTK_USE_SYSTEM_${lib}:BOOL=ON "
  done

  # enable when http://paraview.org/Bug/view.php?id=12852 gets fixed:
  #-DCMAKE_SKIP_RPATH:BOOL=YES \
    cmake \
    -DBUILD_SHARED_LIBS:BOOL=ON \
    -DBUILD_TESTING:BOOL=OFF \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_C_COMPILER=mpicc \
    -DCMAKE_CXX_COMPILER=mpicxx \
    -DCMAKE_INSTALL_PREFIX:PATH=/usr \
    -DCMAKE_VERBOSE_MAKEFILE:BOOL=OFF \
    -DPARAVIEW_ENABLE_FFMPEG:BOOL=ON \
    -DPARAVIEW_ENABLE_PYTHON:BOOL=ON \
    -DPARAVIEW_PYTHON_VERSION=2 \
    -DPARAVIEW_QT_VERSION=5 \
    -DPARAVIEW_USE_MPI:BOOL=ON \
    -DPARAVIEW_USE_VISITBRIDGE:BOOL=ON \
    -DQT_HELP_GENERATOR:FILEPATH=/usr/bin/qhelpgenerator \
    -DQT_QMAKE_EXECUTABLE=qmake-qt5 \
    -DVISIT_BUILD_READER_CGNS:BOOL=OFF \
    -DVTK_PYTHON_VERSION=2 \
    -DVTK_QT_VERSION=5 \
    -DVTK_RENDERING_BACKEND:STRING=OpenGL2 \
    -DVTK_USE_SYSTEM_HDF5:BOOL=OFF \
    ${cmake_system_flags} \
    ../ParaView-v${pkgver}

  make

  #sed -i 's/share\/cmake\/hdf5/share\/cmake\/hdf5_paraview/g' VTK/ThirdParty/hdf5/vtkhdf5/cmake_install.cmake
}

package() {
  cd "${srcdir}/build"

  make DESTDIR="${pkgdir}" install

  #Install license
  install -Dm644 "${srcdir}/ParaView-v${pkgver}/License_v1.2.txt" "${pkgdir}/usr/share/licenses/paraview/LICENSE"
}
