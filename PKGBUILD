#!/hint/bash
# Maintainer : bartus <arch-user-repoᘓbartus.33mail.com>
# shellcheck disable=SC2034,SC2164 # mask unused variable warning, mask cd without fallback warning.
# ToDo:
# * add libraw to openimageio

# Configuration.
_CMAKE_FLAGS+=(
              -DCMAKE_INSTALL_PREFIX=/usr
              -DCMAKE_INSTALL_LIBDIR=lib
              -DEIGEN_INCLUDE_DIR_HINTS=/usr/include/eigen3
              -DFLANN_INCLUDE_DIR_HINTS=/usr/include/flann
              -DCOINUTILS_INCLUDE_DIR_HINTS=/usr/include/coin
              -DLEMON_INCLUDE_DIR_HINTS=/usr/include/lemon
              -DCLP_INCLUDE_DIR_HINTS=/usr/include/coin
              -DOSI_INCLUDE_DIR_HINTS=/usr/include/coin
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
((DISABLE_POPSIFT)) || ((DISABLE_CUDA)) || { 
  _CMAKE_FLAGS+=( -DPopSift_DIR=/usr )
  makedepends+=('popsift')
  optdepends+=('popsift-libs: for GPU accelerated feature matching')
}

((DISABLE_UTE)) || ((DISABLE_CUDA)) || {
  _CMAKE_FLAGS+=( -DUNCERTAINTYTE_DIR=/usr -DMAGMA_ROOT=/usr )
  makedepends+=('uncertainty-framework' 'magma')
  optdepends+=('uncertainty-framework: for SFM uncertainty estimation')
}


_name=alice-vision
pkgname=${_name}
pkgver=2.2.0
pkgrel=3
pkgdesc="Photogrammetric Computer Vision Framework which provides a 3D Reconstruction and Camera Tracking algorithms"
arch=('i686' 'x86_64')
url="https://alicevision.github.io/"
license=('MPL2' 'MIT')
groups=()
conflicts=(alice-vision-git)
provides=(alice-vision)
# split: cctag
#depends=('openexr' 'coin-or-coinutils' 'coin-or-lemon' 'opencv' 
depends+=('alembic' 'boost-libs' 'openimageio' 'flann' 'geogram' 'opengv' 'coin-or-clp' 'ceres-solver')
#makedepends+=('ceres-solver')
makedepends+=('boost' 'ninja' 'eigen' 'freetype2' 'coin-or-coinutils' 'coin-or-lemon' 'git' 'cmake')
source=("${pkgname}::https://github.com/alicevision/AliceVision/archive/v${pkgver}.tar.gz"
        "MeshSDFilter::git+https://github.com/alicevision/MeshSDFilter.git#branch=av_develop"
        "nanoflann::git+https://github.com/alicevision/nanoflann.git"
        "submodule.patch"
        "boost_017100.patch::https://github.com/alicevision/AliceVision/pull/709.patch"
        "cuda11.patch"
        )
sha256sums=('157d06d472ffef29f08a781c9df82daa570a49bb009e56a2924a3bd2f555ef50'
            'SKIP'
            'SKIP'
            'ddbe76933cea0300b577095afa7459113a2d2ef02d4f300424261165ad9dee22'
            '3055e98b7d788135d9873bc7fc4698cb72a3f8212155f281877e37d315a693d8'
            'c0c54b0d3ac3b0b0ed139a3efbf574ca307d5a06021b086065932fb9fe2078ad')

prepare() {
  cd "${srcdir}"/AliceVision-${pkgver}
  patch -Np1 -i "${srcdir}"/submodule.patch
  patch -Np1 -i "${srcdir}"/boost_017100.patch
  patch -Np1 -i "${srcdir}"/cuda11.patch
  rm -rf src/dependencies/{MeshSDFilter,nanoflann}
  cp -r "${srcdir}"/MeshSDFilter src/dependencies/MeshSDFilter
  cp -r "${srcdir}"/nanoflann src/dependencies/nanoflann
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
