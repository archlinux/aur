# $Id$
# Maintainer: Grey Christoforo <first name at last name dot net>

pkgname=vtk9-java
pkgver=9.0.1
pkgrel=2
pkgdesc='A software system for 3D computer graphics, image processing, and visualization. version 9 with java bindings'
arch=('x86_64')
url="http://vtk.org"
license=('BSD')
depends=(
gdal
freetype2
jsoncpp
libharu
libjpeg-turbo
libogg
libpng
libtheora
libtiff
libxml2
lzip
python
sqlite
zlib
ospray
openimagedenoise
libxt
double-conversion
glew
eigen
expat
lz4
hdf5
proj
utf8cpp
pugixml
netcdf
pegtl
gl2ps
ffmpeg
libtheora
'java-runtime-openjdk=8'
)

makedepends=(
'java-environment-openjdk=8'
cmake
ninja
)

provides=(vtk)
conflicts=(vtk vtk9 vtk9-fix)
source=("${pkgname}-${pkgver}.tar.gz::https://gitlab.kitware.com/vtk/vtk/-/archive/v${pkgver}/vtk-v${pkgver}.tar.gz"
        "freetype.patch")
sha256sums=('15c269946a8a8ed578bbd28a59672c251089185d582cd1268658908bf414e017'
            'aa2daca929f4bc75809dcfe959b1bf6f8b81450a8c29892c73420711823d1438')

prepare() {
  cd vtk-v${pkgver}
  patch -p1 < "${srcdir}/freetype.patch"
    
  # https://gitlab.kitware.com/vtk/vtk/-/issues/18048
  curl https://src.fedoraproject.org/rpms/vtk/raw/rawhide/f/vtk-AllValues.patch | patch -p1
  
  curl https://src.fedoraproject.org/rpms/vtk/raw/rawhide/f/vtk-libharu.patch | patch -p1
  
  # https://gitlab.kitware.com/vtk/vtk/-/issues/18130
  curl https://gitlab.kitware.com/vtk/vtk/-/commit/29bfddf455fb909ce32ede0b8cddcb55e0bb794d.patch | patch -p1
  curl https://gitlab.kitware.com/vtk/vtk/-/commit/0325638832e35c8c8c6fc96e2c1d887aeea3dd43.patch | patch -p1

  # https://gitlab.kitware.com/vtk/vtk/-/issues/18194
  curl https://src.fedoraproject.org/rpms/vtk/raw/rawhide/f/vtk-limits.patch | patch -p1
  #sed 's,#include <vector>,#include <vector>\n#include <limits>,g' -i Common/Core/vtkGenericDataArrayLookupHelper.h
  #sed 's,#include <vector>,#include <vector>\n#include <limits>,g' -i Common/DataModel/vtkPiecewiseFunction.cxx
  #sed 's,#include <cmath>,#include <cmath>\n#include <limits>,g' -i Filters/HyperTree/vtkHyperTreeGridThreshold.cxx
  #sed 's,#include <vector>,#include <vector>\n#include <limits>,g' -i Rendering/Core/vtkColorTransferFunction.cxx
  #curl https://gitlab.kitware.com/vtk/vtk/-/commit/c7d6a8d81367a4ed92163c059aa3181386eabc24.patch | patch -p1

  # try new ospray version
  sed 's,VERSION 1.8,VERSION 2.5.0,g' -i Rendering/RayTracing/CMakeLists.txt
}

build() {
  export JAVA_HOME=/usr/lib/jvm/default
  local _tkver=$(echo 'puts $tcl_version' | tclsh)

  cmake -B build_dir -S vtk-v${pkgver} -W no-dev -G Ninja \
  -D CMAKE_CXX_FLAGS="-D__STDC_CONSTANT_MACROS" \
  -D CMAKE_BUILD_TYPE=None \
  -D CMAKE_SKIP_RPATH=OFF \
  -D CMAKE_SKIP_INSTALL_RPATH=ON \
  -D CMAKE_INSTALL_PREFIX=/usr \
  -D CMAKE_INSTALL_LIBDIR=lib \
  -D BUILD_SHARED_LIBS=ON \
  -D CMAKE_INSTALL_LICENSEDIR:PATH=share/licenses/vtk \
  -D VTK_USE_FFMPEG_ENCODER=ON \
  -D VTK_BUILD_ALL_MODULES=OFF \
  -D VTK_ENABLE_REMOTE_MODULES=OFF \
  -D VTK_USE_LARGE_DATA=ON \
  -D VTK_WRAP_JAVA=ON \
  -D VTK_WRAP_PYTHON=ON \
  -D VTK_PYTHON_VERSION=3 \
  -D VTK_CUSTOM_LIBRARY_SUFFIX="" \
  -D VTK_INSTALL_INCLUDE_DIR=include/vtk \
  -D VTK_INSTALL_PACKAGE_DIR=lib/cmake/vtk \
  -D VTK_VERSIONED_INSTALL=OFF \
  -D VTK_MODULE_USE_EXTERNAL_VTK_pegtl=OFF \
  -D VTK_GROUP_ENABLE_Imaging=YES \
  -D VTK_GROUP_ENABLE_Qt=YES \
  -D VTK_GROUP_ENABLE_Rendering=YES \
  -D VTK_GROUP_ENABLE_StandAlone=YES \
  -D VTK_GROUP_ENABLE_Views=YES \
  -D VTK_GROUP_ENABLE_Web=YES \
  -D VTK_MODULE_ENABLE_VTK_IOADIOS2=NO \
  -D VTK_MODULE_USE_EXTERNAL_VTK_libharu=NO \
  -D VTK_MODULE_ENABLE_VTK_RenderingOpenVR=NO \
  -D VTK_MODULE_ENABLE_VTK_CommonArchive=YES \
  -D VTK_MODULE_ENABLE_VTK_DomainsMicroscopy=NO \
  -D VTK_MODULE_ENABLE_VTK_GeovisGDAL=YES \
  -D VTK_MODULE_ENABLE_VTK_ImagingOpenGL2=YES \
  -D VTK_MODULE_ENABLE_VTK_InfovisBoost=YES \
  -D VTK_MODULE_ENABLE_VTK_InfovisBoostGraphAlgorithms=YES \
  -D VTK_MODULE_ENABLE_VTK_IOMySQL=YES \
  -D VTK_USE_EXTERNAL=ON \
  -D VTK_USE_TK=ON \
  -D VTK_USE_OGGTHEORA_ENCODER=ON \
  -D VTK_INSTALL_TCL_DIR=/usr/lib/tcl${_tkver}/vtk/

  cmake --build build_dir
}

package() {
  cd vtk-v${pkgver}
  local _destdir=/
  DESTDIR="${pkgdir}${_destdir}" cmake --build ../build_dir -- install
}
