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

# Disable popsift and ute when cuda is disabled.
((DISABLE_POPSIFT|DISABLE_CUDA)) || {
  _CMAKE_FLAGS+=( -DPopSift_DIR=/usr )
  makedepends+=('popsift')
  optdepends+=('popsift-libs: for GPU accelerated feature matching')
}

((DISABLE_UTE|DISABLE_CUDA)) || {
  _CMAKE_FLAGS+=( -DUNCERTAINTYTE_DIR=/usr -DMAGMA_ROOT=/usr )
  makedepends+=('uncertainty-framework' 'magma')
  optdepends+=('uncertainty-framework: for SFM uncertainty estimation')
}


_name=alice-vision
pkgname=${_name}
pkgver=2.3.1
pkgrel=2
pkgdesc="Photogrammetric Computer Vision Framework which provides a 3D Reconstruction and Camera Tracking algorithms"
arch=('i686' 'x86_64')
url="https://alicevision.github.io/"
license=('MPL2' 'MIT')
groups=()
# split: cctag
#depends=('openexr' 'coin-or-coinutils' 'coin-or-lemon' 'opencv'
depends+=('alembic' 'boost-libs' 'openimageio' 'flann' 'geogram' 'opengv' 'coin-or-clp' 'ceres-solver')
#makedepends+=('ceres-solver')
makedepends+=('boost' 'ninja' 'eigen' 'freetype2' 'coin-or-coinutils' 'coin-or-lemon' 'git' 'cmake')
source=("${pkgname}::https://github.com/alicevision/AliceVision/archive/v${pkgver}.tar.gz"
        "MeshSDFilter::git+https://github.com/alicevision/MeshSDFilter.git#branch=av_develop"
        "nanoflann::git+https://github.com/alicevision/nanoflann.git"
        "FindOpenGV.cmake.patch"
)
sha256sums=('40a4e753197cccf0cf00ca74a4bbcf610d5bd4fc2b908abd19f6b060602206f7'
            'SKIP'
            'SKIP'
            '2740fc6890a62f74367df357e132dc95bcd276528d828d51d66c4689e183ceec')

prepare() {
  cd "${srcdir}"/AliceVision-${pkgver}
  rm -rf src/dependencies/{MeshSDFilter,nanoflann}
  cp -r "${srcdir}"/MeshSDFilter src/dependencies/MeshSDFilter
  cp -r "${srcdir}"/nanoflann src/dependencies/nanoflann
  #fix missing submodule warning.
  mkdir src/dependencies/osi_clp/CoinUtils
  #patch FindOpenGV.cmake to use Eigen3 instear of Eigen
  patch -Np1 -i "$srcdir"/FindOpenGV.cmake.patch
}


build() {
  cmake "${_CMAKE_FLAGS[@]}" -G Ninja -S AliceVision-${pkgver} -B build
# shellcheck disable=SC2086 #allow MAKEFLAGS to carry more then one flag.
  ninja ${MAKEFLAGS:--j1} -C build
}


package() {
#  postpone till `cuda-split` package is ready
#  ((DISABLE_CUDA)) || depends+=( 'libcudart.so=10.1' )
  ((DISABLE_CUDA)) || optdepends+=( 'cuda: (libcudart.so) for depth map computation' )
  DESTDIR="${pkgdir}" ninja -C build install

# fix conflict with openmvg
  rm "${pkgdir}"/usr/lib/libvlsift.a

# install custom licenses.
  cd "${pkgdir}"/usr/share
  install -dm755 licenses/${_name}/
  mv aliceVision/LICENSE-{MPL2,MIT-libmv}.md licenses/${_name}

# prune empty dirs
  find "${pkgdir}/usr" . -type d -print0 | xargs --null rmdir 2>/dev/null || true
}
# vim:set ts=2 sw=2 et:
