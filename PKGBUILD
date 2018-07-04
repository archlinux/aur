# Maintainer: Martin Sandsmark <martin.sandsmark@kde.org>

pkgname=abseil-cpp-git
pkgver=r180.8f612eb
pkgrel=1
pkgdesc='An open-source collection of C++ code to augment the C++ standard library'
arch=('i686' 'x86_64')
url='https://github.com/abseil/abseil-cpp'
license=('LGPL')
depends=()
makedepends=('cmake' 'git')
conflicts=(abseil-cpp)
provides=(abseil-cpp)
source=('git+https://github.com/abseil/abseil-cpp.git')
md5sums=('SKIP')

pkgver() {
    cd abseil-cpp
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    mkdir -p build
}

build() {
    cd build
    cmake ../abseil-cpp
    make
}

package() {
    LIBS=('algorithm' 'base' 'container' 'debugging' 'memory' 'meta' 'numeric' 'strings' 'synchronization' 'time' 'types' 'utility')
    mkdir -p "${pkgdir}/usr/lib/"
    for LIB in "${LIBS[@]}"; do
        mkdir -p "${pkgdir}/usr/include/absl/${LIB}"
        install -m644 build/absl/${LIB}/*.a "${pkgdir}/usr/lib/"
        install -m644 abseil-cpp/absl/${LIB}/*.h "${pkgdir}/usr/include/absl/${LIB}"
    done
}
