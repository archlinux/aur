# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=chromaprint-fftw
pkgver=1.5.0
pkgrel=3
pkgdesc='Library for extracting fingerprints from any audio source (uses fftw for FFT calculations instead of ffmpeg)'
arch=('x86_64')
url='https://acoustid.org/chromaprint'
license=('GPL')
depends=('fftw')
makedepends=('cmake' 'gtest')
provides=('chromaprint' 'libchromaprint.so')
conflicts=('chromaprint')
source=("https://github.com/acoustid/chromaprint/archive/v${pkgver}/chromaprint-${pkgver}.tar.gz")
sha256sums=('5c8e0d579cb3478900699110aa961c1552a422a18741cf67dd62136b1b877c7b')

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
