# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=intel-graphics-compiler-git
pkgver=2.43.2.r55.gce0f67536
_llvmver=22.1.8
pkgrel=1
epoch=1
pkgdesc='Intel Graphics Compiler for OpenCL (git version)'
arch=('x86_64')
url='https://github.com/intel/intel-graphics-compiler/'
license=('MIT' 'Apache-2.0 WITH LLVM-exception')
depends=(
    'glibc'
    'libgcc'
    'libstdc++'
    'zlib'
    'zstd')
makedepends=(
    'cmake'
    'git'
    'python'
    'python-mako'
    'python-yaml')
provides=('intel-graphics-compiler' "intel-opencl-clang=${_llvmver%.*}")
conflicts=('intel-graphics-compiler' 'intel-opencl-clang')
# upstream do not support LTO
# https://github.com/intel/intel-graphics-compiler/issues/362#issuecomment-4089628783
options=('!emptydirs' '!lto')
source=('git+https://github.com/intel/intel-graphics-compiler.git'
        'git+https://github.com/intel/vc-intrinsics.git'
        "git+https://github.com/KhronosGroup/SPIRV-LLVM-Translator.git#branch=llvm_release_${_llvmver%%.*}0"
        "git+https://github.com/intel/opencl-clang.git#branch=ocl-open-${_llvmver%%.*}0"
        "git+https://github.com/llvm/llvm-project.git#tag=llvmorg-${_llvmver}"
        'git+https://github.com/KhronosGroup/SPIRV-Tools.git#branch=main'
        'git+https://github.com/KhronosGroup/SPIRV-Headers.git#branch=main'
        '010-intel-graphics-compiler-disable-werror.patch')
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '22acb48afcad5f242c5d3fb4da5686d6e0db60b9ac600eb23bb32dc4135ac596'
            'SKIP'
            'SKIP'
            'eee95b457f08b7d36c82f1f8f9510ac31cfe7d0feec04072f7930ae66b649974')

prepare() {
    # rename to prevent SPIRV-LLVM-Translator from being included
    # twice by the build process, which causes the build to fail
    mv SPIRV-LLVM-Translator{,-IGC-LLVM}

    ln -s "${srcdir}/SPIRV-LLVM-Translator-IGC-LLVM"  "${srcdir}/llvm-project/llvm/projects/llvm-spirv"
    ln -s "${srcdir}/opencl-clang" "${srcdir}/llvm-project/llvm/projects/opencl-clang"
    
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
    # Prevent IGC to load LLVM 23+ symbols
    export CFLAGS+=' -fno-semantic-interposition'
    export CXXFLAGS+=' -fno-semantic-interposition'
    export LDFLAGS+=' -Wl,-Bsymbolic'
    
    # fix error: "_FORTIFY_SOURCE" redefined [-Werror]
    # note: upstream forces _FORTIFY_SOURCE=2
    export CFLAGS="${CFLAGS/-Wp,-D_FORTIFY_SOURCE=?/}"
    export CXXFLAGS="${CXXFLAGS/-Wp,-D_FORTIFY_SOURCE=?/}"
    
    export GIT_COMMITTER_NAME='builduser'
    export GIT_COMMITTER_EMAIL='builduser@archlinux.org'
    
    cmake -B build -S intel-graphics-compiler \
        -G 'Unix Makefiles' \
        -DCCLANG_FROM_SYSTEM:BOOL='OFF' \
        -DCMAKE_BUILD_TYPE:STRING='Release' \
        -DCMAKE_INSTALL_LIBDIR:PATH='lib' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DCMAKE_SKIP_RPATH:BOOL='YES' \
        -DIGC_OPTION__CLANG_MODE:STRING='Source' \
        -DIGC_OPTION__LINK_KHRONOS_SPIRV_TRANSLATOR:BOOL='ON' \
        -DIGC_OPTION__LLD_MODE:STRING='Source' \
        -DIGC_OPTION__LLVM_MODE:STRING='Source' \
        -DIGC_OPTION__LLVM_PREFERRED_VERSION:STRING="${_llvmver}" \
        -DIGC_OPTION__SPIRV_TOOLS_MODE:STRING='Source' \
        -DIGC_OPTION__USE_PREINSTALLED_SPIRV_HEADERS:BOOL='OFF' \
        -DIGC_OPTION__VC_INTRINSICS_MODE:STRING='Source' \
        -Wno-author
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -D -m644 intel-graphics-compiler/LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
    mv "${pkgdir}/usr/include"/opencl-c{,-base}.h "${pkgdir}/usr/include/igc"
    mv "${pkgdir}/usr/lib/igc${pkgver%%.*}/NOTICES.txt" "${pkgdir}/usr/share/licenses/${pkgname}"
    
    # additional files for opencl-clang
    install -D -m644 opencl-clang/opencl_clang.h -t "${pkgdir}/usr/include/cclang"
    install -D -m644 opencl-clang/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-opencl-clang"
    ln -s "libopencl-clang.so.${_llvmver%.*}" "${pkgdir}/usr/lib/libopencl-clang.so"
}
