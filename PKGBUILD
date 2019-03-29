# Maintainer: Daniel Bermond < gmail-com: danielbermond >

pkgname=intel-graphics-compiler-git
pkgver=19.12.1681.r20.g48660a1
pkgrel=1
pkgdesc='Intel Graphics Compiler for OpenCL (git version)'
arch=('x86_64')
url='https://github.com/intel/intel-graphics-compiler/'
license=('MIT')
depends=('llvm-libs')
makedepends=('git' 'cmake' 'clang' 'llvm' 'zlib' 'python2' 'intel-opencl-clang')
provides=('intel-graphics-compiler')
conflicts=('intel-graphics-compiler')
options=('!emptydirs')
source=('git+https://github.com/intel/intel-graphics-compiler.git')
sha256sums=('SKIP')

prepare() {
    mkdir -p build
}

pkgver() {
    cd intel-graphics-compiler
    
    # git, tags available
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^igc\.//'
}

build() {
    cd build
    
    cmake \
        -DCMAKE_INSTALL_LIBDIR:PATH='lib' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DIGC_OPTION__OUTPUT_DIR='../igc-install/None' \
        -DIGC_PREFERRED_LLVM_VERSION='7.0.1' \
        -DVME_TYPES_DEFINED='FALSE' \
        -Wno-dev \
        ../intel-graphics-compiler
        
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
