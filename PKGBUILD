# maintainer: bipin <kbipinkumar@pm.me>
pkgname=libgff
pkgver=2.0.0
pkgrel=0
pkgdesc="A simple "libraryfication" of the GFF/GTF parsing code used in GFFRead"
arch=(x86_64)
url="https://github.com/COMBINE-lab/libgff"
license=('BSL-1.0')
depends=('glibc' 'gcc-libs')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/COMBINE-lab/libgff/archive/refs/tags/v${pkgver}.tar.gz"
        )
sha256sums=('7656b19459a7ca7d2fd0fcec4f2e0fd0deec1b4f39c703a114e8f4c22d82a99c')

prepare() {
  cd $pkgname-$pkgver
  sed -i 's|add_library(${PROJECT_NAME} STATIC ${GFFLib_SRCS})|add_library(${PROJECT_NAME} SHARED ${GFFLib_SRCS})|g' CMakeLists.txt
  sed -i 's|lib${PROJECT_NAME}.a|lib${PROJECT_NAME}.so|g' CMakeLists.txt
  sed -i 's|set_and_check(LIB_GFF_STATIC_LIBRARY "@PACKAGE_LIB_INSTALL_DIR@libgff.a")|set_and_check(LIB_GFF_SHARED_LIBRARY "@PACKAGE_LIB_INSTALL_DIR@libgff.so")|g' libgffConfig.cmake.in
}

build() {
  cd $pkgname-$pkgver
  cmake -B build \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=None  \
    -Wno-dev \
    -DCMAKE_SKIP_INSTALL_RPATH=YES

   MAKEFLAGS=-j1 cmake --build build

}

package() {
  cd $pkgname-$pkgver
  DESTDIR="$pkgdir" cmake --install build
}
