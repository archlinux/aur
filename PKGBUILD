# Contributor: mewmew <rnd0x00@gmail.com>
# Maintainer: Kuan-Yen Chou <kuanyenchou at gmail dot com>

pkgname=remill
pkgver=4.0.6
pkgrel=2
pkgdesc="Library for lifting of x86, amd64, and aarch64 machine code to LLVM bitcode"
arch=('x86_64')
url="https://github.com/lifting-bits/remill"
license=('Apache')
depends=('clang' 'llvm' 'llvm-libs' 'intelxed' 'google-glog' 'gflags' 'lib32-glibc')
makedepends=('git' 'cmake' 'gtest')
provides=('remill')
source=("https://github.com/lifting-bits/remill/archive/v${pkgver}.tar.gz"
        'remove-sysdeps.patch')
sha256sums=('f5ee8cf61a0008e4b3ab4b88af465e11406dbcb8c3acbd5fcf09a49f07ec6d0c'
            '4e17d1298304b16447d4a4736dd2318a39139b95e06bf557a26e1d764ff00329')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    patch -Np1 -i "$srcdir/remove-sysdeps.patch"
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    mkdir -p build && cd build
    cmake \
        -DCMAKE_C_COMPILER=/usr/bin/clang \
        -DCMAKE_CXX_COMPILER=/usr/bin/clang++ \
        -DCMAKE_BC_COMPILER=/usr/bin/clang++ \
        -DCMAKE_BC_LINKER=/usr/bin/llvm-link \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_VERBOSE_MAKEFILE=True \
        "$srcdir/$pkgname-$pkgver"
    make
    #make test_dependencies
}

#check() {
#    cd "$srcdir/$pkgname-$pkgver/build"
#    make test
#}

package() {
    cd "$srcdir/$pkgname-$pkgver/build"
    make DESTDIR="${pkgdir}" install
}

# vim: set sw=4 ts=4 et:
