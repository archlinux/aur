# Maintainer: Daniel Bermond < gmail-com: danielbermond >

pkgname=intel-graphics-compiler-git
pkgver=19.12.1681.r0.g81d4678
pkgrel=1
pkgdesc='Intel Graphics Compiler for OpenCL (git version)'
arch=('x86_64')
url='https://github.com/intel/intel-graphics-compiler/'
license=('MIT')
depends=('llvm-libs')
makedepends=(
    # official repositories:
        'git' 'cmake' 'clang' 'llvm' 'zlib' 'python2'
    # AUR:
        'opencl-clang-git'
)
provides=('intel-graphics-compiler')
conflicts=('intel-graphics-compiler')
options=('!emptydirs')
source=('git+https://github.com/intel/intel-graphics-compiler.git')
sha256sums=('SKIP')

prepare() {
    mkdir -p build
    
    ln -sf intel-graphics-compiler igc
}

pkgver() {
    cd intel-graphics-compiler
    
    # git, tags available
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^igc\.//'
}

build() {
    cd build
    
    cmake \
        -DCMAKE_BUILD_TYPE='Release' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DIGC_OPTION__OUTPUT_DIR='../igc-install/Release' \
        -DVME_TYPES_DEFINED='FALSE' \
        -Wno-dev \
        ../igc
        
    make
           
    # license
    sed -n '2,20p' IGC/AdaptorOCL/igc.opencl.h > LICENSE # create file
    sed -i '1,22s/^.\{,3\}//' LICENSE # erase C comments
}

package() {
    cd build
    
    make DESTDIR="$pkgdir" install
    
    rm "${pkgdir}/usr/lib/libcommon_clang.so"
    
    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
