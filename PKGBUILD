# Maintainer: Daniel Bermond <dbermond@archlinux.org>

_glslang_commit='c008fcb8cc0f6a413162fb5236d0c548cc1e0ef6'
_spirv_tools_commit='79f8caf9154a0328a87424354bd10ab69e811185'
_spirv_headers_commit='5dbc1c32182e17b8ab8e8158a802ecabaf35aad3'

pkgname=spirv-cross
pkgver=2020.02.26
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
    
    export CFLAGS+=" ${CPPFLAGS}"
    export CXXFLAGS+=" ${CPPFLAGS}"
    
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
