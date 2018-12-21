# Maintainer: Daniel Bermond < gmail-com: danielbermond >

pkgname=intel-graphics-compiler
pkgver=2018.12.12
pkgrel=1
pkgdesc='Intel Graphics Compiler for OpenCL'
arch=('x86_64')
url='https://github.com/intel/intel-graphics-compiler/'
license=('MIT')
depends=('gcc-libs' 'ncurses' 'zlib')
makedepends=(
    # official repositories:
        'git' 'cmake' 'python' 'python2' 'python2-pygments' 'python2-yaml'
        'spirv-tools'
    # AUR:
        'clang40'
)
conflicts=('compute-runtime')
options=('!emptydirs')
source=( "https://github.com/intel/intel-graphics-compiler/archive/igc_release_${pkgver//./-}.tar.gz"
        'llvm_source'::'git+https://github.com/llvm-mirror/llvm#branch=release_40'
        'llvm7.0.0_source'::'git+https://github.com/llvm-mirror/llvm#branch=release_70'
        'clang_source'::'git+https://github.com/llvm-mirror/clang#branch=release_40'
        'llvm_patches'::'git+https://github.com/intel/llvm-patches'
        'common_clang'::'git+https://github.com/intel/opencl-clang'
        'opencl_headers'::'git+https://github.com/KhronosGroup/OpenCL-Headers')
noextract=("igc_release_${pkgver//./-}.tar.gz")
sha256sums=('5fdc3ac1b9e3589c627f2c7bf0cd3195b451f8767d8dd8ad17d5e089a168eda7'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

prepare() {
    mkdir -p build igc
    
    bsdtar xf "igc_release_${pkgver//./-}.tar.gz" -C igc --strip-components='1'
}

build() {
    cd build
    
    cmake \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DIGC_OPTION__OUTPUT_DIR:PATH='../igc-install/Release' \
        -DCMAKE_BUILD_TYPE:STRING='Release' \
        -DIGC_OPTION__ARCHITECTURE_TARGET:STRING='Linux64' \
        -Wno-dev \
        ../igc/IGC
        
    make
    make package
    
    # license
    sed -n '2,20p' igc.opencl.h > LICENSE # create file
    sed -i '1,22s/^.\{,3\}//' LICENSE     # erase C comments
}

package() {
    cd build/_CPack_Packages/Linux/TXZ
    
    cd "$(find . -maxdepth 1 -type d -name 'intel-*')"
    
    local _dir
    while read -rd '' _dir
    do
        cd "$_dir"
        cp -af * "$pkgdir"
        cd ..
    done < <(find . -maxdepth 1 -type d -name 'igc-*' -print0)
    
    install -D -m644 "${srcdir}/build/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
