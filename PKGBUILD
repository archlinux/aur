# Contributor: mewmew <rnd0x00@gmail.com>
# Maintainer: Kuan-Yen Chou <kuanyenchou at gmail dot com>

pkgname=remill
pkgver=4.0.9
pkgrel=2
pkgdesc="Library for lifting of x86, amd64, and aarch64 machine code to LLVM bitcode"
arch=('x86_64')
url="https://github.com/lifting-bits/remill"
license=('Apache')
depends=('cxx-common=0.0.14' 'ncurses' 'zlib' 'lib32-glibc' 'lib32-gcc-libs'
         'libunwind')
makedepends=()
checkdepends=()
source=("https://github.com/lifting-bits/remill/archive/v${pkgver}.tar.gz"
        '00-fix-CONVERT-instructions.patch'
        '01-show-instruction.patch')
sha256sums=('facb3c9c1d9f47167150b92f08eac3e73af4db6d6115dafe204f8bd1c270102b'
            'b2ab3e9c6b047eddac5cffb189b260fa0c1f6e21c88b343fcaef79110544f9e6'
            '16009715ef4e2546349238120ab9ad0c04ef1ed77cc360e64f599aeb4a0ad987')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    patch -Np1 -i "$srcdir/00-fix-CONVERT-instructions.patch"
    patch -Np1 -i "$srcdir/01-show-instruction.patch"
}

build() {
    export TRAILOFBITS_LIBRARIES="/opt/cxx-common/libraries"
    export PATH="${TRAILOFBITS_LIBRARIES}/cmake/bin:${TRAILOFBITS_LIBRARIES}/llvm/bin:${PATH}"

    cd "$srcdir/$pkgname-$pkgver"
    mkdir -p build && cd build
    "${TRAILOFBITS_LIBRARIES}/cmake/bin/cmake" \
        -DCMAKE_C_COMPILER="${TRAILOFBITS_LIBRARIES}/llvm/bin/clang" \
        -DCMAKE_CXX_COMPILER="${TRAILOFBITS_LIBRARIES}/llvm/bin/clang++" \
        -DCMAKE_BC_COMPILER="${TRAILOFBITS_LIBRARIES}/llvm/bin/clang++" \
        -DCMAKE_BC_LINKER="${TRAILOFBITS_LIBRARIES}/llvm/bin/llvm-link" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_VERBOSE_MAKEFILE=True \
        "$srcdir/$pkgname-$pkgver"
    make
}

check() {
    export TRAILOFBITS_LIBRARIES="/opt/cxx-common/libraries"
    export PATH="${TRAILOFBITS_LIBRARIES}/cmake/bin:${TRAILOFBITS_LIBRARIES}/llvm/bin:${PATH}"

    cd "$srcdir/$pkgname-$pkgver/build"
    make test_dependencies
    make test
}

package() {
    cd "$srcdir/$pkgname-$pkgver/build"
    make DESTDIR="${pkgdir}" install
    sed -i "$pkgdir/usr/lib/cmake/remill/remillConfig.cmake" \
        -e "s|$srcdir/$pkgname-$pkgver/build/lib|/usr/include/remill|g"
}

# vim: set sw=4 ts=4 et:
