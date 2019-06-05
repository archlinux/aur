# Maintainer: Daniel Bermond < gmail-com: danielbermond >

pkgname=intel-graphics-compiler-git
pkgver=1.0.7.r34.g8cb64241
pkgrel=1
epoch=1
pkgdesc='Intel Graphics Compiler for OpenCL (git version)'
arch=('x86_64')
url='https://github.com/intel/intel-graphics-compiler/'
license=('MIT')
depends=('llvm-libs' 'intel-opencl-clang')
makedepends=('git' 'cmake' 'clang' 'llvm' 'zlib' 'python2')
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
        -DCMAKE_BUILD_TYPE='Release' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -DCMAKE_INSTALL_LIBDIR='lib' \
        -DIGC_OPTION__ARCHITECTURE_TARGET='Linux64' \
        -DIGC_PREFERRED_LLVM_VERSION='8.0.0' \
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
    
    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
