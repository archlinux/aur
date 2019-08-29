# Maintainer : bartus <arch-user-repoᘓbartus.33mail.com>

_name=alice-vision
pkgname=${_name}
pkgver=2.2.0
pkgrel=1
pkgdesc="Photogrammetric Computer Vision Framework which provides a 3D Reconstruction and Camera Tracking algorithms"
arch=('i686' 'x86_64')
url="https://alicevision.github.io/"
license=('MPL2' 'MIT')
groups=()
conflicts=(alice-vision-git)
provides=(alice-vision)
# split: uncertaintyTE, cctag
depends=('geogram' 'gflags' 'glfw-x11' 'alembic' 'boost-libs' 'openexr' 'openimageio' 'opengv-git' 'flann' 'coin-or-coinutils' 'coin-or-clp' 'coin-or-lemon' 'coin-or-osi' 'google-glog' 'freetype2' 'zlib' 'libtiff' 'libjpeg' 'libpng' 'libraw' 'opencv' 'lapack' 'suitesparse')
makedepends=('boost' 'eigen' 'ceres-solver' 'git' 'cmake')
source=("https://github.com/alicevision/AliceVision/archive/v${pkgver}.tar.gz"
        "MeshSDFilter::git+https://github.com/alicevision/MeshSDFilter.git#branch=av_develop"
        "nanoflann::git+https://github.com/alicevision/nanoflann.git"
        "submodule.patch"
        )
sha256sums=('157d06d472ffef29f08a781c9df82daa570a49bb009e56a2924a3bd2f555ef50'
            'SKIP'
            'SKIP'
            'ddbe76933cea0300b577095afa7459113a2d2ef02d4f300424261165ad9dee22'
           )

_CMAKE_FLAGS=(
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

((DISABLE_CUDA)) && { _CMAKE_FLAGS+=('-DALICEVISION_USE_CUDA=OFF')
                       DISABLE_UTE=1 # Disable uncertaintyTE as it also depends on cuda
               } || {  makedepends+=('cuda' 'popsift')
                      _CMAKE_FLAGS+=( -DCUDA_HOST_COMPILER=/opt/cuda/bin/gcc )
                      _CMAKE_FLAGS+=( -DPopSift_DIR=/usr )
                    } 

((DISABLE_UTE)) || {  source+=("ute_lib::git+https://github.com/alicevision/uncertaintyTE.git")
                      sha256sums+=('SKIP') 
                      makedepends+=('magma')
                     _CMAKE_FLAGS+=( -DMAGMA_ROOT=/opt/magma )
                     _CMAKE_FLAGS+=( -DUNCERTAINTYTE_DIR=${srcdir}/ute_bin )
                   }

_path="AliceVision-${pkgver}"

prepare() {
  cd ${srcdir}/${_path}
  patch -Np1 -i ${srcdir}/submodule.patch
  rm -rf src/dependencies/{MeshSDFilter,nanoflann}
  cp -r ${srcdir}/MeshSDFilter src/dependencies/MeshSDFilter
  cp -r ${srcdir}/nanoflann src/dependencies/nanoflann
}


build() {
  cd ${srcdir}

  ((DISABLE_UTE)) || {
    msg2 "Build uncertaintyTE library"
    mkdir -p ute_build && cd ute_build
    cmake -DCMAKE_INSTALL_PREFIX=/ -DMAGMA_ROOT=/opt/magma ../ute_lib 
    make
    make DESTDIR="../ute_bin" install
    cd ..
  }

  msg2 "Build AliceVision library"
  mkdir -p build && cd build
  cmake ${_CMAKE_FLAGS[@]} -DGEOGRAM_INSTALL_PREFIX=/usr ../${_path}
  make
}


package() {
  ((DISABLE_UTE)) || {
    msg2 "Install uncertaintyTE"
    cd ${srcdir}/ute_build
    make DESTDIR=${pkgdir}/usr install
  }

  cd ${srcdir}/build
  make DESTDIR=${pkgdir} install
  
  #fix conflict with openmvg
  rm ${pkgdir}/usr/lib/libvlsift.a
}
# vim:set ts=2 sw=2 et:
