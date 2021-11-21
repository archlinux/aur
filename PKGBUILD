# $Id$
# Maintainer: Grey Christoforo <first name at last name dot net>

pkgname=opencascade-rc
_pkgver="V7_6_0"
pkgver=$(echo ${_pkgver} | sed 's,^V,,g;s,_,.,g')
pkgrel=1
pkgdesc="An object-oriented C++ class library designed for rapid production of sophisticated domain-specific CAD/CAM/CAE applications -- release candidates and dev snapshots"
arch=(x86_64)
url="https://dev.opencascade.org/"
license=('LGPL' 'custom:OCCTLGPLEXCEPTION')
provides=(opencascade)
conflicts=(opencascade opencascade-git)

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

#options=(!strip)

source=(
"${pkgname}-${pkgver}.tgz::https://git.dev.opencascade.org/gitweb/?p=occt.git;a=snapshot;h=refs/tags/${_pkgver};sf=tgz"
opencascade.sh
opencascade-cmake.patch
#"fix-freecad-build.patch::https://git.dev.opencascade.org/gitweb/?p=occt.git;a=patch;h=5e7632824302761b84cfceb5bfb2241d906d0eb4"
)
sha256sums=('e7f989d52348c3b3acb7eb4ee001bb5c2eed5250cdcceaa6ae97edc294f2cabd'
            '9acb2439f1f7f066c111adef5d9f34dcb19c906cc928f87b71eb194317948dfb'
            'b3a2583fd21576d454952894f92a2a9e710015051403a3759b4a2ccbfc78a048')

prepare() {
  cd occt-${_pkgver}

  #patch -p1 -i ../fix-freecad-build.patch # Fix build of FreeCAD

  patch -p1 -i ../opencascade-cmake.patch
  
  #curl https://src.fedoraproject.org/rpms/opencascade/raw/rawhide/f/opencascade-cmake.patch | patch -p1

  # fix for None type build
  sed '/OpenCASCADECompileDefinitionsAndFlags/d' -i CMakeLists.txt
}

build() {
  cd occt-${_pkgver}
  # prevents the build from trying to write into the system
  export DESTDIR="${srcdir}/garbage"
  rm -rf "${DESTDIR}"
  
  cmake -B build_dir -S . -W no-dev -G Ninja \
    -D CMAKE_BUILD_TYPE=None \
    -D CMAKE_INSTALL_PREFIX='/usr' \
    -D INSTALL_DIR_CMAKE=/usr/lib/cmake/opencascade \
    -D INSTALL_TEST_CASES=OFF \
    -D BUILD_WITH_DEBUG=OFF \
    -D BUILD_RELEASE_DISABLE_EXCEPTIONS=OFF \
    -D USE_FFMPEG=ON \
    -D USE_FREEIMAGE=ON \
    -D USE_RAPIDJSON=ON \
    -D USE_TBB=ON \
    -D USE_GLES2=ON \
    -D USE_VTK=ON \
    -D INSTALL_SAMPLES=ON \
    -D INSTALL_DOC_Overview=ON \
    -D BUILD_RESOURCES=ON \
    -D BUILD_SAMPLES_QT=ON \
    -D BUILD_Inspector=ON \
    -D 3RDPARTY_QT_DIR="/usr/lib" \
    -D 3RDPARTY_VTK_INCLUDE_DIR="/usr/include/vtk"

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
  
  # remove the pollution from bin
  rm -rf "${pkgdir}/usr/bin/"*.sh
  
  install -m644 -Dt "${pkgdir}"/etc/profile.d ${srcdir}/opencascade.sh
  install -m644 -Dt "${pkgdir}"/usr/share/licenses/${pkgname} LICENSE_LGPL_21.txt
  install -m644 -Dt "${pkgdir}"/usr/share/licenses/${pkgname} OCCT_LGPL_EXCEPTION.txt
}
