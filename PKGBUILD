# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=lcevcdec
pkgver=3.3.6
pkgrel=1
pkgdesc='Low Complexity Enhancement Video Codec Decoder (LCEVC_DEC)'
arch=('x86_64')
url='https://github.com/v-novaltd/LCEVCdec/'
license=('BSD-3-Clause-Clear')
depends=('gcc-libs' 'glibc')
makedepends=('cmake' 'git' 'python' 'range-v3' 'rapidjson')
source=("git+https://github.com/v-novaltd/LCEVCdec.git#tag=${pkgver}"
        '010-lcevcdec-fix-pkgconfig-prefix.patch'
        '020-lcevcdec-disable-avx.patch'
        '030-lcevcdec-fix-install-paths.patch')
sha256sums=('485724245282b7815f7ee5d11f234dd3ccdcf725964759b502551d35b59402a9'
            '8a51231cf8d8c61db90295ed8ea92cc559869df3a9ecfa32ccf9fefcab619d36'
            '71145584cce87ac54b98a7b2a2904c6c1f213ac3dc6dffe6b6653b599f395d76'
            '3a52ce1cf4e1dca8f5e653ec82c17891fe17b1f6250d9271f2139f1fd4f9d295')

export GIT_LFS_SKIP_SMUDGE='1'

prepare() {
    patch -d LCEVCdec -Np1 -i "${srcdir}/010-lcevcdec-fix-pkgconfig-prefix.patch"
    patch -d LCEVCdec -Np1 -i "${srcdir}/020-lcevcdec-disable-avx.patch"
    patch -d LCEVCdec -Np1 -i "${srcdir}/030-lcevcdec-fix-install-paths.patch"
}

build() {
    export CFLAGS+=' -DNDEBUG -ffat-lto-objects'
    export CXXFLAGS+=' -DNDEBUG -ffat-lto-objects'
    cmake -B build -S LCEVCdec \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DVN_CORE_AVX2:BOOL='OFF' \
        -DVN_CORE_SSE:BOOL='OFF' \
        -DVN_SDK_EXECUTABLES:BOOL='OFF' \
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
    install -d -m755 "${pkgdir}/usr/share/licenses/${pkgname}"
    ln -s ../../doc/LCEVCdec_SDK/licenses/lcevcdec/LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
    rm "${pkgdir}/usr/share/doc/LCEVCdec_SDK/README.md"
    rm -r "${pkgdir}/usr/share/doc/LCEVCdec_SDK/src"
}
