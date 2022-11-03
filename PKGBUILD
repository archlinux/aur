#!/hint/bash
# Maintainer : bartus <arch-user-repoᘓbartus.33mail.com>

# Configuration:
# Use: makepkg VAR1=0 VAR2=1 to enable(1) disable(0) a feature
# Use: {yay,paru} --mflags=VAR1=0,VAR2=1
# Use: aurutils --margs=VAR1=0,VAR2=1
# Use: VAR1=0 VAR2=1 pamac

# Use FRAGMENT=#{commit,tag,brach}=xxx for bisect build
_fragment="${FRAGMENT:-#branch=develop}"

# Use CUDA_ARCH to build for specific GPU architecture
# Supports: single arch (52) and list of archs (52;60)

[[ -v CUDA_ARCH ]] && _cuda_arch="-DALICEVISION_CUDA_CC_LIST=${CUDA_ARCH}"

((DISABLE_CUDA))    && eval DISABLE_{CCTAG,POPSIFT,UTE}=1   # Disable other components that requires cuda
((DISABLE_OPENCV))  && DISABLE_CCTAG=1                      # CCTag requires OpenCV
((DISABLE_CUDA))    &&    _use_cuda=OFF ||    _use_cuda=ON  # Alow user to build without cuda
((DISABLE_CCTAG))   &&   _use_cctag=OFF ||   _use_cctag=ON  # Disable CCTag (require: cuda)
((DISABLE_POPSIFT)) && _use_popsift=OFF || _use_popsift=ON  # Disable Popsift (requires: cuda)
((DISABLE_UTE))     &&     _use_ute=OFF ||     _use_ute=ON  # Disable Uncertainty computation (require: cuda)
((DISABLE_ALEMBIC)) && _use_alembic=OFF || _use_alembic=ON  # Disable Alembic (mesh export format)
((DISABLE_OPENGV))  &&  _use_opengv=OFF ||  _use_opengv=ON  # Disable OpenGV (camera calibration)
((DISABLE_OPENCV))  &&  _use_opencv=OFF ||  _use_opencv=ON  # Disable OpenCV (examples & CCTag dependency)
((!BUILD_DOC))      &&   _build_doc=OFF ||   _build_doc=ON  # Build Doc (sphinx)
((BUILD_DOXYGEN&=BUILD_DOC))                                # Build Doc (doxygen) requires BUILD_DOC

# Other CMake Options:

# ALICEVISION_BUILD_SFM "Build AliceVision SfM part" ON
# ALICEVISION_BUILD_MVS "Build AliceVision MVS part" ON
# ALICEVISION_BUILD_HDR "Build AliceVision HDR part" ON
# ALICEVISION_BUILD_SOFTWARE "Build AliceVision command line tools." ON
# ALICEVISION_BUILD_EXAMPLES "Build AliceVision samples applications." OFF
# ALICEVISION_BUILD_COVERAGE "Enable code coverage generation (gcc only)" OFF
# ALICEVISION_BUILD_TESTS "Build AliceVision tests" OFF
# ALICEVISION_USE_OCVSIFT "Add or not OpenCV SIFT in available features" OFF
# ALICEVISION_USE_MESHSDFILTER "Use MeshSDFilter library (enable MeshDenoising and MeshDecimate)" ON
# ALICEVISION_USE_NVTX_PROFILING "Use CUDA NVTX for profiling." OFF
# ALICEVISION_NVCC_WARNINGS      "Switch on several additional warnings for CUDA nvcc." OFF
_CMAKE_FLAGS+=(
              -DCMAKE_INSTALL_PREFIX=/usr
              -DCMAKE_INSTALL_LIBDIR=lib
              -DEIGEN_INCLUDE_DIR_HINTS=/usr/include/eigen3
              -DFLANN_INCLUDE_DIR_HINTS=/usr/include/flann
              -D{COINUTILS,CLP,OSI}_INCLUDE_DIR_HINTS=/usr/include/coin
              -DLEMON_INCLUDE_DIR_HINTS=/usr/include/lemon
              -DCERES_DIR=/usr/include/ceres
              -DPopSift_DIR=/usr
              -DCCTag_DIR=/usr/lib/cmake/CCTag
              -DUNCERTAINTYTE_DIR="${srcdir}/ute_bin"
              -DGEOGRAM_INSTALL_PREFIX="${srcdir}/geogram_bin"
              -DMAGMA_ROOT=/usr
              -DALICEVISION_USE_CUDA="$_use_cuda"
              -DALICEVISION_USE_CCTAG="$_use_cctag"
              -DALICEVISION_USE_POPSIFT="$_use_popsift"
              -DALICEVISION_USE_UNCERTAINTYTE="$_use_ute"
              -DALICEVISION_USE_ALEMBIC="$_use_alembic"
              -DALICEVISION_USE_OPENGV="$_use_opengv"
              -DALICEVISION_USE_OPENCV="$_use_opencv"
              -DALICEVISION_BUILD_DOC="$_build_doc"
              "$_cuda_arch"
             )

_name=alice-vision

pkgname=${_name}-git
pkgver=2.4.0.r1108.gf911bf16a
pkgrel=1
pkgdesc="Photogrammetric Computer Vision Framework which provides a 3D Reconstruction and Camera Tracking algorithms"
arch=('i686' 'x86_64')
url="https://alicevision.github.io/"
license=('MPL2' 'MIT')
conflicts+=("${_name}" geogram)
provides+=("${_name}" geogram)
((!DISABLE_UTE)) && {
  provides+=(uncertainty-framework)
  conflicts+=(uncertainty-framework)
}
depends+=('assimp' 'boost-libs' 'ceres-solver' 'coin-or-clp' 'flann' 'google-glog' 'openimageio')
depends+=('glu' 'glfw-x11') # geogram deps.
makedepends+=('ninja' 'boost' 'eigen' 'freetype2' 'gflags' 'coin-or-coinutils' 'coin-or-lemon' 'git' 'cmake')
((!DISABLE_CUDA))    && { depends+=('libcudart.so'); makedepends+=('cuda'); }
((!DISABLE_CCTAG))   && depends+=('cctag')
((!DISABLE_ALEMBIC)) && depends+=('alembic')
((!DISABLE_OPENGV))  && depends+=('opengv')
((!DISABLE_OPENCV))  && depends+=('opencv')
((BUILD_DOC))        && makedepends+=('python-sphinx')
((BUILD_DOXYGEN))    && makedepends+=('doxygen')
((!DISABLE_POPSIFT)) && { makedepends+=('popsift'); optdepends+=('popsift-libs: for GPU accelerated feature matching'); }
((!DISABLE_UTE))     && makedepends+=('magma')
source+=("${pkgname}::git+https://github.com/alicevision/AliceVision.git${_fragment}"
        "geogram::git+https://github.com/alicevision/geogram.git"
        "ute_lib::git+https://github.com/alicevision/uncertaintyTE.git"
        "cmake_cxx_std_14.patch"
        )
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'caf2bf06bd7c6a2387f01f312d94b649ef3e4363b18fcdf95986cd71a0d6c275'
            'SKIP'
            'SKIP'
            'SKIP')


pkgver() {
  cd "${pkgname}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}


prepare() {
  prepare_submodule
  cd "${srcdir}/${pkgname}"
# fix doc build
  ((BUILD_DOXYGEN)) && sed -i '/^ *install.*doc/s/doc/htmlDoc/' src/CMakeLists.txt || true
  git apply -v "${srcdir}"/{cmake_cxx_std_14,openexr3}.patch
  #fix gcc:11 headers regression
  grep -lR "std::numeric_limits" src/aliceVision/hdr |xargs sed -i '1 i\#include <limits>'
}


build() {
  ((DISABLE_CUDA|DISABLE_UTE)) || {
    msg2 "Build uncertaintyTE library"
    cmake -DCMAKE_INSTALL_PREFIX=/ -DMAGMA_ROOT=/usr -G Ninja -S ute_lib -B ute_build
# shellcheck disable=SC2086 # ninja call won't work with shell substitution in quotes.
    ninja ${MAKEFLAGS:--j1} -C ute_build
    DESTDIR="${srcdir}/ute_bin" ninja -C ute_build install
  }

  msg2 "Build geogram library"
  CFLAGS+=" -fcommon" cmake -DCMAKE_INSTALL_PREFIX=/ -DGEOGRAM_LIB_ONLY=ON -DGEOGRAM_USE_SYSTEM_GLFW3=ON -DCMAKE_BUILD_TYPE:STRING=Release -DVORPALINE_PLATFORM:STRING=Linux64-gcc-dynamic -G Ninja -S geogram -B geogram_build
# shellcheck disable=SC2086 # expand MAKEFLAGS.
  ninja ${MAKEFLAGS:--j1} -C geogram_build
  DESTDIR="${srcdir}/geogram_bin" ninja -C geogram_build install

  msg2 "Build AliceVision library"
  cmake "${_CMAKE_FLAGS[@]}" -DGEOGRAM_INSTALL_PREFIX="${srcdir}/geogram_bin" -DUNCERTAINTYTE_DIR="${srcdir}/ute_bin" -G Ninja -S ${pkgname} -B build
# shellcheck disable=SC2086 # expand MAKEFLAGS.
  ninja ${MAKEFLAGS:--j1} -C build
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

# install doxygen doc
  ((BUILD_DOXYGEN)) && ninja -C build doc_doxygen && cp -rvt "${pkgdir}"/usr/share/doc/aliceVision build/src/doc/

# install custom licenses.
  cd "${pkgdir}"/usr/share
  install -dm755 licenses/${pkgname}/
  mv aliceVision/LICENSE-{MPL2,MIT-libmv}.md licenses/${pkgname}

# prune empty dirs
  find "${pkgdir}/usr" . -type d -print0 | xargs --null rmdir 2>/dev/null || true
}
# vim:set ts=2 sw=2 et:

# Generated with git_submodule_PKGBUILD_conf.sh ( https://gist.github.com/bartoszek/41a3bfb707f1b258de061f75b109042b )
# Call prepare_submodule in prepare() function
prepare_submodule() {
  git -C "$srcdir/alice-vision-git" config submodule.src/dependencies/osi_clp.url "$srcdir/osi_clp"
  git -C "$srcdir/alice-vision-git" config submodule.src/dependencies/MeshSDFilter.url "$srcdir/MeshSDFilter"
  git -C "$srcdir/alice-vision-git" config submodule.src/dependencies/nanoflann.url "$srcdir/nanoflann"
  git -C "$srcdir/alice-vision-git" -c protocol.file.allow=always submodule update --init --recursive
}
source+=(
  "osi_clp::git+https://github.com/alicevision/osi_clp"
  "MeshSDFilter::git+https://github.com/alicevision/MeshSDFilter"
  "nanoflann::git+https://github.com/alicevision/nanoflann"
)
