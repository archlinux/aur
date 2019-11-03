# Maintainer: Daniel Bermond <dbermond@archlinux.org>

_glslang_commit='4b5159ea8170fa34e29f13448fddebf88e0a722a'
_spirv_tools_commit='bbb29870b510f83f99994358179c9ea6838c3100'
_spirv_headers_commit='601d738723ac381741311c6c98c36d6170be14a2'

pkgname=spirv-cross
pkgver=2019.11.01
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
    make -C SPIRV-Cross/build test
}

package() {
    make -C SPIRV-Cross/build DESTDIR="$pkgdir" install
}
