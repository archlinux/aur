# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=intel-graphics-compiler-legacy
pkgver=1.0.17537.24
_llvmmaj=14
_llvmver="${_llvmmaj}.0.5"
_vciver=0.19.0
_spirv_tools_ver=2023.6.rc1
_spirv_headers_commit=1c6bb2743599e6eb6f37b2969acc0aef812e32e3
_spirv_llvm_commit=065a94408d01bacf2ee86443f56cfaa64fda1534
_opencl_clang_commit=470cf0018e1ef6fc92eda1356f5f31f7da452abc
pkgrel=1
pkgdesc='Intel Graphics Compiler for OpenCL (legacy platforms)'
arch=('x86_64')
url='https://github.com/intel/intel-graphics-compiler/'
license=('MIT' 'Apache-2.0 WITH LLVM-exception')
depends=(
    'gcc-libs'
    'glibc'
    'zlib')
makedepends=(
    'cmake'
    'git'
    'python'
    'python-mako'
    'python-yaml')
provides=("intel-graphics-compiler=${pkgver}" "intel-opencl-clang=${_llvmmaj}")
conflicts=('intel-graphics-compiler' 'intel-opencl-clang')
replaces=('intel-opencl-clang')
options=('!emptydirs' '!lto')
source=("https://github.com/intel/intel-graphics-compiler/archive/igc-${pkgver}/${pkgname}-${pkgver}.tar.gz"
        "git+https://github.com/intel/vc-intrinsics.git#tag=v${_vciver}"
        "git+https://github.com/KhronosGroup/SPIRV-LLVM-Translator.git#commit=${_spirv_llvm_commit}"
        "git+https://github.com/KhronosGroup/SPIRV-Tools.git#tag=v${_spirv_tools_ver}"
        "git+https://github.com/KhronosGroup/SPIRV-Headers.git#commit=${_spirv_headers_commit}"
        "git+https://github.com/intel/opencl-clang.git#commit=${_opencl_clang_commit}"
        "git+https://github.com/llvm/llvm-project.git#tag=llvmorg-${_llvmver}"
        '010-intel-graphics-compiler-disable-werror.patch')
sha256sums=('b6e4c71d8b9c56337d67066f19162a55fd61d823e217364e929b0220954819ce'
            'da3aca24eb2d3f15240fb8dbdc90c2e27f8a921a56ca33ab2c964e77555c754a'
            '35357c8a651cf421656328e17a005bed088091eb46a5402f7dd06e64361312aa'
            'ad11e234110902f42c9e54d2f4bb014b64e280ac9428f4c03a04b8b4571112b8'
            '86b7a82e8169097bb84741dff6003da85c841f9d3514034b213896c498ae294c'
            '19214ef9956892960ebd10c91f13cde103ccd270aa4681bdeeb048eb500cd165'
            'f04acc3523802bc24fef7753c8e4326502b8525cb516705f362972ef5698d6c3'
            '08080d31d458200244864d2288f548af409697c1ac8b577f47faeb73c2100fb4')

prepare() {
    # rename to prevent SPIRV-LLVM-Translator from being included
    # twice by the build process, which causes the build to fail
    mv SPIRV-LLVM-Translator{,-IGC-LLVM}
    
    ln -s "${srcdir}/SPIRV-LLVM-Translator-IGC-LLVM"  "${srcdir}/llvm-project/llvm/projects/llvm-spirv"
    ln -s "${srcdir}/opencl-clang" "${srcdir}/llvm-project/llvm/projects/opencl-clang"
    
    # llvm: fix build with gcc 15
    # https://github.com/llvm/llvm-project/commit/7e44305041d96b064c197216b931ae3917a34ac1
    EMAIL='builduser@archlinux.org' \
    git -C llvm-project cherry-pick 7e44305041d96b064c197216b931ae3917a34ac1
    
    patch -d "intel-graphics-compiler-igc-${pkgver}" -Np1 -i "${srcdir}/010-intel-graphics-compiler-disable-werror.patch"
}

build() {
    # prevent IGC to load LLVM 15+ symbols
    CFLAGS+=' -fno-semantic-interposition'
    CXXFLAGS+=' -fno-semantic-interposition'
    LDFLAGS+=' -Wl,-Bsymbolic'
    
    # fix error: "_FORTIFY_SOURCE" redefined [-Werror]
    # note: upstream forces _FORTIFY_SOURCE=2
    export CFLAGS="${CFLAGS/-Wp,-D_FORTIFY_SOURCE=?/}"
    export CXXFLAGS="${CXXFLAGS/-Wp,-D_FORTIFY_SOURCE=?/}"
    
    CXXFLAGS+=" -isystem${srcdir}/SPIRV-LLVM-Translator/include"
    
    EMAIL='builduser@archlinux.org' \
    cmake -B build -S "intel-graphics-compiler-igc-${pkgver}" \
        -G 'Unix Makefiles' \
        -DCCLANG_FROM_SYSTEM:BOOL='OFF' \
        -DCMAKE_BUILD_TYPE:STRING='Release' \
        -DCMAKE_INSTALL_LIBDIR:PATH='lib' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DCMAKE_POLICY_VERSION_MINIMUM:STRING='3.5.0' \
        -DIGC_OPTION__ARCHITECTURE_TARGET:STRING='Linux64' \
        -DIGC_OPTION__CLANG_MODE:STRING='Source' \
        -DIGC_OPTION__LINK_KHRONOS_SPIRV_TRANSLATOR:BOOL='ON' \
        -DIGC_OPTION__LLD_MODE:STRING='Source' \
        -DIGC_OPTION__LLVM_MODE:STRING='Source' \
        -DIGC_OPTION__LLVM_PREFERRED_VERSION:STRING="${_llvmver}" \
        -DIGC_OPTION__SPIRV_TOOLS_MODE:STRING='Source' \
        -DIGC_OPTION__USE_KHRONOS_SPIRV_TRANSLATOR_IN_SC:BOOL='ON' \
        -DIGC_OPTION__USE_PREINSTALLED_SPIRV_HEADERS:BOOL='OFF' \
        -DIGC_OPTION__VC_INTRINSICS_MODE:STRING='Source' \
        -DINSTALL_GENX_IR:BOOL='ON' \
        -Wno-dev
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -D -m644 "intel-graphics-compiler-igc-${pkgver}"/LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
    mv "${pkgdir}/usr/include"/opencl-c{,-base}.h "${pkgdir}/usr/include/igc"
    mv "${pkgdir}/usr/lib/igc/NOTICES.txt" "${pkgdir}/usr/share/licenses/${pkgname}"
    rm "${pkgdir}/usr/bin/lld"
    
    # additional files for opencl-clang
    install -D -m644 opencl-clang/common_clang.h -t "${pkgdir}/usr/include/cclang"
    install -D -m644 opencl-clang/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-opencl-clang"
    ln -s "libopencl-clang.so.${_llvmmaj}" "${pkgdir}/usr/lib/libopencl-clang.so"
}
