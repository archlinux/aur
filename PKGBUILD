# Maintainer: Joost Molenaar <jjm@j0057.nl>
pkgname=redumper
epoch=
pkgver=388
pkgrel=1
pkgdesc='Low level CD dumper utility'
arch=(x86_64)
url='https://github.com/superg/redumper'
license=('GPL-3.0-only')
depends=(
    gcc-libs
    glibc
    libc++
    libc++abi
)
makedepends=(
    base-devel
    cmake
    ninja
    llvm
    clang
    lld
)
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/superg/redumper/archive/refs/tags/build_$pkgver.tar.gz"
)

build() {
    unset CFLAGS CXXFLAGS LDFLAGS CC CXX
    CC=clang CXX=clang++ LDFLAGS=-fuse-ld=lld cmake \
        -G Ninja \
        -S $pkgname-build_$pkgver \
        -B $pkgname-dist \
        -DCMAKE_BUILD_WITH_INSTALL_RPATH=ON \
        -DCMAKE_BUILD_TYPE=None \
        -DREDUMPER_CLANG_LINK_OPTIONS=-lc++ \
        ;
    ninja -C $pkgname-dist -v
}

package() {
    install -o root -g root -m 755 -d $pkgdir/usr/bin
    install -o root -g root -m 755 -t $pkgdir/usr/bin $pkgname-dist/redumper

    install -o root -g root -m 755 -d $pkgdir/usr/share/doc/redumper
    install -o root -g root -m 644 -t $pkgdir/usr/share/doc/redumper $pkgname-build_$pkgver/README.md

    install -o root -g root -m 755 -d $pkgdir/usr/share/licenses
    install -o root -g root -m 644 -t $pkgdir/usr/share/licenses $pkgname-build_$pkgver/LICENSE
}

sha256sums=('dc12d50d44b8ff6df9bc798f889287961717815d6cb80cbcbe3b72ffe30e7d0a')
