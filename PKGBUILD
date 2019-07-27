# Maintainer: Daniel Bermond < gmail-com: danielbermond >

_glslang_commit='25a508cc735109cc4e382c3a1cc293a9452a41f3'
_spirv_tools_commit='55adf4cf707bb12c29fc12f784ebeaa29a819e9b'
_spirv_headers_commit='29c11140baaf9f7fdaa39a583672c556bf1795a1'

pkgname=spirv-cross
pkgver=2019.07.26
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
    cd SPIRV-Cross
    
    mkdir -p build external/{glslang,spirv-tools}-build
    
    ln -sf "${srcdir}/glslang"       external/glslang
    ln -sf "${srcdir}/SPIRV-Tools"   external/spirv-tools
    ln -sf "${srcdir}/SPIRV-Headers" "${srcdir}/SPIRV-Tools/external/spirv-headers"
}

build() {
    # NOTE: test suite fails when using 'None' build type
    
    # glslang (required for tests)
    printf '%s\n' '  -> Building glslang...'
    cd SPIRV-Cross/external/glslang-build
    cmake \
        -DCMAKE_BUILD_TYPE:STRING='Release' \
        -DCMAKE_INSTALL_PREFIX:PATH='output' \
        -Wno-dev \
        ../glslang
    cmake --build . --config Release --target install
    
    # spirv-tools (required for tests)
    printf '%s\n' '  -> Building SPIRV-Tools...'
    cd "${srcdir}/SPIRV-Cross/external/spirv-tools-build"
    cmake \
        -DCMAKE_BUILD_TYPE:STRING='Release' \
        -DSPIRV_WERROR:BOOL='OFF' \
        -DCMAKE_INSTALL_PREFIX:PATH='output' \
        -Wno-dev \
        ../spirv-tools
    cmake --build . --config Release --target install
    
    # spirv-cross
    printf '%s\n' '  -> Building SPIRV-Cross...'
    cd "${srcdir}/SPIRV-Cross/build"
    cmake \
        -DCMAKE_BUILD_TYPE:STRING='Release' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DSPIRV_CROSS_SHARED:BOOL='ON' \
        -Wno-dev \
        ..
        
    make
}

check() {
    cd SPIRV-Cross/build
    
    make test
}

package() {
    cd SPIRV-Cross/build
    
    make DESTDIR="$pkgdir" install
}
