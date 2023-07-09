# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Aleksandar Trifunović <akstrfn at gmail dot com>
# Contributor: Martin Sandsmark <martin.sandsmark@kde.org>

pkgname=abseil-cpp-git
pkgver=r1653.7152f9bc
pkgrel=3
pkgdesc="Collection of C++ library code designed to augment the C++ standard library"
arch=(x86_64 i686 armv7h aarch64)
url="https://abseil.io"
license=(Apache)
depends=(glibc gcc-libs gtest)
makedepends=(cmake git)
conflicts=(abseil-cpp)
provides=(abseil-cpp)
source=("git+https://github.com/abseil/abseil-cpp.git"
        "abseil-cpp-scoped-mock-log.patch::https://gitlab.archlinux.org/archlinux/packaging/packages/abseil-cpp/-/raw/1846afb3dd43f9a0dbbbda2c762cc36339b827fc/scoped-mock-log.patch")
sha256sums=('SKIP'
            'a6cbc612a2b96fcbd52d081e03e8581107ceb4827edb19d96510a31c568e1396')

prepare() {
  cd abseil-cpp
  patch -p1 -i ../abseil-cpp-scoped-mock-log.patch
}

pkgver() {
  cd abseil-cpp
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build -S abseil-cpp -Wno-dev \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    -DCMAKE_CXX_FLAGS="-DNDEBUG" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_CXX_STANDARD=17 \
    -DBUILD_SHARED_LIBS=ON \
    -DABSL_BUILD_TEST_HELPERS=ON \
    -DABSL_USE_EXTERNAL_GOOGLETEST=ON \
    -DABSL_FIND_GOOGLETEST=ON \
    -DABSL_PROPAGATE_CXX_STD=ON \
    -DABSL_BUILD_TESTING=ON \
    -DCMAKE_POSITION_INDEPENDENT_CODE=ON

  cmake --build build
}

check() {
  ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
