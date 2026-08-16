# Maintainer: Daniel Bermond <dbermond@archlinux.org>

_pkgname=uavs3d
pkgname=uavs3d-llvm
pkgver=1.2
pkgrel=2
pkgdesc='An AVS3 decoder supporting AVS3-P2 baseline profile — built with Clang and LLVM lld'
arch=('x86_64')
url='https://github.com/uavs3/uavs3d/'
license=('BSD-3-Clause')
depends=(
    'glibc')
makedepends=(
    'clang'
    'cmake'
    'git'
    'lld'
    'llvm')
provides=('uavs3d')
conflicts=('uavs3d')
source=("git+https://github.com/uavs3/uavs3d.git#tag=${pkgver}"
        '010-uavs3d-10bit.patch')
sha256sums=('4253642b4c57ceac93293840a09dbbf02c2e54996e2c40238aa8a727f48784ba'
            '8caaf7b1ba304fdd01af5e456b7837c58963469efda8b10d7acbf54b598f5aea')

prepare() {
    cp -af uavs3d{,-10bit}
    patch -d uavs3d-10bit -Np1 -i "${srcdir}/010-uavs3d-10bit.patch"
}

build() {
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
    export CFLAGS="${CFLAGS:-} -O3 -march=native"
    export CXXFLAGS="${CXXFLAGS:-} -O3 -march=native"
    export LDFLAGS="${LDFLAGS:-} -fuse-ld=lld"
    export CFLAGS+=" -ffile-prefix-map=${srcdir}=. -fdebug-prefix-map=${srcdir}=."
    export CXXFLAGS+=" -ffile-prefix-map=${srcdir}=. -fdebug-prefix-map=${srcdir}=."

    local -a _cmake_opts=(
        '-GUnix Makefiles'
        '-DCMAKE_BUILD_TYPE:STRING=None'
        '-DCMAKE_INSTALL_PREFIX:PATH=/usr'
        '-DCMAKE_EXE_LINKER_FLAGS:STRING=-fuse-ld=lld'
        '-DCMAKE_SHARED_LINKER_FLAGS:STRING=-fuse-ld=lld'
        '-DCMAKE_POLICY_VERSION_MINIMUM:STRING=3.5.0'
        '-DCMAKE_SKIP_RPATH:BOOL=YES'
        '-DBUILD_SHARED_LIBS:BOOL=ON'
        '-Wno-author')

    cmake -B build -S uavs3d "${_cmake_opts[@]}"
    cmake --build build

    cmake -B build-10bit -S uavs3d-10bit "${_cmake_opts[@]}"
    cmake --build build-10bit
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    DESTDIR="$pkgdir" cmake --install build-10bit
    install -D -m755 build/uavs3dec -t "${pkgdir}/usr/bin"
    install -D -m755 build-10bit/uavs3dec "${pkgdir}/usr/bin/uavs3dec-10bit"
    install -D -m644 uavs3d/COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
