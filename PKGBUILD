# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=lcevcdec-git
pkgver=4.0.0.r0.g49183ed
pkgrel=2
pkgdesc='Low Complexity Enhancement Video Codec Decoder (LCEVC_DEC) (git version)'
arch=('x86_64')
url='https://github.com/v-novaltd/LCEVCdec/'
license=('BSD-3-Clause-Clear')
depends=(
    'gcc-libs'
    'glibc')
makedepends=(
    'cmake'
    'git'
    'python'
    'range-v3'
    'rapidjson')
provides=('lcevcdec')
conflicts=('lcevcdec')
options=('!emptydirs')
source=('git+https://github.com/v-novaltd/LCEVCdec.git')
sha256sums=('SKIP')

export GIT_LFS_SKIP_SMUDGE='1'

pkgver() {
    git -C LCEVCdec describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    export CFLAGS+=' -DNDEBUG -ffat-lto-objects'
    export CXXFLAGS+=' -DNDEBUG -ffat-lto-objects'
    cmake -B build -S LCEVCdec \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DVN_SDK_AVX2:BOOL='OFF' \
        -DVN_SDK_EXECUTABLES:BOOL='OFF' \
        -DVN_SDK_SAMPLE_SOURCE:BOOL='OFF' \
        -DVN_SDK_SIMD:BOOL='ON' \
        -DVN_SDK_SSE:BOOL='ON' \
        -DVN_SDK_UNIT_TESTS:BOOL='OFF' \
        -Wno-dev
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -d -m755 "${pkgdir}/usr/share/licenses/${pkgname}"
    mv "${pkgdir}/usr/share/doc/LCEVCdec_SDK/licenses"/{COPYING,LICENSE.md} "${pkgdir}/usr/share/licenses/${pkgname}"
    rm "${pkgdir}/usr/share/doc/LCEVCdec_SDK/README.md"
}
