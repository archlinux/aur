# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=highway-git
pkgver=1.0.4.r1.gd8fa48e
pkgrel=1
pkgdesc='A C++ library for SIMD (Single Instruction, Multiple Data) (git version)'
arch=('x86_64')
url='https://github.com/google/highway/'
license=('Apache')
depends=('gcc-libs')
makedepends=('git' 'cmake' 'gtest')
provides=('highway')
conflicts=('highway')
source=('git+https://github.com/google/highway.git')
sha256sums=('SKIP')

pkgver() {
    git -C highway describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    cmake -B build -S highway \
        -G 'Unix Makefiles' \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DBUILD_SHARED_LIBS:BOOL='ON' \
        -DHWY_SYSTEM_GTEST:BOOL='ON' \
        -Wno-dev
    cmake --build build
}

check() {
    ctest --test-dir build --output-on-failure
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
