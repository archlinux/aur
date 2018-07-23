# Maintainer: Daniel Bermond < yahoo-com: danielbermond >

_llvm_branch='release_40'

pkgname=intel-graphics-compiler-git
pkgver=r460.ab2a715
pkgrel=1
pkgdesc='Intel Graphics Compiler for OpenCL (git version)'
arch=('i686' 'x86_64')
url='https://github.com/intel/intel-graphics-compiler/'
license=('MIT')
depends=('gcc-libs' 'ncurses' 'zlib')
makedepends=('git' 'cmake' 'clang' 'flex' 'bison' 'python2')
provides=('intel-graphics-compiler')
conflicts=('intel-graphics-compiler')
options=('!emptydirs')
source=('igc'::'git+https://github.com/intel/intel-graphics-compiler.git'
        'llvm_source'::"git+https://github.com/llvm-mirror/llvm#branch=${_llvm_branch}"
        'clang_source'::"git+https://github.com/llvm-mirror/clang#branch=${_llvm_branch}"
        'llvm_patches'::'git+https://github.com/intel/llvm-patches'
        'common_clang'::'git+https://github.com/intel/opencl-clang'
        'opencl_headers'::'git+https://github.com/KhronosGroup/OpenCL-Headers')
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

pkgver() {
    cd igc
    
    # git, no tags available
    printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    [ "$CARCH" = 'i686'   ] && local _arch='Linux32'
    [ "$CARCH" = 'x86_64' ] && local _arch='Linux64'
    
    mkdir -p build
    cd build
    
    cmake \
        -DCMAKE_BUILD_TYPE:STRING='Release' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DIGC_OPTION__ARCHITECTURE_TARGET:STRING="$_arch" \
        -DIGC_OPTION__OUTPUT_DIR:PATH='../igc-install/Release' \
        -Wno-dev \
        ../igc/IGC
        
    make
    
    make package
}

package() {
    cd build/_CPack_Packages/Linux/TXZ
    
    cd "$(find . -maxdepth 1 -type d -name 'IGC-*')"
    
    for _dir in igc-*
    do
        cd "$_dir"
        cp -af * "$pkgdir"
        cd ..
    done
    
    # license
    cd "${srcdir}/build"
    sed -n '2,20p' igc.opencl.h > LICENSE # create file
    sed -i '1,22s/^.\{,3\}//' LICENSE     # erase C comments
    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
