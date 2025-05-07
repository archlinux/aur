pkgname=opencascade-cadquery
pkgver=7.7.2
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

local _commit=cec1ecd0c9f3b3d2572c47035d11949e8dfa85e2
source=(
  "$pkgname::git+https://github.com/Open-Cascade-SAS/OCCT.git#commit=$_commit"
  https://gitlab.archlinux.org/archlinux/packaging/packages/opencascade/-/raw/74734cd01021d87a6ddd0a208c449a44685f5425/cmake-fix-variable.patch
)

sha256sums=('SKIP'
            '8d74dc87462164093a4cc3a427919dcc1f7f90a2a37fbae50357d9635f358812')

prepare() {
  cd ${pkgname}

  patch -p1 -i ../cmake-fix-variable.patch

  # fix for trying to write into the system during build
  sed 's,if (EXISTS "${INSTALL_DIR}/${INSTALL_DIR_SCRIPT}/custom.${SCRIPT_EXT}"),if (0),g' -i CMakeLists.txt

  # fix for None type build
  sed '/OpenCASCADECompileDefinitionsAndFlags/d' -i CMakeLists.txt

  # use newer tbb
  sed 's,TBB 2021.5,TBB 2021.10,' -i adm/cmake/tbb.cmake

  # fix tbb can't be found
  sed 's,IMPORTED_LOCATION_RELEASE,IMPORTED_LOCATION_NONE,' -i adm/cmake/tbb.cmake
}

build() {
  cd ${pkgname}
  # prevents the build from trying to write into the system
  export DESTDIR="${srcdir}/garbage"
  rm -rf "${DESTDIR}"

  _install_prefix="/opt/opencascade-cadquery/usr"
  #_install_prefix="/usr"


  CXXFLAGS="${CXXFLAGS} -fpermissive" cmake -B build_dir -S . -W no-dev -G Ninja \
    -D CMAKE_BUILD_TYPE=Release \
    -D CMAKE_INSTALL_PREFIX="${_install_prefix}" \
    -D CMAKE_POLICY_VERSION_MINIMUM=3.5 \
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
  cd ${pkgname}
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
  cd ${pkgname}
  DESTDIR="${pkgdir}" cmake --install build_dir

  install -m644 -Dt "${pkgdir}"/usr/share/licenses/${pkgname} LICENSE_LGPL_21.txt
  install -m644 -Dt "${pkgdir}"/usr/share/licenses/${pkgname} OCCT_LGPL_EXCEPTION.txt
}
