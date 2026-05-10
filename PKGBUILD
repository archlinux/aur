# Maintainer: Jacob Ledbetter <jledbetter460@gmail.com>
# Contributor: Daniel Bermond <dbermond@archlinux.org>

pkgname=lcevcdec-llvm
pkgver=4.1.0
pkgrel=1
pkgdesc='Low Complexity Enhancement Video Codec Decoder (LCEVC_DEC) — built with Clang and LLVM lld'
arch=('x86_64')
url='https://github.com/v-novaltd/LCEVCdec/'
license=('BSD-3-Clause-Clear')
depends=(
    'glibc'
    'libgcc'
    'libstdc++')
makedepends=(
    'clang'
    'cmake'
    'git'
    'lld'
    'llvm'
    'python'
    'range-v3'
    'rapidjson')
provides=('lcevcdec')
conflicts=('lcevcdec')
options=('!emptydirs')
source=("git+https://github.com/v-novaltd/LCEVCdec.git#tag=${pkgver}")
sha256sums=('125766f07cbef281b8638efe35f8d439e3ce25f96ed6fd611f9849189b9da868')

export GIT_LFS_SKIP_SMUDGE='1'

build() {
    export CC=clang
    export CXX=clang++
    export AR=/usr/bin/llvm-ar
    export RANLIB=/usr/bin/llvm-ranlib
    export LDFLAGS="${LDFLAGS:-} -fuse-ld=lld"
    export CFLAGS+=' -DNDEBUG -ffat-lto-objects'
    export CXXFLAGS+=' -DNDEBUG -ffat-lto-objects'
    
    cmake -B build -S LCEVCdec \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DCMAKE_EXE_LINKER_FLAGS:STRING='-fuse-ld=lld' \
        -DCMAKE_SHARED_LINKER_FLAGS:STRING='-fuse-ld=lld' \
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
