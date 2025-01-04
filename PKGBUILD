# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=lcevcdec-git
pkgver=3.2.1.r12.g364ae4f
pkgrel=4
pkgdesc='Low Complexity Enhancement Video Codec Decoder (LCEVC_DEC) (git version)'
arch=('x86_64')
url='https://github.com/v-novaltd/LCEVCdec/'
license=('BSD-3-Clause-Clear')
depends=('fmt')
makedepends=('git' 'cmake' 'python' 'range-v3' 'rapidjson')
provides=('lcevcdec')
conflicts=('lcevcdec')
options=('!emptydirs')
source=('git+https://github.com/v-novaltd/LCEVCdec.git'
        '010-lcevcdec-fix-pkgconfig-prefix.patch'
        '020-lcevcdec-disable-avx.patch'
        '030-lcevcdec-disable-werror.patch')
sha256sums=('SKIP'
            '8a51231cf8d8c61db90295ed8ea92cc559869df3a9ecfa32ccf9fefcab619d36'
            '04e309de2925c2e9a0a57fe138f7b6a1fcfd0a863c350b0391553302681ea681'
            'd1204a15a9a4faef3fdc41ec0a73296b0504e285b6b335a71ad22186719e49f2')

prepare() {
    patch -d LCEVCdec -Np1 -i "${srcdir}/010-lcevcdec-fix-pkgconfig-prefix.patch"
    patch -d LCEVCdec -Np1 -i "${srcdir}/020-lcevcdec-disable-avx.patch"
    patch -d LCEVCdec -Np1 -i "${srcdir}/030-lcevcdec-disable-werror.patch"
}

pkgver() {
    git -C LCEVCdec describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    export CFLAGS+=' -DNDEBUG -ffat-lto-objects'
    export CXXFLAGS+=' -DNDEBUG -ffat-lto-objects'
    cmake -B build -S LCEVCdec \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DVN_CORE_AVX2:BOOL='OFF' \
        -DVN_CORE_SSE:BOOL='OFF' \
        -DVN_SDK_FFMPEG_LIBS_PACKAGE:STRING='' \
        -DVN_SDK_SAMPLE_SOURCE:BOOL='OFF' \
        -DVN_SDK_UNIT_TESTS:BOOL='OFF' \
        -Wno-dev
    cmake --build build
}

check() {
    ctest --test-dir build --output-on-failure
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -D -m644 LCEVCdec/LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
    rm -r "${pkgdir}/usr/share/doc/LCEVCdec_SDK"
}
