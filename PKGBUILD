# Maintainer: Jacob Ledbetter <jledbetter460@gmail.com>
# Contributor: Daniel Bermond <dbermond@archlinux.org>

pkgname=chromaprint-fftw-llvm
pkgver=1.6.1
pkgrel=2
pkgdesc='Library for extracting fingerprints from any audio source (uses fftw for FFT calculations instead of ffmpeg) — built with Clang and LLVM lld'
arch=('x86_64')
url='https://acoustid.org/chromaprint'
license=('GPL-2.0-or-later')
depends=(
    'fftw'
    'glibc'
    'libgcc'
    'libstdc++')
makedepends=(
    'clang'
    'cmake'
    'lld'
    'llvm')
provides=('chromaprint-fftw' 'chromaprint' 'libchromaprint.so')
conflicts=('chromaprint-fftw' 'chromaprint')
source=("https://github.com/acoustid/chromaprint/archive/v${pkgver}/chromaprint-${pkgver}.tar.gz")
sha256sums=('7065ec9db48ac1fa929ec6c42afcd966605b1bfe48b6d5e64c25378a05f4fb02')

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
    
    cmake -B build -S "chromaprint-${pkgver}" \
        -G 'Unix Makefiles' \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DCMAKE_EXE_LINKER_FLAGS:STRING='-fuse-ld=lld' \
        -DCMAKE_SHARED_LINKER_FLAGS:STRING='-fuse-ld=lld' \
        -DBUILD_TESTS:BOOL='ON' \
        -DBUILD_TOOLS:BOOL='OFF' \
        -DFFT_LIB:STRING='fftw3' \
        -Wno-author
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
