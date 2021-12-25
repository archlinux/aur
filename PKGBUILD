# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=chromaprint-fftw
pkgver=1.5.1
pkgrel=1
pkgdesc='Library for extracting fingerprints from any audio source (uses fftw for FFT calculations instead of ffmpeg)'
arch=('x86_64')
url='https://acoustid.org/chromaprint'
license=('GPL')
depends=('fftw')
makedepends=('cmake' 'gtest')
provides=('chromaprint' 'libchromaprint.so')
conflicts=('chromaprint')
source=("https://github.com/acoustid/chromaprint/archive/v${pkgver}/chromaprint-${pkgver}.tar.gz")
sha256sums=('a1aad8fa3b8b18b78d3755b3767faff9abb67242e01b478ec9a64e190f335e1c')

build() {
    cmake -B build -S "chromaprint-${pkgver}" \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DBUILD_TESTS:BOOL='ON' \
        -DBUILD_TOOLS:BOOL='OFF' \
        -DFFT_LIB:STRING='fftw3' \
        -DGTEST_SOURCE_DIR:PATH='/usr/src/googletest' \
        -Wno-dev
    make -C build
}

check() {
    make -C build check
}

package() {
    make -C build DESTDIR="$pkgdir" install
}
