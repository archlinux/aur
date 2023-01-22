# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: bartus <arch-user-repoᘓbartus.33mail.com>
pkgname=('alice-vision' 'alice-vision-cuda')
pkgver=2.4.0
pkgrel=16
pkgdesc="Photogrammetric Computer Vision Framework which provides a 3D Reconstruction and Camera Tracking algorithms"
arch=('x86_64')
url="https://alicevision.github.io/"
options=('!lto' '!debug') # debug package is kinda big -- needs investigation!
license=('MPL2' 'MIT')
depends=('boost-libs' 'openimageio' 'flann' 'geogram' 'coin-or-clp' 'ceres-solver' 'cctag'
         'alembic' 'opengv' 'opencv' 'popsift' 'uncertainty-framework')
makedepends=('boost' 'ninja' 'eigen' 'freetype2' 'coin-or-coinutils' 'coin-or-lemon'
             'git' 'cmake' 'doxygen' 'python-sphinx' 'cuda')
source=("git+https://github.com/alicevision/AliceVision#tag=v${pkgver}"
        "MeshSDFilter::git+https://github.com/alicevision/MeshSDFilter.git#branch=av_develop"
        "nanoflann::git+https://github.com/alicevision/nanoflann.git"
        "cmake_cxx_std_14.patch"
        "openexr3.patch"
        "iomanip.patch::https://github.com/alicevision/AliceVision/commit/711eda620449c080b642fc7cb6118758535ab614.patch"
        "isnormal.patch::https://github.com/alicevision/AliceVision/commit/22fd9d4ba3f8b5344261cedfd9bc3cd4cb58eece.patch"
)
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'caf2bf06bd7c6a2387f01f312d94b649ef3e4363b18fcdf95986cd71a0d6c275'
            'de9def936b143b6a95d8afc93e4673e8f8b0e434785b65c557353549efd95c1b'
            '3daa4788b181f2f92b31531c24c2ccff6d1546d7824addcd8058c415138346ea'
            '91b2942041511044c6d486f3ed0f29ce9d498906be7a2230703a706ea6a92743')

prepare() {
  cd AliceVision

  git submodule init
  git config submodule."src/dependencies/MeshSDFilter".url "${srcdir}/MeshSDFilter"
  git config submodule."src/dependencies/nanoflann".url "${srcdir}/nanoflann"
  git -c protocol.file.allow=always submodule update

  # fix missing include that breaks building with boost 1.81.0
  git format-patch -1 --stdout 9c4481148d25 | patch -Np1

  patch -Np1 -i"${srcdir}"/cmake_cxx_std_14.patch

  # fix FindOpenEXR.cmake against openexr:3
  patch -Np1 -i"${srcdir}"/openexr3.patch

  # fix header relocation against openexr:3
  grep -lR "#include.*OpenEXR/half.h"|xargs sed -i 's|OpenEXR/half|Imath/half|'

  # fix gcc:11 headers regression
  grep -lR "std::numeric_limits"|xargs sed -i '1 i\#include <limits>'

  # fix doc build
  sed -i '/^ *install.*doc/s/doc/htmlDoc/' src/CMakeLists.txt

  # fix CMAKE_FIND_PACKAGE_PREFER_CONFIG=ON preserve target name capitalisation
  sed 's/OPENEXR_FOUND/OpenEXR_FOUND/g' -i src/CMakeLists.txt

  # fix openimageio:2 target library
  sed 's/${OPENIMAGEIO_LIBRARIES};dl/OpenImageIO::OpenImageIO/g' -i src/CMakeLists.txt

  # fix [io]fstream(path) initializer
  sed '1 i#include <fstream>' -i $(grep -Rl std::[io]fstream src)

  # fix missing <iomanip> header (setw,setfill,etc.)
  git apply -v "${srcdir}"/iomanip.patch

  # fix missing isnormal() from std namespace
  git apply -v "${srcdir}"/isnormal.patch
}

build() {
  cd AliceVision

  # Patch out flags that causes failures during various stages.
  export CXXFLAGS="${CXXFLAGS/-Wp,-D_GLIBCXX_ASSERTIONS}"
  export CXXFLAGS="${CXXFLAGS/-fcf-protection}"
  export CXXFLAGS="${CXXFLAGS/-fstack-clash-protection}"

  cmake \
    -Bbuild \
    -GNinja \
    -DCMAKE_FIND_PACKAGE_PREFER_CONFIG=ON \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCOINUTILS_INCLUDE_DIR_HINTS=/usr/include/coin \
    -DCLP_INCLUDE_DIR_HINTS=/usr/include/coin \
    -DOSI_INCLUDE_DIR_HINTS=/usr/include/coin \
    -DLEMON_INCLUDE_DIR_HINTS=/usr/include/lemon \
    -DPopSift_DIR=/usr \
    -DCCTag_DIR=/usr/lib/cmake/CCTag \
    -DUNCERTAINTYTE_DIR=/usr \
    -DMAGMA_ROOT=/usr \
    -DALICEVISION_BUILD_EXAMPLES=OFF \
    -DALICEVISION_USE_CUDA=OFF \
    -DALICEVISION_USE_CCTAG=ON \
    -DALICEVISION_USE_POPSIFT=ON \
    -DALICEVISION_USE_UNCERTAINTYTE=ON \
    -DALICEVISION_USE_ALEMBIC=ON \
    -DALICEVISION_USE_OPENGV=ON \
    -DALICEVISION_USE_OPENCV=ON
  ninja -C build

  cmake \
    -Bbuild-cuda \
    -GNinja \
    -DCMAKE_FIND_PACKAGE_PREFER_CONFIG=ON \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCOINUTILS_INCLUDE_DIR_HINTS=/usr/include/coin \
    -DCLP_INCLUDE_DIR_HINTS=/usr/include/coin \
    -DOSI_INCLUDE_DIR_HINTS=/usr/include/coin \
    -DLEMON_INCLUDE_DIR_HINTS=/usr/include/lemon \
    -DPopSift_DIR=/usr \
    -DCCTag_DIR=/usr/lib/cmake/CCTag \
    -DUNCERTAINTYTE_DIR=/usr \
    -DMAGMA_ROOT=/usr \
    -DALICEVISION_CUDA_CC_LIST="52;53;60;61;62;70;72;75;80;86;87;89;90" \
    -DALICEVISION_BUILD_EXAMPLES=OFF \
    -DALICEVISION_USE_CUDA=ON \
    -DALICEVISION_USE_CCTAG=ON \
    -DALICEVISION_USE_POPSIFT=ON \
    -DALICEVISION_USE_UNCERTAINTYTE=ON \
    -DALICEVISION_USE_ALEMBIC=ON \
    -DALICEVISION_USE_OPENGV=ON \
    -DALICEVISION_USE_OPENCV=ON
  ninja -C build
}

package_alice-vision() {
  cd AliceVision

  ninja -C build doc_doxygen
  DESTDIR="${pkgdir}" ninja -C build install

  # Clean up some stuff that gets installed for some reason
  rm "${pkgdir}"/usr/lib/libflann_cpp_s.a
  rm "${pkgdir}"/usr/lib/pkgconfig/flann.pc

  # Fix OpenImageIO linkage in client libraries
  sed -i 's/OpenImageIO::OpenImageIO/${OPENIMAGEIO_LIBRARIES}/g' "${pkgdir}"/usr/share/aliceVision/cmake/AliceVisionTargets.cmake

  install -Dm755 COPYING.md "${pkgdir}"/usr/share/licenses/${pkgname}/COPYING.md
  install -Dm755 LICENSE-MPL2.md "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE-MPL2.md
  install -Dm755 LICENSE-MIT-libmv.md "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE-MIT-libmv.md
}

package_alice-vision-cuda() {
  pkgdesc="Photogrammetric Computer Vision Framework which provides a 3D Reconstruction and Camera Tracking algorithms (with CUDA)"
  depends+=('cuda')
  conflicts=('alice-vision')
  provides=('alice-vision')

  cd AliceVision

  ninja -C build-cuda doc_doxygen
  DESTDIR="${pkgdir}" ninja -C build-cuda install

  # Clean up some stuff that gets installed for some reason
  rm "${pkgdir}"/usr/lib/libflann_cpp_s.a
  rm "${pkgdir}"/usr/lib/pkgconfig/flann.pc

  # Fix OpenImageIO linkage in client libraries
  sed -i 's/OpenImageIO::OpenImageIO/${OPENIMAGEIO_LIBRARIES}/g' "${pkgdir}"/usr/share/aliceVision/cmake/AliceVisionTargets.cmake

  install -Dm755 COPYING.md "${pkgdir}"/usr/share/licenses/${pkgname}/COPYING.md
  install -Dm755 LICENSE-MPL2.md "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE-MPL2.md
  install -Dm755 LICENSE-MIT-libmv.md "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE-MIT-libmv.md
}

# vim:set ts=2 sw=2 et:
