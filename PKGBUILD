# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=lcevcdec-git
pkgver=3.3.3.r0.g0d5a5e0
pkgrel=2
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
        '020-lcevcdec-disable-werror.patch'
        '030-lcevcdec-disable-avx.patch')
sha256sums=('SKIP'
            '8a51231cf8d8c61db90295ed8ea92cc559869df3a9ecfa32ccf9fefcab619d36'
            '8cf68c43fe98e31c3f1a9fc84d6c3745e3bdb24b0fe32e79f78b529210516060'
            '71145584cce87ac54b98a7b2a2904c6c1f213ac3dc6dffe6b6653b599f395d76')

export GIT_LFS_SKIP_SMUDGE='1'

prepare() {
    patch -d LCEVCdec -Np1 -i "${srcdir}/010-lcevcdec-fix-pkgconfig-prefix.patch"
    patch -d LCEVCdec -Np1 -i "${srcdir}/020-lcevcdec-disable-werror.patch"
    patch -d LCEVCdec -Np1 -i "${srcdir}/030-lcevcdec-disable-avx.patch"
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
    ln -s ../../doc/LCEVCdec_SDK/licenses/LCEVCdec/LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
    rm "${pkgdir}/usr/share/doc/LCEVCdec_SDK"/{conanfile.txt,README.md}
    rm -r "${pkgdir}/usr/share/doc/LCEVCdec_SDK/src"
}
