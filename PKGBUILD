# Maintainer: Jacob Ledbetter <jledbetter460@gmail.com>
# Contributor: Daniel Bermond <dbermond@archlinux.org>

pkgname=uavs3d-llvm-git
pkgver=1.1.r50.g0e20d2c
pkgrel=1
pkgdesc='An AVS3 decoder supporting AVS3-P2 baseline profile (git version) — built with Clang and LLVM lld'
arch=('x86_64')
url='https://github.com/uavs3/uavs3d/'
license=('BSD-3-Clause')
depends=('glibc')
makedepends=('clang' 'cmake' 'git' 'lld' 'llvm')
provides=('uavs3d-git' 'uavs3d')
conflicts=('uavs3d-git' 'uavs3d')
source=('git+https://github.com/uavs3/uavs3d.git'
        '010-uavs3d-10bit.patch')
sha256sums=('SKIP'
            '4440d93d1cf3d3cec1130e030a06d6e61ff874ee93fd01a5cb272da73b9c3fa6')

prepare() {
    [ -d uavs3d-10bit ] && rm -r uavs3d-10bit
    cp -a uavs3d uavs3d-10bit
    
    patch -d uavs3d-10bit -Np1 -i "${srcdir}/010-uavs3d-10bit.patch"
}

pkgver() {
    git -C uavs3d describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
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
    
    local -a _cmake_opts=(
        '-GUnix Makefiles'
        '-DCMAKE_BUILD_TYPE:STRING=None'
        '-DCMAKE_INSTALL_PREFIX:PATH=/usr'
        '-DCMAKE_EXE_LINKER_FLAGS:STRING=-fuse-ld=lld'
        '-DCMAKE_SHARED_LINKER_FLAGS:STRING=-fuse-ld=lld'
        '-DCMAKE_POLICY_VERSION_MINIMUM:STRING=3.5.0'
        '-DCMAKE_SKIP_RPATH:BOOL=YES'
        '-DBUILD_SHARED_LIBS:BOOL=ON'
        '-Wno-dev')
    
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
