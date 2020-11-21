# Contributor: mewmew <rnd0x00@gmail.com>
# Maintainer: Kuan-Yen Chou <kuanyenchou at gmail dot com>

pkgname=remill
pkgver=4.0.9
pkgrel=1
pkgdesc="Library for lifting of x86, amd64, and aarch64 machine code to LLVM bitcode"
arch=('x86_64')
url="https://github.com/lifting-bits/remill"
license=('Apache')
depends=('cxx-common=0.0.14' 'ncurses' 'zlib' 'lib32-glibc' 'lib32-gcc-libs'
         'libunwind')
makedepends=()
checkdepends=()
source=("https://github.com/lifting-bits/remill/archive/v${pkgver}.tar.gz"
        '00-fix-inst-CVTSI2SS.patch')
sha256sums=('facb3c9c1d9f47167150b92f08eac3e73af4db6d6115dafe204f8bd1c270102b'
            'fdec38eee1c770df5625f93ac1e017449e6d76455bf279f6865887aef0d8ee7a')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    patch -Np1 -i "$srcdir/00-fix-inst-CVTSI2SS.patch"
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
