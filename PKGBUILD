# Maintainer: Kuan-Yen Chou <kuanyenchou at gmail dot com>

pkgname=anvill
pkgver=0.1.39
pkgrel=2
pkgdesc="Forge beautiful LLVM bitcode out of raw machine code"
arch=('x86_64')
url="https://github.com/lifting-bits/anvill"
license=('AGPL3')
depends=('cxx-common=0.1.4' 'remill' 'python' 'libunwind')
makedepends=('cmake' 'ninja' 'python-setuptools')
source=("https://github.com/lifting-bits/anvill/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('df0f3062807d2476ddcd58a33760c2d9ae14027a113562863c1603688faa356c')

build() {
    vcpkg_libs='/opt/cxx-common/installed/x64-linux-rel'
    export PATH="$vcpkg_libs/bin:$vcpkg_libs/tools/*:${PATH}"
    export CC="$vcpkg_libs/tools/llvm/clang"
    export CXX="$vcpkg_libs/tools/llvm/clang++"

    cd "$srcdir/$pkgname-$pkgver"
    mkdir -p build && cd build
    cmake \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DANVILL_ENABLE_INSTALL_TARGET=True \
        -DANVILL_ENABLE_TESTS=True \
        -DVCPKG_ROOT="/opt/cxx-common" \
        -G Ninja \
        "$srcdir/$pkgname-$pkgver"
    cmake --build .
}

#check() {
#    cd "$srcdir/$pkgname-$pkgver"
#    cmake --build build --target test
#}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    DESTDIR="${pkgdir}" cmake --build build --target install
}

# vim: set sw=4 ts=4 et:
