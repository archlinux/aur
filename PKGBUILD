# Maintainer: Daniel Bermond <dbermond@archlinux.org>

_pkgname=libklvanc
pkgname=${_pkgname}-llvm
pkgver=1.6.0
pkgrel=1
pkgdesc='Library for parsing/generation of Vertical Ancillary Data (VANC) — built with Clang and LLVM lld'
arch=('x86_64')
url='https://github.com/stoth68000/libklvanc/'
license=('LGPL')
depends=('glibc')
makedepends=('clang' 'lld' 'llvm')
provides=('libklvanc')
conflicts=('libklvanc')
source=("https://github.com/stoth68000/libklvanc/archive/vid.obe.${pkgver}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('5076ca48455a4ef4ead2cd880ba189b21937a9ad8fd458adfc133d7bb1c948c3')

prepare() {
    cd "${_pkgname}-vid.obe.${pkgver}"
    ./autogen.sh --build
}

build() {
    cd "${_pkgname}-vid.obe.${pkgver}"
    export CC=clang
    export CXX=clang++
    export AR=/usr/bin/llvm-ar
    export RANLIB=/usr/bin/llvm-ranlib
    export LD=/usr/bin/ld.lld
    export NM=/usr/bin/llvm-nm
    export OBJCOPY=/usr/bin/llvm-objcopy
    export OBJDUMP=/usr/bin/llvm-objdump
    export READELF=/usr/bin/llvm-readelf
    export STRIP=/usr/bin/llvm-strip
    export LDFLAGS="${LDFLAGS:-} -fuse-ld=lld"
    export CFLAGS="${CFLAGS:-} -O3 -march=native"
    export CXXFLAGS="${CXXFLAGS:-} -O3 -march=native"
    ./configure --prefix='/usr'
    make
}

package() {
    make -C "${_pkgname}-vid.obe.${pkgver}" DESTDIR="$pkgdir" install

    # the -debug package is preventing binary executables from being stripped
    llvm-strip "$STRIP_BINARIES" "${pkgdir}/usr/bin"/*
}
