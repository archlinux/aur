# Contributor: mewmew <rnd0x00@gmail.com>
# Maintainer: Kuan-Yen Chou <kuanyenchou at gmail dot com>

pkgname=remill
pkgver=4.0.11
pkgrel=1
pkgdesc="Library for lifting of x86, amd64, and aarch64 machine code to LLVM bitcode"
arch=('x86_64')
url="https://github.com/lifting-bits/remill"
license=('Apache')
depends=('cxx-common=0.1.1' 'lib32-glibc' 'lib32-gcc-libs' 'libunwind')
makedepends=('cmake')
checkdepends=()
source=("https://github.com/lifting-bits/remill/archive/v${pkgver}.tar.gz")
sha256sums=('8a3c3df40dacef3cad0162279e3153f4404a88d8e55d002ce9b4b37177fc3d77')

build() {
    vcpkg_libs='/opt/cxx-common/installed/x64-linux-rel'
    export PATH="$vcpkg_libs/bin:${PATH}"
    export CC="$vcpkg_libs/bin/clang"
    export CXX="$vcpkg_libs/bin/clang++"

    cd "$srcdir/$pkgname-$pkgver"
    mkdir -p build && cd build
    cmake \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_VERBOSE_MAKEFILE=True \
        -DVCPKG_ROOT="/opt/cxx-common" \
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
    cmake --build . --target install -- DESTDIR="${pkgdir}"
    sed -i "$pkgdir/usr/lib/cmake/remill/remillTargets.cmake" \
        -e "s|$srcdir/$pkgname-$pkgver/build/lib|/usr/include/remill|g"
}

# vim: set sw=4 ts=4 et:
