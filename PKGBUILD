# Maintainer : bartus <arch-user-repoᘓbartus.33mail.com>

_name=alice-vision
pkgname=${_name}
pkgver=2.0.0
pkgrel=2
pkgdesc="Photogrammetric Computer Vision Framework which provides a 3D Reconstruction and Camera Tracking algorithms"
arch=('i686' 'x86_64')
url="http://alicevision.github.io/"
license=('MPL2' 'MIT')
groups=()
conflicts=(alice-vision-git)
provides=(alice-vision)
depends=('openblas-lapack' 'gflags' 'glfw-x11' 'alembic' 'boost-libs' 'openexr' 'openimageio' 'opengv-git' 'flann' 'coin-or-coinutils' 'coin-or-clp' 'coin-or-lemon' 'coin-or-osi' 'google-glog')
makedepends=('boost' 'eigen' 'ceres-solver' 'cuda' 'git' 'cmake' 'magma')
source=("https://github.com/alicevision/AliceVision/archive/v${pkgver}.tar.gz"
        "ute_lib::git+https://github.com/alicevision/uncertaintyTE.git"
        "geogram::git+https://github.com/alicevision/geogram.git"
        "MeshSDFilter::git+https://github.com/alicevision/MeshSDFilter.git#branch=av_develop"
        "nanoflann::git+https://github.com/alicevision/nanoflann.git"
        "submodule.patch"
        )
md5sums=('1ff20994f1ff259850c3e170ef451634'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'eb62c8be5a0d7ce537a928314c9d0028')

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
              -DMAGMA_ROOT=/opt/magma
              -DCUDA_HOST_COMPILER=/opt/cuda/bin/gcc
             )

_path="AliceVision-${pkgver}"

prepare() {
  cd ${srcdir}/${_path}
  patch -Np1 -i ${srcdir}/submodule.patch
  rmdir src/dependencies/{MeshSDFilter,nanoflann}
  cp -r ${srcdir}/MeshSDFilter src/dependencies/MeshSDFilter
  cp -r ${srcdir}/nanoflann src/dependencies/nanoflann
}


build() {
  cd ${srcdir}

  msg2 "Build uncertaintyTE library"
  mkdir -p ute_build && cd ute_build
  cmake -DCMAKE_INSTALL_PREFIX=/ -DMAGMA_ROOT=/opt/magma ../ute_lib 
  make
  make DESTDIR="../ute_bin" install
  cd ..

  msg2 "Build geogram library"
  mkdir -p geogram_build && cd geogram_build
  cmake -DCMAKE_INSTALL_PREFIX=/ -DGEOGRAM_LIB_ONLY=ON -DGEOGRAM_USE_SYSTEM_GLFW3=ON -DCMAKE_BUILD_TYPE:STRING=Debug -DVORPALINE_PLATFORM:STRING=Linux64-gcc-dynamic ../geogram
  make 
  make DESTDIR="../geogram_bin" install
  cd ..

  msg2 "Build AliceVision library"
  mkdir -p build && cd build
  cmake ${_CMAKE_FLAGS[@]} -DUNCERTAINTYTE_DIR=${srcdir}/ute_bin -DGEOGRAM_INSTALL_PREFIX=${srcdir}/geogram_bin ../${_path}
  make
}


package() {
  msg2 "Install uncertaintyTE"
  cd ${srcdir}/ute_build
  make DESTDIR=${pkgdir}/usr install

  msg2 "Install geogram"
  cd ${srcdir}/geogram_build
  make DESTDIR=${pkgdir}/usr install

  cd ${srcdir}/build
  make DESTDIR=${pkgdir} install
  
  #fix conflict with openmvg
  rm ${pkgdir}/usr/lib/libvlsift.a
}
# vim:set ts=2 sw=2 et:
