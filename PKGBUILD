# Contributor: mewmew <rnd0x00@gmail.com>
# Maintainer: Kuan-Yen Chou <kuanyenchou at gmail dot com>

pkgname=remill-git
pkgver=v4.0.6.r0.g63887881
pkgrel=1
pkgdesc="Library for lifting of x86, amd64, and aarch64 machine code to LLVM bitcode"
arch=('x86_64')
url="https://github.com/lifting-bits/remill"
license=('Apache')
depends=('clang' 'llvm' 'llvm-libs' 'intelxed' 'google-glog' 'gflags' 'lib32-glibc')
makedepends=('git' 'cmake' 'gtest')
provides=('remill')
conflicts=('remill')
source=("$pkgname::git+https://github.com/lifting-bits/remill.git"
        'remove-sysdeps.patch')
sha256sums=('SKIP'
            '4e17d1298304b16447d4a4736dd2318a39139b95e06bf557a26e1d764ff00329')

prepare() {
    cd "$srcdir/$pkgname"
    patch -Np1 -i "$srcdir/remove-sysdeps.patch"
}

pkgver() {
    cd "$srcdir/$pkgname"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/$pkgname"
    mkdir -p build && cd build
    cmake \
        -DCMAKE_C_COMPILER=/usr/bin/clang \
        -DCMAKE_CXX_COMPILER=/usr/bin/clang++ \
        -DCMAKE_BC_COMPILER=/usr/bin/clang++ \
        -DCMAKE_BC_LINKER=/usr/bin/llvm-link \
        -DLLVM_Z3_INSTALL_DIR=/usr \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_VERBOSE_MAKEFILE=True \
        "${srcdir}/${pkgname}"
    make
    #make test_dependencies
}

#check() {
#    cd "$srcdir/$pkgname/build"
#    make test
#}

package() {
    cd "$srcdir/$pkgname/build"
    make DESTDIR="${pkgdir}" install
}

# vim: set sw=4 ts=4 et:
