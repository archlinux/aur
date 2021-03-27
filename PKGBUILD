# $Id$
# Maintainer: Grey Christoforo <first name at last name dot net>

pkgname=vtk9-fix
pkgver=9.0.1
pkgrel=1
pkgdesc='A software system for 3D computer graphics, image processing, and visualization'
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
java-runtime
)

makedepends=(
'java-runtime-openjdk=8'
cmake
ninja
)

provides=(vtk)
conflicts=(vtk vtk9)
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
}

# -D VTK_BUILD_ALL_MODULES=ON
build() {
  export JAVA_HOME=/usr/lib/jvm/default
  local _tkver=$(echo 'puts $tcl_version' | tclsh)
  cmake -B build_dir -S vtk-v${pkgver} \
  -W no-dev \
  -G Ninja \
  -D CMAKE_BUILD_TYPE=Release \
  -D CMAKE_INSTALL_PREFIX=/usr \
  -D CMAKE_INSTALL_LIBDIR=lib \
  -D CMAKE_INSTALL_LICENSEDIR:PATH=share/licenses/vtk \
  -D BUILD_SHARED_LIBS=ON \
  -D VTK_USE_FFMPEG_ENCODER=ON \
  -D VTK_CUSTOM_LIBRARY_SUFFIX="" \
  -D VTK_INSTALL_INCLUDE_DIR=include/vtk \
  -D VTK_INSTALL_PACKAGE_DIR=lib/cmake/vtk \
  -D VTK_VERSIONED_INSTALL=OFF \
  -D VTK_PYTHON_VERSION=3 \
  -D VTK_WRAP_PYTHON=ON \
  -D VTK_MODULE_USE_EXTERNAL_VTK_pegtl=OFF \
  -D VTK_GROUP_ENABLE_Imaging=YES \
  -D VTK_GROUP_ENABLE_Qt=YES \
  -D VTK_GROUP_ENABLE_Rendering=YES \
  -D VTK_GROUP_ENABLE_StandAlone=YES \
  -D VTK_GROUP_ENABLE_Views=YES \
  -D VTK_GROUP_ENABLE_Web=YES \
  -D VTK_MODULE_USE_EXTERNAL_VTK_libharu=NO \
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
  -D VTK_INSTALL_TCL_DIR=/usr/lib/tcl${_tkver}/vtk/ \
  -D VTK_WRAP_JAVA=ON

  cmake --build build_dir
}

package() {
  cd vtk-v${pkgver}
  local _destdir=/
  DESTDIR="${pkgdir}${_destdir}" cmake --build ../build_dir -- install
}
