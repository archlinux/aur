# $Id$
# Maintainer: Grey Christoforo <first name at last name dot net>

pkgname=opencascade-cadquery
_pkgver="V7_6_1"
pkgver=$(echo ${_pkgver} | sed 's,^V,,g;s,_,.,g')
pkgrel=1
pkgdesc="Opencascade for python-cadquery"
arch=(x86_64)
url="https://dev.opencascade.org/"
license=('LGPL' 'custom:OCCTLGPLEXCEPTION')

depends=(
tk
vtk
gl2ps
"ffmpeg4.4"
freeimage
intel-tbb
openmpi
glew
)

makedepends=(
adios2
boost
cmake
eigen
gdal
glew
libharu
liblas
openvr
pdal
proj
pugixml
python
python-mpi4py
qt5-base
rapidjson
unixodbc
utf8cpp
ninja
)

source=(
"${pkgname}-${pkgver}.tgz::https://git.dev.opencascade.org/gitweb/?p=occt.git;a=snapshot;h=refs/tags/${_pkgver};sf=tgz"
cmake.patch
opencascade-tbb-2021.patch
)
sha256sums=('c111c635fa4cae05821640f5afbbf362efaee8dc51fcbee953866eec7482cd6a'
            'b3a2583fd21576d454952894f92a2a9e710015051403a3759b4a2ccbfc78a048'
            'b0c4601fd9b2905e4b3bc3ed8af1493960c80bfe10332a0c562c59786efd57a2')

prepare() {
  cd occt-${_pkgver}

  patch -p1 -i ../cmake.patch
  #curl https://src.fedoraproject.org/rpms/opencascade/raw/rawhide/f/opencascade-cmake.patch | patch -p1

  # fix for tbb changes
  patch -p1 -i ../opencascade-tbb-2021.patch
  #curl https://raw.githubusercontent.com/archlinux/svntogit-community/packages/opencascade/trunk/opencascade-tbb-2021.patch | patch -p1

  # fix for trying to write into the system during build
  sed 's,if (EXISTS "${INSTALL_DIR}/${INSTALL_DIR_SCRIPT}/custom.${SCRIPT_EXT}"),if (0),g' -i CMakeLists.txt

  # fix for None type build
  sed '/OpenCASCADECompileDefinitionsAndFlags/d' -i CMakeLists.txt
}

build() {
  cd occt-${_pkgver}
  # prevents the build from trying to write into the system
  export DESTDIR="${srcdir}/garbage"
  rm -rf "${DESTDIR}"

  _install_prefix="/opt/opencascade-cadquery/usr"
  #_install_prefix="/usr"

  cmake -B build_dir -S . -W no-dev -G Ninja \
    -D CMAKE_BUILD_TYPE=None \
    -D CMAKE_INSTALL_PREFIX="${_install_prefix}" \
    -D INSTALL_DIR_CMAKE="${_install_prefix}/lib/cmake/opencascade" \
    -D INSTALL_TEST_CASES=OFF \
    -D BUILD_WITH_DEBUG=OFF \
    -D BUILD_RELEASE_DISABLE_EXCEPTIONS=OFF \
    -D USE_FFMPEG=ON \
    -D USE_FREEIMAGE=ON \
    -D USE_RAPIDJSON=ON \
    -D USE_TBB=ON \
    -D USE_GLES2=OFF \
    -D USE_VTK=ON \
    -D INSTALL_SAMPLES=OFF \
    -D INSTALL_DOC_Overview=OFF \
    -D BUILD_RESOURCES=ON \
    -D BUILD_SAMPLES_QT=OFF \
    -D BUILD_Inspector=OFF \
    -D 3RDPARTY_VTK_INCLUDE_DIR="/usr/include/vtk" \
    -D 3RDPARTY_FFMPEG_INCLUDE_DIR="/usr/include/ffmpeg4.4" \
    -D CMAKE_LIBRARY_PATH="/usr/lib/ffmpeg4.4"

  cmake --build build_dir
  rm -rf "${DESTDIR}"
}

check() {
  cd occt-${_pkgver}
  # prevent the current environment from skewing the testing
  unset "${!CSF@}"
  unset "${!DRAW@}"
  unset CASROOT

  # graphics testing does not seem to go well (some seem to stall forever)
  rm -rf tests/bugs/vis
  rm -rf tests/perf/vis
  rm -rf tests/v3d

  cd build_dir
  cp draw.sh check.sh
  sed 's,DRAWEXE,lin64/gcc/bin/DRAWEXE -b -f testgrid.tcl,g' -i check.sh  # possibly try with -v instead of -b
  echo testgrid > testgrid.tcl
  ./check.sh
}

package() {
  cd occt-${_pkgver}
  DESTDIR="${pkgdir}" cmake --install build_dir

  install -m644 -Dt "${pkgdir}"/usr/share/licenses/${pkgname} LICENSE_LGPL_21.txt
  install -m644 -Dt "${pkgdir}"/usr/share/licenses/${pkgname} OCCT_LGPL_EXCEPTION.txt
}
