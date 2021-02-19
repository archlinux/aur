# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=highway-git
pkgver=0.11.0.r0.g18191fa
pkgrel=1
pkgdesc='A C++ library for SIMD (Single Instruction, Multiple Data) (git version)'
arch=('x86_64')
url='https://github.com/google/highway/'
license=('Apache')
makedepends=('git' 'cmake' 'gtest')
source=('git+https://github.com/google/highway.git')
sha256sums=('SKIP')

pkgver() {
    git -C highway describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    export CXXFLAGS+=' -DHWY_COMPILE_ALL_ATTAINABLE'
    cmake -B build -S highway \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DHWY_SYSTEM_GTEST:BOOL='ON' \
        -Wno-dev
    make -C build
}

check() {
    make -C build test
}

package() {
    make -C build DESTDIR="$pkgdir" install
}
