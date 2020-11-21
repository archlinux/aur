# Contributor: mewmew <rnd0x00@gmail.com>
# Maintainer: Kuan-Yen Chou <kuanyenchou at gmail dot com>

pkgname=remill-git
pkgver=v4.0.9.r0.gbf69d9ca
pkgrel=2
pkgdesc="Library for lifting of x86, amd64, and aarch64 machine code to LLVM bitcode"
arch=('x86_64')
url="https://github.com/lifting-bits/remill"
license=('Apache')
depends=('cxx-common=0.0.14' 'ncurses' 'zlib' 'lib32-glibc' 'lib32-gcc-libs'
         'libunwind')
makedepends=('git')
checkdepends=()
provides=('remill')
conflicts=('remill')
source=("$pkgname::git+https://github.com/lifting-bits/remill.git"
        '00-fix-CONVERT-instructions.patch'
        '01-show-instruction.patch')
sha256sums=('SKIP'
            'b2ab3e9c6b047eddac5cffb189b260fa0c1f6e21c88b343fcaef79110544f9e6'
            '16009715ef4e2546349238120ab9ad0c04ef1ed77cc360e64f599aeb4a0ad987')

prepare() {
    cd "$srcdir/$pkgname"
    patch -Np1 -i "$srcdir/00-fix-CONVERT-instructions.patch"
    patch -Np1 -i "$srcdir/01-show-instruction.patch"
}

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
        -e "s|$srcdir/$pkgname/build/lib|/usr/include/remill|g"
}

# vim: set sw=4 ts=4 et:
