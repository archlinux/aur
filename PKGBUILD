# Contributor: mewmew <rnd0x00@gmail.com>
# Maintainer: Kuan-Yen Chou <kuanyenchou at gmail dot com>

pkgname=remill-git
pkgver=v4.0.8.r0.g71c4d067
pkgrel=1
_cxxcommonver=0.0.14
pkgdesc="Library for lifting of x86, amd64, and aarch64 machine code to LLVM bitcode"
arch=('x86_64')
url="https://github.com/lifting-bits/remill"
license=('Apache')
depends=('ncurses' 'zlib' 'lib32-glibc')
makedepends=('git')
checkdepends=()
provides=('remill')
conflicts=('remill')
source=("$pkgname::git+https://github.com/lifting-bits/remill.git"
        "https://github.com/trailofbits/cxx-common/releases/download/v${_cxxcommonver}/libraries-llvm1100-ubuntu20.04-amd64.tar.xz")
sha256sums=('SKIP'
            '7a680ea1185dfb83bc8a2c3bdb7930e5c1dfc7d78e3af16da65ca525e82ade39')

pkgver() {
    cd "$srcdir/$pkgname"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    export TRAILOFBITS_LIBRARIES="$srcdir/libraries"
    export PATH="${TRAILOFBITS_LIBRARIES}/cmake/bin:${TRAILOFBITS_LIBRARIES}/llvm/bin:${PATH}"

    cd "$srcdir/$pkgname"
    mkdir -p build && cd build
    "${TRAILOFBITS_LIBRARIES}/cmake/bin/cmake" \
        -DCMAKE_C_COMPILER="${TRAILOFBITS_LIBRARIES}/llvm/bin/clang" \
        -DCMAKE_CXX_COMPILER="${TRAILOFBITS_LIBRARIES}/llvm/bin/clang++" \
        -DCMAKE_BC_COMPILER="${TRAILOFBITS_LIBRARIES}/llvm/bin/clang++" \
        -DCMAKE_BC_LINKER="${TRAILOFBITS_LIBRARIES}/llvm/bin/llvm-link" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_VERBOSE_MAKEFILE=True \
        "${srcdir}/${pkgname}"
    make
}

check() {
    export TRAILOFBITS_LIBRARIES="$srcdir/libraries"
    export PATH="${TRAILOFBITS_LIBRARIES}/cmake/bin:${TRAILOFBITS_LIBRARIES}/llvm/bin:${PATH}"

    cd "$srcdir/$pkgname/build"
    make test_dependencies
    make test
}

package() {
    cd "$srcdir/$pkgname/build"
    make DESTDIR="${pkgdir}" install
}

# vim: set sw=4 ts=4 et:
