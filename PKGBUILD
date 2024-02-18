# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: bartus <arch-user-repoᘓbartus.33mail.com>

pkgbase=alice-vision
pkgname=('alice-vision') # 'alice-vision-cuda'
pkgver=3.2.0
pkgrel=7
pkgdesc="Photogrammetric Computer Vision Framework which provides a 3D Reconstruction and Camera Tracking algorithms"
arch=('x86_64')
url="https://alicevision.github.io/"
options=('!lto' '!debug') # debug package is kinda big -- needs investigation!
license=('MPL-2.0' 'MIT')
depends=('boost-libs' 'openimageio' 'flann' 'geogram' 'coin-or-clp' 'ceres-solver' 'cctag'
         'alembic' 'opengv' 'opencv' 'popsift' 'uncertainty-framework' 'assimp')
makedepends=('boost' 'ninja' 'eigen' 'freetype2' 'coin-or-coinutils' 'coin-or-lemon'
             'git' 'cmake' 'doxygen' 'python-sphinx') # 'cuda'
source=("git+https://github.com/alicevision/AliceVision#tag=v${pkgver}"
        "MeshSDFilter::git+https://github.com/alicevision/MeshSDFilter.git#branch=av_develop"
        "nanoflann::git+https://github.com/alicevision/nanoflann.git"
        "FindCoinUtils.cmake"
        "FindClp.cmake"
        "FindOsi.cmake"
        "fix-computeUncertainty-build.patch"
        "fix-default-ocio-path.patch"
)
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'd21691bfd9c2561cea52b5f48caf885ec6f8c2a0603ce594914bff610e77a0c5'
            '6523435334eec6e39a244371287504cd0a0e88aa0cbe5dcac38b819ea881074e'
            'fbb87c86bc0b2ee2c98abfbecb0d555f75f01ccf5d4c59c22bb598e7f2897bf9'
            '17546a6c362782f90d1d85eb7a4b42b96f5f51879c68efbcbcf07635e0f60cbc'
            '3f02c715f27498ac8982edee3e3af151b0cd2a9cb83da37fef3b7fec1e34b169')

prepare() {
  cd AliceVision

  git submodule init
  git config submodule."src/dependencies/MeshSDFilter".url "${srcdir}/MeshSDFilter"
  git config submodule."src/dependencies/nanoflann".url "${srcdir}/nanoflann"
  git -c protocol.file.allow=always submodule update

  # alice-vision requires a patched coinutils with cmake integration
  cp "$srcdir"/Find*.cmake src/cmake
  sed -e 's|Coin::Clp|${CLP_LIBRARIES}|g' \
      -e 's|Coin::CoinUtils|${COINUTILS_LIBRARIES}|g' \
      -e 's|Coin::Osi|${OSI_LIBRARIES}|g' \
      -i src/*/*/CMakeLists.txt

  # fix build
  patch -p1 -i ../fix-computeUncertainty-build.patch

  # fix default OCIO config path
  patch -p1 -i ../fix-default-ocio-path.patch
  # fix doc build
  sed -i '/^ *install.*doc/s/doc/htmlDoc/' src/CMakeLists.txt
  ln -rs docs/sphinx{,/rst}
}

build() {
  cd AliceVision

  cmake \
    -Bbuild \
    -GNinja \
    -DCMAKE_FIND_PACKAGE_PREFER_CONFIG=ON \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCOINUTILS_INCLUDE_DIR_HINTS=/usr/include/coin \
    -DCLP_INCLUDE_DIR_HINTS=/usr/include/coin \
    -DOSI_INCLUDE_DIR_HINTS=/usr/include/coin \
    -DLEMON_INCLUDE_DIR_HINTS=/usr/include/lemon \
    -DPopSift_DIR=/usr \
    -DCCTag_DIR=/usr/lib/cmake/CCTag \
    -DUNCERTAINTYTE_DIR=/usr \
    -DMAGMA_ROOT=/opt/cuda/targets/x86_64-linux/ \
    -DALICEVISION_BUILD_EXAMPLES=OFF \
    -DALICEVISION_USE_CUDA=OFF \
    -DALICEVISION_USE_CCTAG=ON \
    -DALICEVISION_USE_POPSIFT=ON \
    -DALICEVISION_USE_UNCERTAINTYTE=ON \
    -DALICEVISION_USE_ALEMBIC=ON \
    -DALICEVISION_USE_OPENGV=ON \
    -DALICEVISION_USE_OPENCV=ON \
    -DALICEVISION_USE_ONNX=OFF
  ninja -C build

#  cmake \
#    -Bbuild-cuda \
#    -GNinja \
#    -DCMAKE_FIND_PACKAGE_PREFER_CONFIG=ON \
#    -DCMAKE_INSTALL_PREFIX=/usr \
#    -DCOINUTILS_INCLUDE_DIR_HINTS=/usr/include/coin \
#    -DCLP_INCLUDE_DIR_HINTS=/usr/include/coin \
#    -DOSI_INCLUDE_DIR_HINTS=/usr/include/coin \
#    -DLEMON_INCLUDE_DIR_HINTS=/usr/include/lemon \
#    -DPopSift_DIR=/usr \
#    -DCCTag_DIR=/usr/lib/cmake/CCTag \
#    -DUNCERTAINTYTE_DIR=/usr \
#    -DMAGMA_ROOT=/usr \
#    -DALICEVISION_CUDA_CC_LIST="52;53;60;61;62;70;72;75;80;86;87;89;90" \
#    -DALICEVISION_BUILD_EXAMPLES=OFF \
#    -DALICEVISION_USE_CUDA=ON \
#    -DALICEVISION_USE_CCTAG=ON \
#    -DALICEVISION_USE_POPSIFT=ON \
#    -DALICEVISION_USE_UNCERTAINTYTE=ON \
#    -DALICEVISION_USE_ALEMBIC=ON \
#    -DALICEVISION_USE_OPENGV=ON \
#    -DALICEVISION_USE_OPENCV=ON
#  ninja -C build-cuda
}

package_alice-vision() {
  cd AliceVision

  ninja -C build doc_doxygen
  DESTDIR="${pkgdir}" ninja -C build install

  # Don't search for unofficial coin-or cmake config
  sed -e '/CoinUtils/d' -e '/Clp/d' -e '/Osi/d' -i "$pkgdir"/usr/share/aliceVision/cmake/AliceVisionConfig.cmake

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

  # Don't search for unofficial coin-or cmake config
  sed -e '/CoinUtils/d' -e '/Clp/d' -e '/Osi/d' -i "$pkgdir"/usr/share/aliceVision/cmake/AliceVisionConfig.cmake

  install -Dm755 COPYING.md "${pkgdir}"/usr/share/licenses/${pkgname}/COPYING.md
  install -Dm755 LICENSE-MPL2.md "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE-MPL2.md
  install -Dm755 LICENSE-MIT-libmv.md "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE-MIT-libmv.md
}

# vim:set ts=2 sw=2 et:
