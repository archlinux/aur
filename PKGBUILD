# Maintainer: Daniel Bermond < gmail-com: danielbermond >

pkgname=intel-graphics-compiler-git
pkgver=2019.02.25.r44.g4be564f
pkgrel=1
pkgdesc='Intel Graphics Compiler for OpenCL (git version)'
arch=('x86_64')
url='https://github.com/intel/intel-graphics-compiler/'
license=('MIT')
depends=('gcc-libs' 'zlib')
makedepends=('git' 'cmake' 'libxml2' 'python-nose' 'python2' 'python2-pygments'
             'python2-yaml')
provides=('intel-graphics-compiler')
conflicts=('intel-graphics-compiler' 'compute-runtime')
options=('!emptydirs')
source=('igc'::'git+https://github.com/intel/intel-graphics-compiler.git'
        'llvm_patches'::'git+https://github.com/intel/llvm-patches.git'
        'llvm_source'::'git+https://github.com/llvm-mirror/llvm.git#branch=release_70'
        'git+https://github.com/llvm-mirror/clang.git#branch=release_70'
        'git+https://github.com/intel/opencl-clang.git#branch=ocl-open-70'
        'git+https://github.com/KhronosGroup/SPIRV-LLVM-Translator.git#branch=llvm_release_70')
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

prepare() {
    mkdir -p build
    
    ln -sf "${srcdir}/clang" llvm_source/tools/clang
    ln -sf "${srcdir}/opencl-clang" llvm_source/projects/opencl-clang
    ln -sf "${srcdir}/SPIRV-LLVM-Translator" llvm_source/projects/llvm-spirv
    
    # for applying patches from llvm-patches
    local _dir
    for _dir in clang SPIRV-LLVM-Translator
    do
        cd "$_dir"
        git config --local commit.gpgsign false
        git config --local user.email 'aur@localhost.none'
        git config --local user.name 'Arch User Repository (AUR)'
        cd ..
    done
}

pkgver() {
    cd igc
    
    # git, tags available
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^igc_release_//'
}

build() {
    cd build
    
    cmake \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -Wno-dev \
        ../igc/IGC
        
    make
    
    # license
    sed -n '2,20p' igc.opencl.h > LICENSE # create file
    sed -i '1,22s/^.\{,3\}//' LICENSE     # erase C comments
}

package() {
    cd build
    
    make DESTDIR="$pkgdir" install
    
    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
