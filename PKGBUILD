# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=lcevcdec
pkgver=4.0.4
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
source=("git+https://github.com/v-novaltd/LCEVCdec.git#tag=${pkgver}")
sha256sums=('adfd79d091bc44af3b3619555511519385e7c6f46fc99d46795444be0bd8a03e')

export GIT_LFS_SKIP_SMUDGE='1'

build() {
    export CFLAGS+=' -DNDEBUG -ffat-lto-objects'
    export CXXFLAGS+=' -DNDEBUG -ffat-lto-objects'
    cmake -B build -S LCEVCdec \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DVN_SDK_EXECUTABLES:BOOL='OFF' \
        -DVN_SDK_SIMD:BOOL='OFF' \
        -DVN_SDK_UNIT_TESTS:BOOL='OFF' \
        -Wno-dev
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -d -m755 "${pkgdir}/usr/share/licenses/${pkgname}"
    mv "${pkgdir}/usr/share/doc/LCEVCdec_SDK/licenses"/{COPYING,LICENSE.md} "${pkgdir}/usr/share/licenses/${pkgname}"
}
