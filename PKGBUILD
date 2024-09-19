# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=lcevcdec-git
pkgver=3.2.1.r12.g364ae4f
pkgrel=1
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
        '010-lcevcdec-fix-pkgconfig-prefix.patch')
sha256sums=('SKIP'
            '8a51231cf8d8c61db90295ed8ea92cc559869df3a9ecfa32ccf9fefcab619d36')

prepare() {
    patch -d LCEVCdec -Np1 -i "${srcdir}/010-lcevcdec-fix-pkgconfig-prefix.patch"
}

pkgver() {
    git -C LCEVCdec describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    cmake -B build -S LCEVCdec \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
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
