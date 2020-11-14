# Contributor: mewmew <rnd0x00@gmail.com>
# Maintainer: Kuan-Yen Chou <kuanyenchou at gmail dot com>

pkgname=remill-git
pkgver=v4.0.8.r0.g71c4d067
pkgrel=2
pkgdesc="Library for lifting of x86, amd64, and aarch64 machine code to LLVM bitcode"
arch=('x86_64')
url="https://github.com/lifting-bits/remill"
license=('Apache')
depends=('cxx-common=0.0.14' 'ncurses' 'zlib' 'lib32-glibc' 'lib32-gcc-libs')
makedepends=('git')
checkdepends=()
provides=('remill')
conflicts=('remill')
source=("$pkgname::git+https://github.com/lifting-bits/remill.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    export TRAILOFBITS_LIBRARIES="/opt/cxx-common/libraries"
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
    export TRAILOFBITS_LIBRARIES="/opt/cxx-common/libraries"
    export PATH="${TRAILOFBITS_LIBRARIES}/cmake/bin:${TRAILOFBITS_LIBRARIES}/llvm/bin:${PATH}"

    cd "$srcdir/$pkgname/build"
    make test_dependencies
    make test
}

package() {
    cd "$srcdir/$pkgname/build"
    make DESTDIR="${pkgdir}" install
    sed -i "$pkgdir/usr/lib/cmake/remill/remillConfig.cmake" \
        -e "s|$srcdir/$pkgname-$pkgver/build/lib|/usr/include/remill|g"
}

# vim: set sw=4 ts=4 et:
