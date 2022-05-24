# Maintainer: Daniel Bermond <dbermond@archlinux.org>

_tag='sdk-1.3.211.0'
_glslang_commit='df609a01b386001e367709086c58529c48028d1e'
_spirv_tools_commit='75e53b9f685830ac42242cf0c46cc9af523bd0df'
_spirv_headers_commit='b8047fbe45f426f5918fadc67e8408f5b108c3c9'

pkgname=spirv-cross
pkgver=2022.03.24
pkgrel=1
pkgdesc='A tool and library for parsing and converting SPIR-V to other shader languages'
arch=('x86_64')
url='https://github.com/KhronosGroup/SPIRV-Cross/'
license=('Apache')
depends=('gcc-libs')
makedepends=('git' 'cmake' 'python')
source=("git+https://github.com/KhronosGroup/SPIRV-Cross.git#tag=${_tag}"
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

pkgver() {
    git -C SPIRV-Cross log -1 --date='short' --pretty='format:%ci' "$_tag" | awk '{ gsub("-", ".", $1); print $1 }'
}

build() {
    # NOTE: test suite fails when using 'None' build type
    local -a _common_opts=('-DCMAKE_BUILD_TYPE:STRING=Release' '-Wno-dev')
    
    export CFLAGS+=' -ffat-lto-objects'
    export CXXFLAGS+=' -ffat-lto-objects'
    
    # glslang (required for tests)
    cmake -B SPIRV-Cross/external/glslang-build -S glslang \
        "${_common_opts[@]}" \
        -DCMAKE_INSTALL_PREFIX:PATH='output'
    cmake --build SPIRV-Cross/external/glslang-build --target install
    
    # spirv-tools (required for tests)
    cmake -B SPIRV-Cross/external/spirv-tools-build -S SPIRV-Tools \
        "${_common_opts[@]}" \
        -DCMAKE_INSTALL_PREFIX:PATH='output' \
        -DSPIRV_WERROR:BOOL='OFF'
    cmake --build SPIRV-Cross/external/spirv-tools-build --target install
    
    # spirv-cross
    cmake -B build-SPIRV-Cross -S SPIRV-Cross \
        "${_common_opts[@]}" \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DSPIRV_CROSS_FORCE_PIC:BOOL='ON' \
        -DSPIRV_CROSS_SHARED:BOOL='ON'
    make -C build-SPIRV-Cross
}

check() {
    make -C build-SPIRV-Cross test
}

package() {
    make -C build-SPIRV-Cross DESTDIR="$pkgdir" install
}
