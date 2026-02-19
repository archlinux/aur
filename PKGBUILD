# Maintainer: Vincent Schult <viboschu@gmail.com>
pkgname=lehrfempp-git
pkgver=0.9.3.r13.gd6f3e73
pkgrel=1
pkgdesc="Simple C++ Finite Element Framework for research and education optimized for clarity and flexibility with some trade-off concerning performance."
arch=(x86_64)
url="https://github.com/craffael/lehrfempp"
license=(MIT)

depends=(
  boost
  eigen
  spdlog
  gtest
)

makedepends=(
  cmake
  ninja
  git
)

provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")

source=("${pkgname%-git}::git+https://github.com/craffael/lehrfempp.git")
sha256sums=('SKIP')

pkgver(){
  cd "$srcdir/${pkgname%-git}"
  git describe --long --tags --abbrev=7 | sed 's/^release-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare(){
  cd "$srcdir/${pkgname%-git}"

  sed -i 's|include("${CMAKE_CURRENT_LIST_DIR}/HunterGate.cmake")||' cmake/functions.cmake
  sed -i '/HunterGate\s*(/,/)/d' CMakeLists.txt
  sed -i '/hunter_add_package\s*(/d' CMakeLists.txt

  if ! grep -q "PATCH_NO_HUNTER_DEPS" CMakeLists.txt; then
    sed -i '/project(LehrFEMpp/ a\
# PATCH_NO_HUNTER_DEPS\
find_package(Boost REQUIRED)\
find_package(Eigen3 CONFIG REQUIRED)\
find_package(spdlog CONFIG REQUIRED)\
find_package(GTest CONFIG REQUIRED)\
' \
    CMakeLists.txt
  fi
}

build(){
  cd "$srcdir/${pkgname%-git}"
  cmake -S . -B build -G Ninja -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DLF_BUILD_DOC=OFF -DLF_BUILD_EXAMPLES=OFF -DLF_ENABLE_TESTING=OFF
  cmake --build build
}

package() {
  cd "$srcdir/${pkgname%-git}"
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
