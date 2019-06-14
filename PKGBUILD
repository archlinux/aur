# Maintainer: Daniel Bermond < gmail-com: danielbermond >

_glslang_commit='e291f7a09f6733f6634fe077a228056fabee881e'
_spirv_tools_commit='89fe836fe22c3e5c2a062ebeade012e2c2f0839b'
_spirv_headers_commit='c4f8f65792d4bf2657ca751904c511bbcf2ac77b'

pkgname=spirv-cross
pkgver=2019.05.20
_srcver="${pkgver//./-}"
pkgrel=1
pkgdesc='A tool and library for parsing and converting SPIR-V to other shader languages'
arch=('x86_64')
url='https://github.com/KhronosGroup/SPIRV-Cross/'
license=('Apache')
depends=('gcc-libs')
makedepends=('git' 'cmake' 'python')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/KhronosGroup/SPIRV-Cross/archive/${_srcver}.tar.gz"
        "git+https://github.com/KhronosGroup/glslang.git#commit=${_glslang_commit}"
        "git+https://github.com/KhronosGroup/SPIRV-Tools.git#commit=${_spirv_tools_commit}"
        "git+https://github.com/KhronosGroup/SPIRV-Headers.git#commit=${_spirv_headers_commit}")
sha256sums=('bc01afeacd77ff786a10755117a7aeb219c8d50e3db3931e59bf8f50f4cad55d'
            'SKIP'
            'SKIP'
            'SKIP')

prepare() {
    cd "SPIRV-Cross-${_srcver}"
    
    mkdir -p build external/{glslang,spirv-tools}-build
    
    ln -s "${srcdir}/glslang"       external/glslang
    ln -s "${srcdir}/SPIRV-Tools"   external/spirv-tools
    ln -s "${srcdir}/SPIRV-Headers" "${srcdir}/SPIRV-Tools/external/spirv-headers"
}

build() {
    # glslang (required for tests)
    printf '%s\n' '  -> Building glslang...'
    cd "SPIRV-Cross-${_srcver}/external/glslang-build"
    cmake \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='output' \
        -Wno-dev \
        ../glslang
    cmake --build . --config None --target install
    
    # spirv-tools (required for tests)
    printf '%s\n' '  -> Building SPIRV-Tools...'
    cd "${srcdir}/SPIRV-Cross-${_srcver}/external/spirv-tools-build"
    cmake \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DSPIRV_WERROR:BOOL='OFF' \
        -DCMAKE_INSTALL_PREFIX:PATH='output' \
        -Wno-dev \
        ../spirv-tools
    cmake --build . --config None --target install
    
    # spirv-cross
    printf '%s\n' '  -> Building SPIRV-Cross...'
    cd "${srcdir}/SPIRV-Cross-${_srcver}/build"
    cmake \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DSPIRV_CROSS_SHARED:BOOL='ON' \
        -Wno-dev \
        ..
    make
}

check() {
    cd "SPIRV-Cross-${_srcver}/build"
    
    make test
}

package() {
    cd "SPIRV-Cross-${_srcver}/build"
    
    make DESTDIR="$pkgdir" install
}
