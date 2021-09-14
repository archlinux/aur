# Contributor: mewmew <rnd0x00@gmail.com>
# Maintainer: Kuan-Yen Chou <kuanyenchou at gmail dot com>

pkgname=remill
pkgver=4.0.24
pkgrel=2
pkgdesc="Library for lifting of x86, amd64, and aarch64 machine code to LLVM bitcode"
arch=('x86_64')
url="https://github.com/lifting-bits/remill"
license=('Apache')
depends=('cxx-common=0.1.4' 'lib32-glibc' 'lib32-gcc-libs' 'libunwind')
makedepends=('cmake' 'ninja')
checkdepends=()
source=("https://github.com/lifting-bits/remill/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('c4e85a642e555eb365c971605333cfc1600b9f0af1976be717f04ee0b1605b51')

build() {
    vcpkg_libs='/opt/cxx-common/installed/x64-linux-rel'
    export PATH="$vcpkg_libs/bin:$vcpkg_libs/tools/*:${PATH}"
    export CC="$vcpkg_libs/tools/llvm/clang"
    export CXX="$vcpkg_libs/tools/llvm/clang++"

    cd "$srcdir/$pkgname-$pkgver"
    mkdir -p build && cd build
    cmake \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DVCPKG_ROOT="/opt/cxx-common" \
        -G Ninja \
        "$srcdir/$pkgname-$pkgver"
    cmake --build .
}

check() {
    cd "$srcdir/$pkgname-$pkgver/build"
    cmake --build . --target test_dependencies
    cmake --build . --target test
}

package() {
    cd "$srcdir/$pkgname-$pkgver/build"
    DESTDIR="${pkgdir}" cmake --build . --target install
    sed -i "$pkgdir/usr/lib/cmake/remill/remillTargets.cmake" \
        -e "s|$srcdir/$pkgname-$pkgver/build/lib|/usr/include/remill|g"
}

# vim: set sw=4 ts=4 et:
