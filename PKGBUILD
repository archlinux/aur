# Maintainer: Daniel Bermond <dbermond@archlinux.org>

_glslang_commit='3de5cfe50edecd001e6d703555284d9b10b3dd57'
_spirv_tools_commit='f3ccb633dfd7c5de1f9f0a2d2e9d7a25f2478206'
_spirv_headers_commit='f027d53ded7e230e008d37c8b47ede7cd308e19d'

pkgname=spirv-cross
pkgver=2021.01.15
pkgrel=1
pkgdesc='A tool and library for parsing and converting SPIR-V to other shader languages'
arch=('x86_64')
url='https://github.com/KhronosGroup/SPIRV-Cross/'
license=('Apache')
depends=('gcc-libs')
makedepends=('git' 'cmake' 'python' 'python-nose')
source=("git+https://github.com/KhronosGroup/SPIRV-Cross.git#tag=${pkgver//./-}"
        "git+https://github.com/KhronosGroup/glslang.git#commit=${_glslang_commit}"
        "git+https://github.com/KhronosGroup/SPIRV-Tools.git#commit=${_spirv_tools_commit}"
        "git+https://github.com/KhronosGroup/SPIRV-Headers.git#commit=${_spirv_headers_commit}")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

prepare() {
    mkdir -p SPIRV-Cross/external/{glslang,spirv-tools}
    
    ln -sf "${srcdir}/glslang"       SPIRV-Cross/external/glslang
    ln -sf "${srcdir}/SPIRV-Tools"   SPIRV-Cross/external/spirv-tools
    ln -sf "${srcdir}/SPIRV-Headers" SPIRV-Tools/external/spirv-headers
}

build() {
    # NOTE: test suite fails when using 'None' build type
    
    # glslang (required for tests)
    printf '%s\n' '  -> Building glslang...'
    cmake -B SPIRV-Cross/external/glslang-build -S glslang \
        -DCMAKE_BUILD_TYPE:STRING='Release' \
        -DCMAKE_INSTALL_PREFIX:PATH='output' \
        -Wno-dev
    cmake --build SPIRV-Cross/external/glslang-build --config Release --target install
    
    # spirv-tools (required for tests)
    printf '%s\n' '  -> Building SPIRV-Tools...'
    cmake -B SPIRV-Cross/external/spirv-tools-build -S SPIRV-Tools \
        -DCMAKE_BUILD_TYPE:STRING='Release' \
        -DSPIRV_WERROR:BOOL='OFF' \
        -DCMAKE_INSTALL_PREFIX:PATH='output' \
        -Wno-dev
    cmake --build SPIRV-Cross/external/spirv-tools-build --config Release --target install
    
    # spirv-cross
    printf '%s\n' '  -> Building SPIRV-Cross...'
    cmake -B build-SPIRV-Cross -S SPIRV-Cross \
        -DCMAKE_BUILD_TYPE:STRING='Release' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DSPIRV_CROSS_SHARED:BOOL='ON' \
        -Wno-dev
    make -C build-SPIRV-Cross
}

check() {
    make -C build-SPIRV-Cross test
}

package() {
    make -C build-SPIRV-Cross DESTDIR="$pkgdir" install
}
