# Maintainer: Jacob Ledbetter <jledbetter460@gmail.com>
# Contributor: Daniel Bermond <dbermond@archlinux.org>

pkgname=chromaprint-fftw-llvm
pkgver=1.6.0
pkgrel=1
pkgdesc='Library for extracting fingerprints from any audio source (uses fftw for FFT calculations instead of ffmpeg) — built with Clang and LLVM lld'
arch=('x86_64')
url='https://acoustid.org/chromaprint'
license=('GPL-2.0-or-later')
depends=(
    'gcc-libs'
    'glibc'
    'fftw')
makedepends=(
    'clang'
    'lld'
    'llvm'
    'cmake')
provides=('chromaprint-fftw' 'chromaprint' 'libchromaprint.so')
conflicts=('chromaprint-fftw' 'chromaprint')
source=("https://github.com/acoustid/chromaprint/archive/v${pkgver}/chromaprint-${pkgver}.tar.gz")
sha256sums=('65bfce4a35b2e673dbcda917b6aa577e2f145cf805243d19e6a50fea2a520c2a')

build() {
    export CC=clang
    export CXX=clang++
    export AR=/usr/bin/llvm-ar
    export RANLIB=/usr/bin/llvm-ranlib
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
        -Wno-dev
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
