# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=intel-graphics-compiler-git
pkgver=2.22.0.r100.g29d2efd56
_llvmmaj=16
_llvmver="${_llvmmaj}.0.6"
pkgrel=1
epoch=1
pkgdesc='Intel Graphics Compiler for OpenCL (git version)'
arch=('x86_64')
url='https://github.com/intel/intel-graphics-compiler/'
license=('MIT' 'Apache-2.0 WITH LLVM-exception')
depends=(
    'gcc-libs'
    'glibc'
    'zlib'
    'zstd')
makedepends=(
    'cmake'
    'git'
    'python'
    'python-mako'
    'python-yaml')
provides=('intel-graphics-compiler' "intel-opencl-clang=${_llvmmaj}")
conflicts=('intel-graphics-compiler' 'intel-opencl-clang')
options=('!emptydirs' '!lto')
source=('git+https://github.com/intel/intel-graphics-compiler.git'
        'git+https://github.com/intel/vc-intrinsics.git'
        "git+https://github.com/KhronosGroup/SPIRV-LLVM-Translator.git#branch=llvm_release_${_llvmmaj}0"
        "git+https://github.com/intel/opencl-clang.git#branch=ocl-open-${_llvmmaj}0"
        "git+https://github.com/llvm/llvm-project.git#tag=llvmorg-${_llvmver}"
        'git+https://github.com/KhronosGroup/SPIRV-Tools.git#branch=main'
        'git+https://github.com/KhronosGroup/SPIRV-Headers.git#branch=main'
        '010-intel-graphics-compiler-disable-werror.patch')
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'b47ada280614670a467f80e9f8c67542050983f238f2f4b3fa17682855faf9bf'
            'SKIP'
            'SKIP'
            'fead474a0cde0cd5b66619780dd3f7b902b3d1ab2296ee27ca8f0cadc4eb67f7')

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
    
    patch -d intel-graphics-compiler -Np1 -i "${srcdir}/010-intel-graphics-compiler-disable-werror.patch"
}

pkgver() {
    #git -C intel-graphics-compiler describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^igc\.//'
    
    local _tag
    cd intel-graphics-compiler
    _tag="$(git tag --list --sort='-v:refname' 'v*' | sed -n 's/^v//;1p')"
    
    printf "${_tag}.r%s.g%s"  "$(git rev-list --count "v${_tag}..HEAD")" "$(git rev-parse --short HEAD)"
}

build() {
    # Prevent IGC to load LLVM 15+ symbols
    CFLAGS+=' -fno-semantic-interposition'
    CXXFLAGS+=' -fno-semantic-interposition'
    LDFLAGS+=' -Wl,-Bsymbolic'
    
    # fix error: "_FORTIFY_SOURCE" redefined [-Werror]
    # note: upstream forces _FORTIFY_SOURCE=2
    export CFLAGS="${CFLAGS/-Wp,-D_FORTIFY_SOURCE=?/}"
    export CXXFLAGS="${CXXFLAGS/-Wp,-D_FORTIFY_SOURCE=?/}"
    
    EMAIL='someone@archlinux.org' \
    cmake -B build -S intel-graphics-compiler \
        -G 'Unix Makefiles' \
        -DCCLANG_FROM_SYSTEM:BOOL='OFF' \
        -DCMAKE_BUILD_TYPE:STRING='Release' \
        -DCMAKE_INSTALL_LIBDIR:PATH='lib' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DCMAKE_POLICY_VERSION_MINIMUM:STRING='3.5.0' \
        -DCMAKE_SKIP_RPATH:BOOL='YES' \
        -DIGC_OPTION__CLANG_MODE:STRING='Source' \
        -DIGC_OPTION__LINK_KHRONOS_SPIRV_TRANSLATOR:BOOL='ON' \
        -DIGC_OPTION__LLD_MODE:STRING='Source' \
        -DIGC_OPTION__LLVM_MODE:STRING='Source' \
        -DIGC_OPTION__LLVM_PREFERRED_VERSION:STRING="${_llvmver}" \
        -DIGC_OPTION__SPIRV_TOOLS_MODE:STRING='Source' \
        -DIGC_OPTION__USE_PREINSTALLED_SPIRV_HEADERS:BOOL='OFF' \
        -DIGC_OPTION__VC_INTRINSICS_MODE:STRING='Source' \
        -Wno-dev
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -D -m644 intel-graphics-compiler/LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
    mv "${pkgdir}/usr/include"/opencl-c{,-base}.h "${pkgdir}/usr/include/igc"
    mv "${pkgdir}/usr/lib/igc${pkgver%%.*}/NOTICES.txt" "${pkgdir}/usr/share/licenses/${pkgname}"
    rm "${pkgdir}/usr/bin/lld"
    
    # additional files for opencl-clang
    install -D -m644 opencl-clang/opencl_clang.h -t "${pkgdir}/usr/include/cclang"
    install -D -m644 opencl-clang/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-opencl-clang"
    ln -s "libopencl-clang.so.${_llvmmaj}" "${pkgdir}/usr/lib/libopencl-clang.so"
}
