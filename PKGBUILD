# Maintainer: sfn
# Contributor: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: bartus <arch-user-repoᘓbartus.33mail.com>

pkgname='alice-vision'
pkgver=3.3.7
pkgrel=1
options=('!debug') # debug package is kinda big -- needs investigation!
pkgdesc="Photogrammetric Computer Vision Framework which provides 3D Reconstruction and Camera Tracking algorithms"
arch=('x86_64')
url="https://alicevision.org/"
license=('MPL-2.0' 'MIT')
depends=('boost-libs' 'geogram' 'coin-or-clp' 'coin-or-coinutils' 'coin-or-lemon' 'ceres-solver' 'openmesh' 'jemalloc' 'zlib'
         'alembic' 'popsift' 'assimp' 'onnxruntime' 'openimageio' 'usd' 'flann' 'python-numpy')
makedepends=('boost' 'eigen' 'freetype2' 'flann' 'cctag' 'onnx' 'swig' 'expat'
             'git' 'cmake' 'doxygen' 'python-sphinx' 'nanoflann' 'metis' 'libe57format')
optdepends=('apriltag: Recognition of Apriltags'
			'libe57format: e57 3d imaging format I/O'
			'cuda: enables CUDA backend for depthMap computation'
			'adaptivecpp: enables SYCL backend for depthMap computation')
source=("git+https://github.com/alicevision/AliceVision.git#tag=v${pkgver}"
        "MeshSDFilter::git+https://github.com/alicevision/MeshSDFilter.git#branch=av_develop"
        "fix-default-ocio-path.patch"
        "alicevision.sh")

sha256sums=('66981859a7fe2ab79d5cf32312c1c0d960e03e4f2f605a4b496436504aebd84b'
            'SKIP'
            '3f02c715f27498ac8982edee3e3af151b0cd2a9cb83da37fef3b7fec1e34b169'
            'b474a12823b1fb0e1613bba0d7bd455f63124aa8c29b3d00df94f0a3c00ab900')

prepare() {
  cd AliceVision

  git submodule init
  git config submodule."src/dependencies/MeshSDFilter".url "${srcdir}/MeshSDFilter"
  git -c protocol.file.allow=always submodule update

  # we don't want this as it causes a segfault and anyway we want to refer to makepkg config
  sed 's|OptimizeForArchitecture()||g'  -i src/CMakeLists.txt

  # Patch to find system lz4 and coinutils
  sed '1i find_package(PkgConfig REQUIRED)' -i src/CMakeLists.txt
  sed '1i find_package(PkgConfig REQUIRED)' -i src/cmake/AliceVisionConfig.cmake.in
  
  sed 's|find_package(lz4 REQUIRED)|pkg_check_modules(lz4 REQUIRED IMPORTED_TARGET liblz4)|g' -i src/CMakeLists.txt
  sed 's|lz4::lz4|PkgConfig::lz4|g' -i src/CMakeLists.txt

  sed 's|find_package(CoinUtils REQUIRED)|pkg_check_modules(CoinUtils REQUIRED IMPORTED_TARGET coinutils)|g' -i src/CMakeLists.txt
  sed 's|find_package(Clp REQUIRED)|pkg_check_modules(Clp REQUIRED IMPORTED_TARGET clp)|g' -i src/CMakeLists.txt
  sed 's|find_package(Osi REQUIRED)|pkg_check_modules(Osi REQUIRED IMPORTED_TARGET osi-clp)|g' -i src/CMakeLists.txt
  sed 's|find_dependency(CoinUtils REQUIRED)|pkg_check_modules(CoinUtils REQUIRED IMPORTED_TARGET coinutils)|g' -i src/cmake/AliceVisionConfig.cmake.in
  sed 's|find_dependency(Clp REQUIRED)|pkg_check_modules(Clp REQUIRED IMPORTED_TARGET clp)|g' -i src/cmake/AliceVisionConfig.cmake.in
  sed 's|find_dependency(Osi REQUIRED)|pkg_check_modules(Osi REQUIRED IMPORTED_TARGET osi-clp)|g' -i src/cmake/AliceVisionConfig.cmake.in

  sed 's|Coin::|PkgConfig::|g' -i src/*/*/CMakeLists.txt

  # eigen 5.x compat
  sed -i "s|Eigen3 3.3 REQUIRED|Eigen3 REQUIRED|g" src/CMakeLists.txt

  # popsift compat
  sed 's|PopSift 0.10|PopSift|g' -i src/cmake/AliceVisionConfig.cmake.in

  # fix default OCIO config path
  patch -p1 -i ../fix-default-ocio-path.patch
  
  # fix doc build
  sed 's|docs/sphinx/rst|docs/sphinx|g' -i src/CMakeLists.txt

  # fix build against newer boost
  sed 's|Boost 1.76.0|Boost|g' -i src/CMakeLists.txt
  sed '/Boost::system/d' -i src/software/convert/CMakeLists.txt
  sed '/Boost::system/d' -i src/aliceVision/system/CMakeLists.txt
  sed '/Boost::system/d' -i src/aliceVision/sensorDB/CMakeLists.txt
  sed 's|serialization system thread|serialization thread|g' -i src/CMakeLists.txt

  # fix errors from manually specifying a toolchain
  sed 's|if (NOT _alicevision_acpp_extra_args|if (FALSE AND NOT _alicevision_acpp_extra_args|g' -i src/CMakeLists.txt

  # fix build against newer cuda
  sed 's|\(<< "\\t- clock frequency (kHz):\)|//\1|g' -i src/aliceVision/gpu/gpu.cpp
  sed 's|ALICEVISION_CUDA_CC_LIST_BASIC 50 52 60 61 62 70 72 75 80 86 87 89 90|ALICEVISION_CUDA_CC_LIST_BASIC 75 80 86 87 89 90|g' -i src/CMakeLists.txt

  # patch build against newer usd
  sed 's|<pxr/usd/usd/zipFile.h>|<pxr/usd/sdf/zipFile.h>|g' -i src/software/export/main_exportUSD.cpp
  sed 's|UsdZipFileWriter|SdfZipFileWriter|g' -i src/software/export/main_exportUSD.cpp
  sed '/usd/a usd_ms' -i src/software/export/CMakeLists.txt
  sed '/PUBLIC usd/a usd_ms' -i src/aliceVision/sfmDataIO/CMakeLists.txt

  # patch build against newer nanoflann
  sed 's|typename IndexType|typename _IndexType|g' -i src/aliceVision/fuseCut/Kdtree.hpp
  sed  '/using DistanceType/a using IndexType = _IndexType;' -i src/aliceVision/fuseCut/Kdtree.hpp
  sed 's|typename IndexType|typename _IndexType|g' -i src/software/convert/main_importE57.cpp
  sed  '/using DistanceType/a using IndexType = _IndexType;' -i src/software/convert/main_importE57.cpp
}

build() {
  local python_version=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
  cd ${srcdir}/AliceVision

  local CXXFLAGS="${CXXFLAGS//-Wp,-D_GLIBCXX_ASSERTIONS/}" # causes issues

  cmake \
   	-Bbuild \
    -DALICEVISION_BUILD_DEPENDENCIES=OFF \
    -DALICEVISION_INSTALL_MESHROOM_PLUGIN=ON \
    -DALICEVISION_BUILD_SWIG_BINDING=ON \
    -DALICEVISION_USE_CUDA=AUTO \
    -DALICEVISION_USE_SYCL=AUTO \
    -DALICEVISION_BUILD_DOC=OFF \
    -DACPP_USE_ACCELERATED_CPU=ON \
    -DACPP_EXTRA_ARGS="-fno-lto" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_SYSTEM_INCLUDE_PATH='/usr/include/python"${python_version}/' \
    -DCMAKE_SKIP_INSTALL_RPATH=ON

  # enforce no lto for sycl, it is currently broken on arch
  #sed 's|\-flto||g' -i build/src/aliceVision/depthMap_sycl/CMakeFiles/aliceVision_depthMap_sycl.dir/link.txt
  sed 's|\-flto[=[:alnum:]]* ||g' -i build/src/aliceVision/depthMap_sycl/CMakeFiles/aliceVision_depthMap_sycl.dir/{flags.make,link.txt}

  make -C build
}

package() {
  install -vDm 644 "${srcdir}"/alicevision.sh -t "${pkgdir}"/etc/profile.d/

  cd ${srcdir}/AliceVision

  DESTDIR="${pkgdir}" make -C build install/fast
  
  install -Dm755 COPYING.md "${pkgdir}"/usr/share/licenses/${pkgname}/COPYING.md
  install -Dm755 LICENSE-MPL2.md "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE-MPL2.md
  install -Dm755 LICENSE-MIT-libmv.md "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE-MIT-libmv.md

  # python install location
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  mkdir -p ${pkgdir}${site_packages}
  mv -T ${pkgdir}/usr/lib/python/pyalicevision ${pkgdir}${site_packages}/pyalicevision
  rmdir ${pkgdir}/usr/lib/python
}

# vim:set ts=2 sw=2 et:
