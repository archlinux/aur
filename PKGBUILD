# $Id$
# Maintainer: Grey Christoforo <first name at last name dot net>

pkgname=opencascade-rc
_pkgver="V7_5_1"
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
vtk9-fix
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
"${pkgname}-${pkgver}.tgz::https://git.dev.opencascade.org/gitweb/?p=occt.git;a=snapshot;h=refs/tags/${_pkgver};sf=tgz"
opencascade.sh
)
sha256sums=('3a43d8b50df78ade72786fa63bc8808deac6380189333663e7b4ef8558ae7739'
            '9acb2439f1f7f066c111adef5d9f34dcb19c906cc928f87b71eb194317948dfb')

prepare() {
  cd occt-${_pkgver}

  curl https://src.fedoraproject.org/rpms/opencascade/raw/rawhide/f/opencascade-cmake.patch | patch -p1
  
  # fix for None type build
  #sed '/OpenCASCADECompileDefinitionsAndFlags/d' -i CMakeLists.txt

  # fix for trying to write into the system during build
  #sed 's,if (EXISTS "${INSTALL_DIR}/${INSTALL_DIR_SCRIPT}/custom.${SCRIPT_EXT}"),if (0),g' -i CMakeLists.txt
}

build() {
  # prevents the build from trying to write into the system
  export DESTDIR="${srcdir}/garbage"
  rm -rf "${DESTDIR}"

  cmake -B build_dir -S occt-${_pkgver} -W no-dev -G Ninja \
    -D CMAKE_BUILD_TYPE=Release \
    -D CMAKE_INSTALL_PREFIX='/usr' \
    -D INSTALL_DIR_CMAKE=/usr/lib/cmake/opencascade \
    -D BUILD_WITH_DEBUG=OFF \
    -D BUILD_RELEASE_DISABLE_EXCEPTIONS=OFF \
    -D USE_FFMPEG=ON \
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

check() {
  cd occt-${_pkgver}
  #TODO
}

package() {
  cd occt-${_pkgver}
  local _installroot=/  # could put this in /opt/${pkgname}
  export DESTDIR="${pkgdir}${_installroot}"
  cmake --build ../build_dir -- install
  
  # remove the pollution from bin
  rm -rf "${pkgdir}/usr/bin/"*.sh
  
  install -m755 -Dt "${pkgdir}/etc/profile.d" "${srcdir}/opencascade.sh"
  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE_LGPL_21.txt
  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" OCCT_LGPL_EXCEPTION.txt
}
