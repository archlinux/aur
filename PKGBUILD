# Maintainer:  Oliver Goethel <deezy>
# Contributor: George Eleftheriou <eleftg>
# Contributor: Mathias Anselmann <mathias.anselmann@gmail.com>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Michele Mocciola <mickele>
# Contributor: Simon Zilliken <simon____AT____zilliken____DOT____name>

pkgname=paraview
pkgver=5.1.0
pkgrel=2
pkgdesc='Parallel Visualization Application using VTK'
arch=('i686' 'x86_64')
url='http://www.paraview.org'
license=('custom')
depends=('qt5-tools' 'qt5-x11extras' 'openmpi' 'python2' 'ffmpeg' 'boost' 'glew'
	 'expat' 'freetype2' 'libjpeg' 'libxml2' 'libtheora' 'libpng' 'libtiff' 'zlib')
makedepends=('cmake' 'mesa' 'gcc-fortran')
optdepends=('python2-matplotlib: Needed to support equation rendering using MathText markup language'
	        'python2-numpy: Needed for using some filters such as "Python Calculator"')
source=("http://paraview.org/files/v${pkgver:0:3}/ParaView-v${pkgver}.tar.gz"
	    'paraview_32bit.patch'
	    '0001-find_hdf5.patch'
	    'paraview-desktop.patch')
sha1sums=('1076c189f07308fe11f82079c07a0771542c5ff7'
	  'c25134330c582371e1009b51445cdb435144b53f'
	  '3f8701c349194cff12f5d1104fbc070a52dd3da1'
	  'd7da23daca34cd015294c4d2f702cdc4a81f0853')

prepare() {
  cd "${srcdir}/ParaView-v${pkgver}"
  patch -p1 -i ../paraview_32bit.patch
  
  patch -p1 -i ../paraview-desktop.patch

  # Find HDF before the check (for NetCDF)
  patch "VTK/ThirdParty/netcdf/vtknetcdf/CMakeLists.txt" \
    "../0001-find_hdf5.patch"
  
  rm -rf "${srcdir}/build"
  mkdir "${srcdir}/build"
  cd "${srcdir}/build"
}

build() {
  cd "${srcdir}/build"
  
  # flags to enable system libs
  # add PROTOBUF when http://www.vtk.org/Bug/view.php?id=13656 gets fixed
  local cmake_system_flags=""
  for lib in EXPAT FREETYPE GLEW JPEG LIBXML2 OGGTHEORA PNG TIFF ZLIB; do
    cmake_system_flags+="-DVTK_USE_SYSTEM_${lib}:BOOL=ON "
  done

   # flags to use python2 instead of python which is 3.x.x on archlinux
   local cmake_system_python_flags="-DPYTHON_EXECUTABLE:PATH=/usr/bin/python2 \
   	 -DPYTHON_INCLUDE_DIR:PATH=/usr/include/python2.7 -DPYTHON_LIBRARY:PATH=/usr/lib/libpython2.7.so"

   # flags to use ffmpeg2.8
   local ffmpeg_compat_flags="-DFFMPEG_INCLUDE_DIR:PATH=/usr/include/ \
   	 -DFFMPEG_avcodec_LIBRARY=/usr/lib/libavcodec.so \
   	 -DFFMPEG_avformat_LIBRARY=/usr/lib/libavformat.so \
   	 -DFFMPEG_avutil_LIBRARY=/usr/lib/libavutil.so \
   	 -DFFMPEG_swscale_LIBRARY=/usr/lib/libswscale.so"

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
   -DPARAVIEW_USE_MPI:BOOL=ON \
   -DPARAVIEW_USE_VISITBRIDGE:BOOL=ON \
   -DPARAVIEW_QT_VERSION=5 \
   -DVTK_QT_VERSION=5 \
   -DQT_HELP_GENERATOR:FILEPATH=/usr/lib/qt/bin/qhelpgenerator \
   -DQT_QMAKE_EXECUTABLE=qmake-qt5 \
   -DVISIT_BUILD_READER_CGNS:BOOL=OFF \
   -DVTK_RENDERING_BACKEND:STRING=OpenGL2 \
   -DVTK_USE_SYSTEM_HDF5:BOOL=OFF \
   ${cmake_system_flags} \
   ${cmake_system_python_flags} \
   ${ffmpeg_compat_flags} \
   ../ParaView-v${pkgver}

   make
}

package() {
  cd "${srcdir}/build"

  make DESTDIR="${pkgdir}" install

  #Install license
  install -Dm644 "${srcdir}/ParaView-v${pkgver}/License_v1.2.txt" "${pkgdir}/usr/share/licenses/paraview/LICENSE"
}
