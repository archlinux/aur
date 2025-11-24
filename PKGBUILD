# Maintainer: sfn
# Contributor: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: bartus <arch-user-repoᘓbartus.33mail.com>

pkgname='alice-vision'
pkgver=3.3.1
pkgrel=1
options=('!debug') # debug package is kinda big -- needs investigation!
pkgdesc="Photogrammetric Computer Vision Framework which provides 3D Reconstruction and Camera Tracking algorithms"
arch=('x86_64')
url="https://alicevision.org/"
license=('MPL-2.0' 'MIT')
depends=('boost-libs' 'geogram' 'coin-or-clp' 'coin-or-coinutils' 'ceres-solver' 'openmesh' 'jemalloc' 'zlib'
         'alembic' 'popsift' 'assimp' 'onnxruntime' 'cuda' 'openimageio' 'usd')
makedepends=('boost' 'eigen' 'freetype2' 'flann' 'cctag' 'onnx' 'swig' 'expat'
             'git' 'cmake' 'doxygen' 'python-sphinx' 'nanoflann')
optdepends=('apriltag: Recognition of Apriltags'
			'libe57format: e57 3d imaging format I/O')
source=("git+https://github.com/alicevision/AliceVision.git#tag=v${pkgver}"
        "MeshSDFilter::git+https://github.com/alicevision/MeshSDFilter.git#branch=av_develop"
        "git+https://github.com/alicevision/lemon#commit=8885b9a"
        "fix-default-ocio-path.patch"
        "alicevision.sh")

sha256sums=('395661cda7ac46e9f694a568a8e7caf42989da64d2e0b206a667881d10ddae71'
            'SKIP'
            '30be1cb0a282f389fe8137b695813d4b53a5a13746fd91245ce8e83e773478cf'
            '3f02c715f27498ac8982edee3e3af151b0cd2a9cb83da37fef3b7fec1e34b169'
            'b474a12823b1fb0e1613bba0d7bd455f63124aa8c29b3d00df94f0a3c00ab900')

prepare() {
  # Lemon build
  sed 's|VERSION 2.8|VERSION 3.5|g' -i lemon/CMakeLists.txt
  sed 's|\(CMP0048\) OLD|\1 NEW|g' -i lemon/CMakeLists.txt

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

  # lto is broken for cuda objects
  sed -e 's|\(${CUDA_NVCC_FLAGS};-std=c++20\)|\1;-Xcompiler=-fno-lto|g' -i src/CMakeLists.txt

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

  # fix build against newer cuda
  sed 's|\(<< "\\t- clock frequency (kHz):\)|//\1|g' -i src/aliceVision/gpu/gpu.cpp
  sed 's|ALICEVISION_CUDA_CC_LIST_BASIC 50 52 60 61 62 70 72 75 80 86 87 89 90|ALICEVISION_CUDA_CC_LIST_BASIC 75 80 86 87 89 90|g' -i src/CMakeLists.txt

  # patch build against newer usd
  sed 's|<pxr/usd/usd/zipFile.h>|<pxr/usd/sdf/zipFile.h>|g' -i src/software/export/main_exportUSD.cpp
  sed 's|UsdZipFileWriter|SdfZipFileWriter|g' -i src/software/export/main_exportUSD.cpp
  sed '/usdShade/a usd_ms' -i src/software/export/CMakeLists.txt
}

build() {
  cd ${srcdir}/lemon
  cmake -Bbuild -DCMAKE_CXX_STANDARD=20 -DCMAKE_INSTALL_PREFIX=${srcdir}/lemon/install
  make -C build && make -C build install

  local python_version=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
  cd ${srcdir}/AliceVision

  cmake \
   	-Bbuild \
    -DALICEVISION_BUILD_DEPENDENCIES=OFF \
    -DALICEVISION_INSTALL_MESHROOM_PLUGIN=ON \
    -DALICEVISION_BUILD_SWIG_BINDINGS=ON \
    -DALICEVISION_BUILD_DOC=OFF \
    -DLEMON_DIR=${srcdir}/lemon/install/share/lemon/cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_SYSTEM_INCLUDE_PATH='/usr/include/python"${python_version}/' \
    -DCMAKE_SKIP_INSTALL_RPATH=ON

  make -C build

}

package() {
  install -vDm 644 "${srcdir}"/alicevision.sh -t "${pkgdir}"/etc/profile.d/

  cd ${srcdir}/AliceVision

  DESTDIR="${pkgdir}" make -C build install/fast

  install -Dm755 COPYING.md "${pkgdir}"/usr/share/licenses/${pkgname}/COPYING.md
  install -Dm755 LICENSE-MPL2.md "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE-MPL2.md
  install -Dm755 LICENSE-MIT-libmv.md "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE-MIT-libmv.md
}

# vim:set ts=2 sw=2 et:
