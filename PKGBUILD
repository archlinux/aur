# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=lcevcdec
pkgver=4.0.0
pkgrel=1
pkgdesc='Low Complexity Enhancement Video Codec Decoder (LCEVC_DEC)'
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
options=('!emptydirs')
source=("git+https://github.com/v-novaltd/LCEVCdec.git#tag=${pkgver}"
        '010-lcevcdec-disable-avx.patch')
sha256sums=('0113f50cdde2e07bbad9bf643a0921865b2fc04ee2e23964f74e713e027dd4e4'
            '71145584cce87ac54b98a7b2a2904c6c1f213ac3dc6dffe6b6653b599f395d76')

export GIT_LFS_SKIP_SMUDGE='1'

prepare() {
    patch -d LCEVCdec -Np1 -i "${srcdir}/010-lcevcdec-disable-avx.patch"
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
        -DVN_SDK_SSE:BOOL='OFF' \
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
