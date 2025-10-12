# Maintainer: sfn
# Contributor: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: bartus <arch-user-repoᘓbartus.33mail.com>

pkgname='alice-vision'
pkgver=3.3.0
pkgrel=6
options=('!debug') # debug package is kinda big -- needs investigation!
pkgdesc="Photogrammetric Computer Vision Framework which provides 3D Reconstruction and Camera Tracking algorithms"
arch=('x86_64')
url="https://alicevision.org/"
license=('MPL-2.0' 'MIT')
depends=('boost-libs' 'flann' 'geogram' 'coin-or-clp' 'ceres-solver' 'cctag' 'openmesh' 'opensubdiv' 'opencolorio'
         'alembic' 'opengv' 'opencv' 'popsift' 'assimp' 'onnx' 'onnxruntime' 'cuda' 'swig' 'openimageio' 'usd')
makedepends=('boost' 'eigen' 'freetype2' 'coin-or-coinutils' 'coin-or-lemon'
             'git' 'cmake' 'doxygen' 'python-sphinx' 'nanoflann')
optdepends=('apriltag: Recognition of Apriltags'
			'libe57format: e57 3d imaging format I/O')
source=("git+https://github.com/alicevision/AliceVision.git#tag=v${pkgver}"
        "MeshSDFilter::git+https://github.com/alicevision/MeshSDFilter.git#branch=av_develop"
        "OpenImageIO.tar.gz::https://github.com/AcademySoftwareFoundation/OpenImageIO/archive/refs/tags/v2.5.18.0.tar.gz"
        "LibPNG.tar.gz::https://download.sourceforge.net/libpng/libpng-1.6.39.tar.gz"
        "FindCoinUtils.cmake"
        "FindClp.cmake"
        "FindOsi.cmake"
        "fix-default-ocio-path.patch"
        "fix-build.patch"
        "alicevision.sh")

sha256sums=('abdd3b872de2d42d089728fc1ee151c24a1ed78297fc8713c9efd02801bdcc90'
            'SKIP'
            'f57481435cec18633d3eba9b2e8c483fc1df6f0a01c5c9f98cbae6d1c52928e5'
            'af4fb7f260f839919e5958e5ab01a275d4fe436d45442a36ee62f73e5beb75ba'
            'd21691bfd9c2561cea52b5f48caf885ec6f8c2a0603ce594914bff610e77a0c5'
            '6523435334eec6e39a244371287504cd0a0e88aa0cbe5dcac38b819ea881074e'
            'fbb87c86bc0b2ee2c98abfbecb0d555f75f01ccf5d4c59c22bb598e7f2897bf9'
            '3f02c715f27498ac8982edee3e3af151b0cd2a9cb83da37fef3b7fec1e34b169'
            '21c3916eba566c125ac22938cc113c88b8535dc7c8bb510c2df47f47c302cbb0'
            'b474a12823b1fb0e1613bba0d7bd455f63124aa8c29b3d00df94f0a3c00ab900')

prepare() {
  #Fix ffmpeg bug
  sed 's|avcodec_close(|avcodec_free_context(\&|g' -i OpenImageIO-2.5.18.0/src/ffmpeg.imageio/ffmpeginput.cpp
  #sed 's|avcodec_close(|avcodec_free_context(\&|g' -i lib/tlIO/FFmpegReadAudio.cpp
  #sed 's|FF_PROFILE_UNKNOWN|AV_PROFILE_UNKNOWN|g' -i lib/tlIO/FFmpegWrite.cpp

  cd AliceVision

  git submodule init
  git config submodule."src/dependencies/MeshSDFilter".url "${srcdir}/MeshSDFilter"
  git -c protocol.file.allow=always submodule update

  # alice-vision requires a patched coinutils with cmake integration
  cp "$srcdir"/Find*.cmake src/cmake
  sed -e 's|Coin::Clp|${CLP_LIBRARIES}|g' \
      -e 's|Coin::CoinUtils|${COINUTILS_LIBRARIES}|g' \
      -e 's|Coin::Osi|${OSI_LIBRARIES}|g' \
      -i src/*/*/CMakeLists.txt

  # fix build
  patch -p1 -i ../fix-build.patch

  # cmake masks envvars for some stupid reason
  sed -e "s|SEDNVCC_CCBINHERE|${NVCC_CCBIN}|g" -i src/CMakeLists.txt

  # fix default OCIO config path
  patch -p1 -i ../fix-default-ocio-path.patch
  # fix doc build
  sed -i '/^ *install.*doc/s/doc/htmlDoc/' src/CMakeLists.txt
}

build() {
  cd ${srcdir}/AliceVision

  cmake \
   	-Bbuild \
    -DALICEVISION_BUILD_DEPENDENCIES=ON \
    -DALICEVISION_INSTALL_MESHROOM_PLUGIN=ON \
    -DAV_BUILD_DEPENDENCIES_PARALLEL=0 \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_RPATH=/opt/alicevision/lib \
    -DAV_BUILD_CUDA=OFF \
	-DAV_BUILD_ZLIB=OFF \
	-DAV_BUILD_ASSIMP=OFF \
	-DAV_BUILD_TIFF=OFF \
	-DAV_BUILD_JPEG=OFF \
	-DAV_BUILD_PNG=ON \
	-DAV_BUILD_LIBRAW=OFF \
	-DAV_BUILD_POPSIFT=OFF \
	-DAV_BUILD_CCTAG=OFF \
	-DAV_BUILD_APRILTAG=OFF \
	-DAV_BUILD_OPENGV=OFF \
	-DAV_BUILD_OPENCV=OFF \
	-DAV_BUILD_ONNXRUNTIME=OFF \
	-DAV_BUILD_LAPACK=OFF \
	-DAV_BUILD_SUITESPARSE=OFF \
	-DAV_BUILD_FFMPEG=OFF \
	-DAV_BUILD_VPX=OFF \
	-DAV_BUILD_COINUTILS=OFF \
	-DAV_BUILD_OSI=OFF \
	-DAV_BUILD_CLP=OFF \
	-DAV_BUILD_FLANN=OFF \
	-DAV_BUILD_NANOFLANN=OFF \
	-DAV_BUILD_LEMON=OFF \
	-DAV_BUILD_E57FORMAT=OFF \
	-DAV_BUILD_PCL=OFF \
	-DAV_BUILD_USD=OFF \
	-DAV_BUILD_GEOGRAM=OFF \
	-DAV_BUILD_TBB=OFF \
	-DAV_BUILD_EIGEN=OFF \
	-DAV_BUILD_EXPAT=OFF \
	-DAV_BUILD_OPENEXR=OFF \
	-DAV_BUILD_ALEMBIC=OFF \
	-DAV_BUILD_OPENIMAGEIO=ON \
	-DAV_BUILD_BOOST=OFF \
	-DAV_BUILD_CERES=OFF \
	-DAV_BUILD_SWIG=OFF \
	-DAV_BUILD_PYBIND11=OFF \
	-DAV_BUILD_OPENMESH=OFF \
	-DAV_BUILD_ALICEVISION=ON

  make -C build

}

package() {
  local python_version=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
  
  install -vDm 644 "${srcdir}"/alicevision.sh -t "${pkgdir}"/etc/profile.d/

  cd ${srcdir}/AliceVision

  DESTDIR="${pkgdir}" make -C build install/fast
  DESTDIR="${pkgdir}" make -C build/external/aliceVision_build install/fast

  mkdir -p "${pkgdir}"/opt/alicevision/
  cp -r build/external/tmpinstall/{include,lib} "${pkgdir}"/opt/alicevision/
  
  mv "${pkgdir}"/usr/lib/python "${pkgdir}"/usr/lib/python"${python_version}"

  # Don't search for unofficial coin-or cmake config
  sed -e '/CoinUtils/d' -e '/Clp/d' -e '/Osi/d' -i "$pkgdir"/usr/share/aliceVision/cmake/AliceVisionConfig.cmake

  install -Dm755 COPYING.md "${pkgdir}"/usr/share/licenses/${pkgname}/COPYING.md
  install -Dm755 LICENSE-MPL2.md "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE-MPL2.md
  install -Dm755 LICENSE-MIT-libmv.md "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE-MIT-libmv.md
}

# vim:set ts=2 sw=2 et:
