# $Id$
# Maintainer: Grey Christoforo <first name at last name dot net>

pkgname=opencascade-git
pkgver=8.0.0.rc1.r33.g22d437b771
pkgrel=1
pkgdesc="An object-oriented C++ class library designed for rapid production of sophisticated domain-specific CAD/CAM/CAE applications."
arch=(x86_64)
url="https://dev.opencascade.org/"
license=('LGPL' 'custom:OCCTLGPLEXCEPTION')
depends=(
  tk
  vtk
  gl2ps
  freeimage
  intel-tbb
)
makedepends=(
  git
  cmake
  qt5-base
  ninja
  rapidjson
  openmpi
  nlohmann-json
)
provides=(opencascade)
conflicts=(opencascade)
source=("git+https://git.dev.opencascade.org/repos/occt.git"
        opencascade.sh)
sha256sums=('SKIP'
            '2064536a85d46fee368a8f1a712b2c6c77ca79c5bffcc68cba79d70d36efa2f4')

pkgver() {
  cd occt
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^V//g;s/_/./g'
}

prepare() {
  cd occt

  # fix for None type build
  #sed '/OpenCASCADECompileDefinitionsAndFlags/d' -i CMakeLists.txt

  # fix for trying to write into the system during build
  #sed 's,if (EXISTS "${INSTALL_DIR}/${INSTALL_DIR_SCRIPT}/custom.${SCRIPT_EXT}"),if (0),g' -i CMakeLists.txt
}

build() {
  # prevents the build from trying to write into the system
  export DESTDIR="${srcdir}/garbage"
  rm -rf "${DESTDIR}"

  cmake -B build_dir -S occt -W no-dev -G Ninja \
    -D CMAKE_BUILD_TYPE=Release \
    -D CMAKE_INSTALL_PREFIX='/usr' \
    -D INSTALL_DIR_CMAKE=lib/cmake/opencascade \
    -D BUILD_WITH_DEBUG=OFF \
    -D BUILD_RELEASE_DISABLE_EXCEPTIONS=OFF \
    -D USE_FFMPEG=OFF \
    -D USE_FREEIMAGE=ON \
    -D USE_RAPIDJSON=ON \
    -D USE_TBB=ON \
    -D USE_GLES2=OFF \
    -D USE_VTK=ON \
    -D INSTALL_VTK=False \
    -D 3RDPARTY_VTK_LIBRARY_DIR=/usr/lib \
    -D 3RDPARTY_VTK_INCLUDE_DIR=/usr/include

  cmake --build build_dir
  rm -rf "${DESTDIR}"
}

package() {
  cd occt
  local _installroot=/  # could put this in /opt/${pkgname}
  export DESTDIR="${pkgdir}${_installroot}"
  cmake --build ../build_dir -- install

  # remove the pollution from bin
  rm -rf "${pkgdir}/usr/bin/"*.sh

  install -m755 -Dt "${pkgdir}/etc/profile.d" "${srcdir}/opencascade.sh"
  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE_LGPL_21.txt
  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" OCCT_LGPL_EXCEPTION.txt
}
