# Maintainer: Daniel Bermond < gmail-com: danielbermond >

_glslang_commit='e291f7a09f6733f6634fe077a228056fabee881e'
_spirv_tools_commit='89fe836fe22c3e5c2a062ebeade012e2c2f0839b'
_spirv_headers_commit='c4f8f65792d4bf2657ca751904c511bbcf2ac77b'

pkgname=spirv-cross
pkgver=2019.06.21
_srcver="${pkgver//./-}"
pkgrel=1
pkgdesc='A tool and library for parsing and converting SPIR-V to other shader languages'
arch=('x86_64')
url='https://github.com/KhronosGroup/SPIRV-Cross/'
license=('Apache')
depends=('gcc-libs')
makedepends=('git' 'cmake' 'python' 'python-nose')
source=("git+https://github.com/KhronosGroup/SPIRV-Cross.git#tag=${_srcver}"
        "git+https://github.com/KhronosGroup/glslang.git#commit=${_glslang_commit}"
        "git+https://github.com/KhronosGroup/SPIRV-Tools.git#commit=${_spirv_tools_commit}"
        "git+https://github.com/KhronosGroup/SPIRV-Headers.git#commit=${_spirv_headers_commit}"
        'spirv-cross-workaround-gcc9.1-bug.patch'::'https://github.com/KhronosGroup/SPIRV-Cross/commit/7557ff5567d88f97c10c0c097df1d9f993cafa42.patch')
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '7e71831e2c96f9e3967dd9797429a56a6a478de47398794ce54a12b55fb9a7ef')

prepare() {
    cd SPIRV-Cross
    
    # fix tests with gcc 9.1.0
    ## https://github.com/KhronosGroup/SPIRV-Cross/issues/1038
    patch -Np1 -i "${srcdir}/spirv-cross-workaround-gcc9.1-bug.patch"
    
    mkdir -p build external/{glslang,spirv-tools}-build
    
    ln -s "${srcdir}/glslang"       external/glslang
    ln -s "${srcdir}/SPIRV-Tools"   external/spirv-tools
    ln -s "${srcdir}/SPIRV-Headers" "${srcdir}/SPIRV-Tools/external/spirv-headers"
}

build() {
    # NOTE (1): test suite fails when using 'None' build type
    # NOTE (2): test suite fails when using glslang and spirv-tools from the repos
    #           (probably because spirv-tools is outdated at the time of writing)
    
    # glslang (required for tests)
    printf '%s\n' '  -> Building glslang...'
    cd "SPIRV-Cross/external/glslang-build"
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
    cd "SPIRV-Cross/build"
    
    make test
}

package() {
    cd SPIRV-Cross/build
    
    make DESTDIR="$pkgdir" install
}
