# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=chromaprint-fftw
pkgver=1.5.1
pkgrel=5
_gtest_ver=1.16.0
pkgdesc='Library for extracting fingerprints from any audio source (uses fftw for FFT calculations instead of ffmpeg)'
arch=('x86_64')
url='https://acoustid.org/chromaprint'
license=('GPL-2.0-or-later')
depends=('gcc-libs' 'glibc' 'fftw')
makedepends=('cmake')
provides=('chromaprint' 'libchromaprint.so')
conflicts=('chromaprint')
source=("https://github.com/acoustid/chromaprint/archive/v${pkgver}/chromaprint-${pkgver}.tar.gz" 
        "https://github.com/google/googletest/archive/v${_gtest_ver}/gtest-${_gtest_ver}.tar.gz"
        '010-chromaprint-gtest-1.13.0-fix.patch')
sha256sums=('a1aad8fa3b8b18b78d3755b3767faff9abb67242e01b478ec9a64e190f335e1c'
            '78c676fc63881529bf97bf9d45948d905a66833fbfa5318ea2cd7478cb98f399'
            '46e389235dd08c727d6cc1ae079a77d06fde337f4a06d0c0fe908d2025280f63')

prepare() {
    patch -d "chromaprint-${pkgver}" -Np1 -i "${srcdir}/010-chromaprint-gtest-1.13.0-fix.patch"
}

build() {
    cmake -B build -S "chromaprint-${pkgver}" \
        -G 'Unix Makefiles' \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DCMAKE_POLICY_VERSION_MINIMUM:STRING="3.5.0" \
        -DBUILD_TESTS:BOOL='ON' \
        -DBUILD_TOOLS:BOOL='OFF' \
        -DFFT_LIB:STRING='fftw3' \
        -DGTEST_SOURCE_DIR:PATH="${srcdir}/googletest-${_gtest_ver}/googletest" \
        -Wno-dev
    cmake --build build
}

check() {
    make -C build check
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
