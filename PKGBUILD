# Maintainer: Daniel Bermond < gmail-com: danielbermond >

pkgname=intel-graphics-compiler
pkgver=2019.03.12
_srcver="${pkgver//./-}"
pkgrel=2
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
source=("https://github.com/intel/intel-graphics-compiler/archive/igc_release_${_srcver}.tar.gz")
noextract=("igc_release_${_srcver}.tar.gz")
sha256sums=('933dbd493b3c3307266b6a0ea8d41ffd8e5c44761f9bbbacbb3f36b3d58d2268')

prepare() {
    mkdir -p build igc
    
    bsdtar xf "igc_release_${_srcver}.tar.gz" -C igc --strip-components='1'
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
    
    rm "${pkgdir}/usr/lib/libopencl_clang.so"
    
    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
