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
              -DALICEVISION_USE_CCTAG=ON
              -DALICEVISION_USE_OPENCV=ON
             )
# shellcheck disable=SC2206
[[ -v CUDA_ARCH ]] && _cc_list=(${CUDA_ARCH})
# Alow user to build without cuda
if ((DISABLE_CUDA)); then
  _CMAKE_FLAGS+=('-DALICEVISION_USE_CUDA=OFF')
  # Disable component that could yield cuda.
else
  makedepends+=('cuda')
  depends+=('popsift')
  depends+=('magma') # uncertaintyTE deps.
  source+=("ute_lib::git+https://github.com/alicevision/uncertaintyTE.git")
  provides+=(uncertainty-framework)
  conflicts+=(uncertainty-framework)
  sha256sums+=("SKIP")
  _CMAKE_FLAGS+=(
                -DCUDA_HOST_COMPILER=/opt/cuda/bin/gcc
                -D{MAGMA_ROOT,{UNCERTAINTYTE,PopSift}_DIR}=/usr
                )
  if [[ -v _cc_list ]]; then
    _CMAKE_FLAGS+=( -DALICEVISION_CUDA_CC_LIST="$(IFS=';'; echo "${_cc_list[*]}";)" )
  fi
fi


_name=alice-vision
_fragment="#branch=develop"

pkgname=${_name}-git
pkgver=2.4.0.r255.gcb103ac38
pkgrel=1
pkgdesc="Photogrammetric Computer Vision Framework which provides a 3D Reconstruction and Camera Tracking algorithms"
arch=('i686' 'x86_64')
url="https://alicevision.github.io/"
license=('MPL2' 'MIT')
groups=()
conflicts+=("${_name}" geogram)
provides+=("${_name}" geogram)
depends+=('alembic' 'boost-libs' 'ceres-solver' 'coin-or-clp' 'flann' 'google-glog' 'opencv' 'openimageio' 'opengv' )
depends+=('glu' 'glfw-x11') # geogram deps.
makedepends+=('ninja' 'boost' 'eigen' 'freetype2' 'gflags' 'doxygen' 'python-sphinx' 'coin-or-coinutils' 'coin-or-lemon' 'git' 'cmake')
source+=("${pkgname}::git+https://github.com/alicevision/AliceVision.git${_fragment}"
        "geogram::git+https://github.com/alicevision/geogram.git"
        "cmake_cxx_std_14.patch"
        "openexr3.patch"
        )
sha256sums+=('SKIP'
            'SKIP'
)


pkgver() {
  cd "${pkgname}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}


prepare() {
  prepare_submodule
  cd "${srcdir}/${pkgname}"
#  git config submodule.src/dependencies/MeshSDFilter.url ${srcdir}/MeshSDFilter
#  git config submodule.src/dependencies/nanoflann.url
#  git config submodule.src/dependencies/osi_clp.url
# fix doc build
  sed -i '/^ *install.*doc/s/doc/htmlDoc/' src/CMakeLists.txt
  git apply -v "${srcdir}"/{cmake_cxx_std_14,openexr3}.patch
  #fix gcc:11 headers regression
  grep -lR "std::numeric_limits" src/aliceVision/hdr |xargs sed -i '1 i\#include <limits>'
}


build() {
  export CCACHE_BASEDIR="$srcdir"
  ((!DISABLE_CUDA)) && {
  msg2 "Build uncertaintyTE library"
  cmake -DCMAKE_INSTALL_PREFIX=/ -DMAGMA_ROOT=/usr -G Ninja -S ute_lib -B ute_build
# shellcheck disable=SC2030,SC2031,SC2046 # ninja call won't work with shell substitution in quotes.
  ninja $([ -v MAKEFLAGS ] || echo -j1) -C ute_build
  DESTDIR="${srcdir}/ute_bin" ninja install -C ute_build install
  }

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
  ((!DISABLE_CUDA)) && {
  msg2 "Install uncertaintyTE"
  DESTDIR="${pkgdir}/usr" ninja -C ute_build install
  }

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
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'caf2bf06bd7c6a2387f01f312d94b649ef3e4363b18fcdf95986cd71a0d6c275'
            'e7a89d510788ff0320415d00e9871220e602e046ffc0fb65d60d465d6bed93a7'
            'SKIP'
            'SKIP'
            'SKIP')

# Generated with git_submodule_PKGBUILD_conf.sh ( https://gist.github.com/bartoszek/41a3bfb707f1b258de061f75b109042b )
# Call prepare_submodule in prepare() function

prepare_submodule() {
  git -C "$srcdir/alice-vision-git" config submodule.src/dependencies/osi_clp.url "$srcdir/osi_clp"
  git -C "$srcdir/alice-vision-git" config submodule.src/dependencies/MeshSDFilter.url "$srcdir/MeshSDFilter"
  git -C "$srcdir/alice-vision-git" config submodule.src/dependencies/nanoflann.url "$srcdir/nanoflann"
  git -C "$srcdir/alice-vision-git" submodule update --init --recursive
}
source+=(
  "osi_clp::git+https://github.com/alicevision/osi_clp"
  "MeshSDFilter::git+https://github.com/alicevision/MeshSDFilter"
  "nanoflann::git+https://github.com/alicevision/nanoflann"
)
