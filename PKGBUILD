#!/hint/bash
# Maintainer : bartus <arch-user-repoᘓbartus.33mail.com>

# Configuration.
_CMAKE_FLAGS+=(
              -DCMAKE_INSTALL_PREFIX=/usr
              -DCMAKE_INSTALL_LIBDIR=lib
              -DEIGEN_INCLUDE_DIR_HINTS=/usr/include/eigen3
              -DFLANN_INCLUDE_DIR_HINTS=/usr/include/flann
              -D{COINUTILS,CLP,OSI}_INCLUDE_DIR_HINTS=/usr/include/coin
              -DLEMON_INCLUDE_DIR_HINTS=/usr/include/lemon
              -DCERES_DIR=/usr/include/ceres
              -DALICEVISION_BUILD_DOC=OFF
             )
# shellcheck disable=SC2206
[[ -v CUDA_ARCH ]] && _cc_list=(${CUDA_ARCH})
# Alow user to build without cuda
if ((DISABLE_CUDA)); then
  _CMAKE_FLAGS+=('-DALICEVISION_USE_CUDA=OFF')
  # Disable component that could yield cuda.
else
  makedepends+=('cuda')
  _CMAKE_FLAGS+=( -DCUDA_HOST_COMPILER=/opt/cuda/bin/gcc )
  if [[ -v _cc_list ]]; then
    _CMAKE_FLAGS+=( -DALICEVISION_CUDA_CC_LIST="$(IFS=';'; echo "${_cc_list[*]}";)" )
  fi
fi


_name=alice-vision
_fragment="#branch=develop"

pkgname=${_name}-git
pkgver=2.3.1.r82.ge80604eaf
pkgrel=1
pkgdesc="Photogrammetric Computer Vision Framework which provides a 3D Reconstruction and Camera Tracking algorithms"
arch=('i686' 'x86_64')
url="https://alicevision.github.io/"
license=('MPL2' 'MIT')
groups=()
conflicts=("${_name}" geogram uncertainty-framework)
provides=("${_name}" geogram uncertainty-framework)
depends+=('alembic' 'boost-libs' 'coin-or-clp' 'flann' 'google-glog' 'opencv' 'openimageio' 'opengv' )
depends+=('glu' 'glfw-x11') # geogram deps.
depends+=('magma' 'ceres-solver') # uncertaintyTE deps.
makedepends+=('ninja' 'boost' 'eigen' 'freetype2' 'gflags' 'doxygen' 'python-sphinx' 'coin-or-coinutils' 'coin-or-lemon' 'git' 'cmake')
source=("${pkgname}::git+https://github.com/alicevision/AliceVision.git${_fragment}"
        "ute_lib::git+https://github.com/alicevision/uncertaintyTE.git"
        "geogram::git+https://github.com/alicevision/geogram.git"
        "FindOpenGV.cmake.patch"
        )
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            '2740fc6890a62f74367df357e132dc95bcd276528d828d51d66c4689e183ceec')


pkgver() {
  cd "${pkgname}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}


prepare() {
  cd "${srcdir}/${pkgname}"
  git submodule update --init
#  git config submodule.src/dependencies/MeshSDFilter.url ${srcdir}/MeshSDFilter
#  git config submodule.src/dependencies/nanoflann.url
#  git config submodule.src/dependencies/osi_clp.url
# fix doc build
  sed -i '/^ *install.*doc/s/doc/htmlDoc/' src/CMakeLists.txt
  #patch FindOpenGV.cmake to use Eigen3 instear of Eigen
  git apply -v "$srcdir"/FindOpenGV.cmake.patch
}


build() {
  msg2 "Build uncertaintyTE library"
  cmake -DCMAKE_INSTALL_PREFIX=/ -DMAGMA_ROOT=/usr -G Ninja -S ute_lib -B ute_build
# shellcheck disable=SC2030,SC2031,SC2046 # ninja call won't work with shell substitution in quotes.
  ninja $([ -v MAKEFLAGS ] || echo -j1) -C ute_build
  DESTDIR="${srcdir}/ute_bin" ninja install -C ute_build install

  msg2 "Build geogram library"
  CFLAGS+=" -fcommon" cmake -DCMAKE_INSTALL_PREFIX=/ -DGEOGRAM_LIB_ONLY=ON -DGEOGRAM_USE_SYSTEM_GLFW3=ON -DCMAKE_BUILD_TYPE:STRING=Release -DVORPALINE_PLATFORM:STRING=Linux64-gcc-dynamic -G Ninja -S geogram -B geogram_build
# shellcheck disable=SC2030,SC2031,SC2046 # ninja call won't work with shell substitution in quotes.
  ninja $([ -v MAKEFLAGS ] || echo -j1) -C geogram_build
  DESTDIR="${srcdir}/geogram_bin" ninja -C geogram_build install

  msg2 "Build AliceVision library"
  cmake "${_CMAKE_FLAGS[@]}" -DGEOGRAM_INSTALL_PREFIX="${srcdir}/geogram_bin" -DUNCERTAINTYTE_DIR="${srcdir}/ute_bin" -G Ninja -S ${pkgname} -B build
# shellcheck disable=SC2030,SC2031,SC2046 # ninja call won't work with shell substitution in quotes.
  ninja $([ -v MAKEFLAGS ] || echo -j1) -C build
}


package() {
  msg2 "Install uncertaintyTE"
  DESTDIR="${pkgdir}/usr" ninja -C ute_build install

  msg2 "Install geogram"
  DESTDIR="${pkgdir}/usr" ninja -C geogram_build install

  msg2 "Install Alice-Vision"
  DESTDIR="${pkgdir}" ninja -C build install

# install custom licenses.
  cd "${pkgdir}"/usr/share
  install -dm755 licenses/${pkgname}/
  mv aliceVision/LICENSE-{MPL2,MIT-libmv}.md licenses/${pkgname}

# prune empty dirs
  find "${pkgdir}/usr" . -type d -print0 | xargs --null rmdir 2>/dev/null || true
}
# vim:set ts=2 sw=2 et:
