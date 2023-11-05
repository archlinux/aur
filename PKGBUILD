# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=qt5-quartz-git
pkgver=1.0.0.7.g1f07a9b
pkgrel=1
pkgdesc="Raytrace over Vulkan for Qt (works only Nvidia RTX users). (GIT version)"
arch=('x86_64')
url='https://github.com/Nadrin/Quartz'
license=('GPL')
depends=(
  'gcc-libs' # libgcc_s.so libstdc++.so
  'glibc' # libc.so libm.so
  'qt5-base' # libQt5Core.so libQt5Gui.so libQt5Widgets.so
  'qt5-3d' # libQt53DCore.so libQt53DInput.so libQt53DLogic.so libQt53DQuick.so
  'qt5-declarative' # libQt5Qml.so
  'assimp' # libassimp.so
  'vulkan-icd-loader'
)
makedepends=(
  'qt5-tools'
  'cmake'
  'git'
  'python'
  'vulkan-headers'
)
provides=(
  'qt5-quatz'
  'libQt53DRaytrace.so'
  'libQt53DRaytraceExtras.so'
)
conflicts=('qt5-quatz')
source=(
  'git+https://github.com/Nadrin/Quartz.git'
  'esee.esee'
  'https://github.com/Tadinu/Quartz/commit/0588508494f510a6f2976e6ed21d448bf67c0f22.diff'
)
sha256sums=(
  'SKIP'
  '914d41daca125b498bf948b316db2ee5e3e04464b42ab2224a464372c8b1dbff'
  '9915d51d03464a878270e93f1be986a822a3ec6865b856f546727f95d7449c83'
)

pkgver() {
  cd Quartz
  echo "$(git describe --long --tags | tr - . | tr -d v)"
}

prepare() {
  cd Quartz
  # Fox build with Qt5.15+
  patch -p1 -i "${srcdir}/0588508494f510a6f2976e6ed21d448bf67c0f22.diff"
  # bring install
  patch -p1 -i "${srcdir}/esee.esee"
  # missing header
  sed '3152i#include <cstdio>' -i 3rdparty/vma/vk_mem_alloc.h

  # Build Shaders
  python src/raytrace/renderers/vulkan/shaders/compile.py
}

build() {
  cmake -S Quartz -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DBUILD_EXAMPLES=OFF \
    -DCMAKE_SKIP_RPATH=ON

  LC_ALL=C cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
