# Maintainer : bartus <arch-user-repoᘓbartus.33mail.com>

_name=alice-vision
#_fragment="#commit=eebc3e4f"
_fragment="#branch=develop"
pkgname=${_name}-git
pkgver=2.2.0.r43.g5bdfe01a
pkgrel=1
pkgdesc="Photogrammetric Computer Vision Framework which provides a 3D Reconstruction and Camera Tracking algorithms"
arch=('i686' 'x86_64')
url="https://alicevision.github.io/"
license=('MPL2' 'MIT')
groups=()
conflicts=(${_name} geogram uncertainty-framework)
provides=(${_name} geogram uncertainty-framework)


depends=('alembic' 'boost-libs' 'openimageio' 'flann' 'opengv' 'coin-or-clp' 'google-glog')
depends+=('glu' 'glfw-x11') # geogram deps.
depends+=('magma' 'ceres-solver') # uncertaintyTE deps.
makedepends=('boost' 'eigen' 'freetype2' 'gflags' 'doxygen' 'python-sphinx' 'coin-or-coinutils' 'coin-or-lemon' 'git' 'cmake')
source=("${pkgname}::git+https://github.com/alicevision/AliceVision.git${_fragment}"
        "ute_lib::git+https://github.com/alicevision/uncertaintyTE.git"
        "geogram::git+https://github.com/alicevision/geogram.git"
        "submodule.patch"
        "https://github.com/alicevision/AliceVision/pull/709.patch"
        )
md5sums=('SKIP'
         'SKIP'
         'SKIP'
         'eb62c8be5a0d7ce537a928314c9d0028'
         '5bcb86d3c07abb898dfb6c2dab4ec9b6')

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
              -DMAGMA_ROOT=/usr
              -DCUDA_HOST_COMPILER=/opt/cuda/bin/gcc
             )


pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd ${srcdir}/${pkgname}
  git submodule init
#  git config submodule.src/dependencies/MeshSDFilter.url ${srcdir}/MeshSDFilter
#  git config submodule.src/dependencies/nanoflann.url
#  git config submodule.src/dependencies/osi_clp.url
  git submodule update
  git apply ${srcdir}/submodule.patch
  git apply ${srcdir}/709.patch
# fix doc build
  sed -i '/^ *install.*doc/s/doc/htmlDoc/' src/CMakeLists.txt
}


build() {
  cd ${srcdir}

  msg2 "Build uncertaintyTE library"
  mkdir -p ute_build && cd ute_build
  cmake -DCMAKE_INSTALL_PREFIX=/ -DMAGMA_ROOT=/usr ../ute_lib 
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
  cmake ${_CMAKE_FLAGS[@]} -DGEOGRAM_INSTALL_PREFIX=${srcdir}/geogram_bin -DUNCERTAINTYTE_DIR=${srcdir}/ute_bin ../${pkgname}
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

# install costume licenses.
  cd ${pkgdir}/usr/share
  install -dm755 licenses/${_name}/
  mv aliceVision/LICENSE-{MPL2,MIT-libmv}.md licenses/${_name}

# prune empty dirs
  cd ${pkgdir}/usr
  find . -type d | tac | xargs rmdir 2>/dev/null || true
}
# vim:set ts=2 sw=2 et:
