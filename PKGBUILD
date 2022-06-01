# $Id$
# Maintainer: Mathieu Westphal <mathieu.westphal@gmail.com>

# Copied from opencascade-rc
pkgname=opencascade-f3d
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
)

makedepends=(
cmake
ninja
)

#checkdepends=()

#options=(!strip)

source=(
"${pkgname}-${pkgver}.tgz::https://git.dev.opencascade.org/gitweb/?p=occt.git;a=snapshot;h=refs/tags/${_pkgver};sf=tgz"
opencascade-cmake.patch
#"fix-freecad-build.patch::https://git.dev.opencascade.org/gitweb/?p=occt.git;a=patch;h=5e7632824302761b84cfceb5bfb2241d906d0eb4"
)
sha256sums=('e7f989d52348c3b3acb7eb4ee001bb5c2eed5250cdcceaa6ae97edc294f2cabd'
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
    -D BUILD_ADDITIONAL_TOOLKITS="TKSTEP;TKIGES;TKMesh" \
    -D BUILD_MODULE_ApplicationFramework=OFF \
    -D BUILD_MODULE_DataExchange=OFF \
    -D BUILD_MODULE_Draw=OFF \
    -D BUILD_MODULE_FoundationClasses=OFF \
    -D BUILD_MODULE_ModelingAlgorithms=OFF \
    -D BUILD_MODULE_ModelingData=OFF \
    -D BUILD_MODULE_Visualization=OFF \
    -D INSTALL_TEST_CASES=OFF \
    -D BUILD_WITH_DEBUG=OFF \
    -D BUILD_RELEASE_DISABLE_EXCEPTIONS=OFF 

  cmake --build build_dir
  rm -rf "${DESTDIR}"
}

package() {
  cd occt-${_pkgver}
  DESTDIR="${pkgdir}" cmake --install build_dir
  
  # remove the pollution from bin
  rm -rf "${pkgdir}/usr/bin/"*.sh
  
  install -m644 -Dt "${pkgdir}"/usr/share/licenses/${pkgname} LICENSE_LGPL_21.txt
  install -m644 -Dt "${pkgdir}"/usr/share/licenses/${pkgname} OCCT_LGPL_EXCEPTION.txt
}
