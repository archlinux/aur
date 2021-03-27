# $Id$
# Maintainer: Grey Christoforo <first name at last name dot net>

pkgname=opencascade-git
pkgver=7.5.0.r188.gbbc5899a8c
pkgrel=1
pkgdesc="An object-oriented C++ class library designed for rapid production of sophisticated domain-specific CAD/CAM/CAE applications."
arch=(x86_64)
url="https://dev.opencascade.org/"
license=('LGPL' 'custom:OCCTLGPLEXCEPTION')
provides=(opencascade)
conflicts=(opencascade)

depends=(
tk
vtk
gl2ps
ffmpeg
freeimage
intel-tbb
)

makedepends=(
cmake
qt5-base
ninja
rapidjson
)
#checkdepends=()

source=(
"git+https://git.dev.opencascade.org/repos/occt.git"
)
sha256sums=('SKIP')

pkgver() {
  cd occt
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^V//g;s/_/./g'
}

prepare() {
  cd occt
  
  # fix for None type build
  sed '/OpenCASCADECompileDefinitionsAndFlags/d' -i CMakeLists.txt

  # fix for trying to write into the system during build
  sed 's,if (EXISTS "${INSTALL_DIR}/${INSTALL_DIR_SCRIPT}/custom.${SCRIPT_EXT}"),if (0),g' -i CMakeLists.txt
}

build() {
  INSTALL_DIR_BIN=bin
  INSTALL_DIR_LIB=lib

  BUILD_ADDITIONAL_TOOLKITS=
  BUILD_DOC_Overview=OFF
  BUILD_Inspector=OFF
  BUILD_LIBRARY_TYPE=Shared
  BUILD_PATCH=
  BUILD_RELEASE_DISABLE_EXCEPTIONS=ON
  BUILD_WITH_DEBUG=OFF
  BUILD_ENABLE_FPE_SIGNAL_HANDLER=ON

  BUILD_MODULE_ApplicationFramework=ON
  BUILD_MODULE_DataExchange=ON
  BUILD_MODULE_Draw=ON
  BUILD_MODULE_ModelingAlgorithms=ON
  BUILD_MODULE_ModelingData=ON
  BUILD_MODULE_Visualization=ON

  USE_FFMPEG=ON
  USE_FREEIMAGE=ON
  USE_GLES2=ON
  USE_RAPIDJSON=ON
  USE_TBB=ON
  USE_VTK=ON
  AUX_ARGS=

  cmake -B build_dir -S "occt" \
    -W no-dev \
    -G Ninja \
    -D CMAKE_BUILD_TYPE=None \
    -D CMAKE_INSTALL_PREFIX='/usr' \
    -D 3RDPARTY_FREETYPE_DIR:PATH="$FREETYPE_DIR" \
    -D BUILD_ADDITIONAL_TOOLKITS:STRING="$BUILD_ADDITIONAL_TOOLKITS" \
    -D BUILD_DOC_Overview:BOOL=$BUILD_DOC_Overview \
    -D BUILD_Inspector:BOOL=$BUILD_Inspector \
    -D BUILD_LIBRARY_TYPE:STRING=$BUILD_LIBRARY_TYPE \
    -D BUILD_MODULE_ApplicationFramework:BOOL=$BUILD_MODULE_ApplicationFramework \
    -D BUILD_MODULE_DataExchange:BOOL=$BUILD_MODULE_DataExchange \
    -D BUILD_MODULE_Draw:BOOL=$BUILD_MODULE_Draw \
    -D BUILD_MODULE_FoundationClasses:BOOL=ON \
    -D BUILD_MODULE_ModelingAlgorithms:BOOL=$BUILD_MODULE_ModelingAlgorithms \
    -D BUILD_MODULE_ModelingData:BOOL=$BUILD_MODULE_ModelingData \
    -D BUILD_MODULE_Visualization:BOOL=$BUILD_MODULE_Visualization \
    -D BUILD_PATCH:PATH="$BUILD_PATCH" \
    -D BUILD_RELEASE_DISABLE_EXCEPTIONS:BOOL=$BUILD_RELEASE_DISABLE_EXCEPTIONS \
    -D BUILD_WITH_DEBUG:BOOL=$BUILD_WITH_DEBUG \
    -D BUILD_ENABLE_FPE_SIGNAL_HANDLER:BOOL=$BUILD_ENABLE_FPE_SIGNAL_HANDLER \
    -D INSTALL_DIR_LAYOUT:STRING=Unix \
    -D INSTALL_DIR_BIN:STRING=$INSTALL_DIR_BIN \
    -D INSTALL_DIR_LIB:STRING=$INSTALL_DIR_LIB \
    -D INSTALL_DIR_CMAKE:PATH=/usr/lib/cmake/opencascade \
    -D USE_FFMPEG:BOOL=$USE_FFMPEG \
    -D USE_FREEIMAGE:BOOL=$USE_FREEIMAGE \
    -D USE_GLES2:BOOL=$USE_GLES2 \
    -D USE_RAPIDJSON:BOOL=$USE_RAPIDJSON \
    -D USE_TBB:BOOL=$USE_TBB \
    -D INSTALL_VTK=False \
    -D CMAKE_CXX_FLAGS="-DVTK_MAJOR_VERSION=9" \
    -D 3RDPARTY_VTK_LIBRARY_DIR:PATH="/usr/lib" \
    -D 3RDPARTY_VTK_INCLUDE_DIR:PATH="/usr/include" \
    -D USE_VTK:BOOL=$USE_VTK

  cmake --build build_dir
}

check() {
  cd occt
  #TODO
}

package() {
  cd occt
  local _destdir=/  # maybe this belongs in /opt/${pkgname}?
  DESTDIR="${pkgdir}${_destdir}" cmake --build ../build_dir -- install
  install -Dt "${pkgdir}/usr/share/licenses/${pkgname}" -m644 LICENSE_LGPL_21.txt
  install -Dt "${pkgdir}/usr/share/licenses/${pkgname}" -m644 OCCT_LGPL_EXCEPTION.txt
}
