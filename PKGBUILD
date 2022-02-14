# Contributor: mewmew <rnd0x00@gmail.com>
# Maintainer: Kuan-Yen Chou <kuanyenchou at gmail dot com>

pkgname=remill-git
pkgver=4.2.0.r6.g161e0358
pkgrel=1
pkgdesc="Library for lifting of x86, amd64, and aarch64 machine code to LLVM bitcode"
arch=('x86_64')
url="https://github.com/lifting-bits/remill"
license=('Apache')
depends=('cxx-common=0.1.8' 'lib32-glibc' 'lib32-gcc-libs' 'libunwind')
makedepends=('cmake' 'ninja')
checkdepends=()
provides=('remill')
conflicts=('remill')
source=("$pkgname::git+https://github.com/lifting-bits/remill")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    if git describe --long --tags >/dev/null 2>&1; then
        git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
    else
        printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git describe --always)"
    fi
}

build() {
    vcpkg_libs='/opt/cxx-common/installed/x64-linux-rel'
    export PATH="$vcpkg_libs/bin:$vcpkg_libs/tools/*:${PATH}"
    export CC="$vcpkg_libs/tools/llvm/clang"
    export CXX="$vcpkg_libs/tools/llvm/clang++"

    cd "$srcdir/$pkgname"
    mkdir -p build && cd build
    cmake \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DVCPKG_ROOT="/opt/cxx-common" \
        -G Ninja \
        "$srcdir/$pkgname"
    cmake --build .
}

check() {
    cd "$srcdir/$pkgname/build"
    cmake --build . --target test_dependencies
    cmake --build . --target test
}

package() {
    cd "$srcdir/$pkgname/build"
    DESTDIR="${pkgdir}" cmake --build . --target install
    sed -i "$pkgdir/usr/lib/cmake/remill/remillTargets.cmake" \
        -e "s,$srcdir/$pkgname/build/lib,/usr/include/remill,g"
}

# vim: set sw=4 ts=4 et:
