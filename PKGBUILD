# Maintainer: Daniel Bermond < gmail-com: danielbermond >

pkgname=intel-graphics-compiler
pkgver=19.12.1681
pkgrel=2
epoch=1
pkgdesc='Intel Graphics Compiler for OpenCL'
arch=('x86_64')
url='https://github.com/intel/intel-graphics-compiler/'
license=('MIT')
depends=('llvm-libs')
makedepends=(
    # official repositories:
        'cmake' 'clang' 'llvm' 'zlib' 'python2'
    # AUR:
        'opencl-clang-git'
)
options=('!emptydirs')
source=("https://github.com/intel/intel-graphics-compiler/archive/igc-${pkgver}.tar.gz")
noextract=("igc-${pkgver}.tar.gz")
sha256sums=('e044081f2840c3511070492aaac29e6f6c1b89b17918e69bb850df53f326d9eb')

prepare() {
    mkdir -p build igc
    
    bsdtar xf "igc-${pkgver}.tar.gz" -C igc --strip-components='1'
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
