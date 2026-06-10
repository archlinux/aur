# Maintainer: Joost Molenaar <jjm@j0057.nl>

pkgname=redumper
epoch=
pkgver=724
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
    "$pkgname-$pkgver.tar.gz::https://github.com/superg/redumper/archive/refs/tags/b$pkgver.tar.gz"
)

build() {
    unset CFLAGS CXXFLAGS LDFLAGS CC CXX
    CC=clang CXX=clang++ LDFLAGS=-fuse-ld=lld cmake \
        -G Ninja \
        -S $pkgname-b$pkgver \
        -B $pkgname-dist \
        -DCMAKE_BUILD_WITH_INSTALL_RPATH=ON \
        -DCMAKE_BUILD_TYPE=None \
        -DREDUMPER_VERSION_BUILD=$pkgver \
        -DREDUMPER_CLANG_LINK_OPTIONS=-lc++ \
        ;
    ninja -C $pkgname-dist -v
}

package() {
    install -o root -g root -m 755 -d $pkgdir/usr/bin
    install -o root -g root -m 755 -t $pkgdir/usr/bin $pkgname-dist/redumper

    install -o root -g root -m 755 -d $pkgdir/usr/share/doc/redumper
    install -o root -g root -m 644 -t $pkgdir/usr/share/doc/redumper $pkgname-b$pkgver/README.md

    install -o root -g root -m 755 -d $pkgdir/usr/share/licenses/redumper
    install -o root -g root -m 644 -t $pkgdir/usr/share/licenses/redumper $pkgname-b$pkgver/LICENSE
}

sha256sums=('48ad7447a71f2572f0312c3a5540c814d863db7fb8377776fc4f418054957eb7')
