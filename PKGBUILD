# Maintainer : Daniel Bermond < yahoo-com: danielbermond >
# Contributor: Devaux Fabien <fdev31@gmail.com>

pkgname=srt-git
pkgver=1.3.0.r0.g5276995
pkgrel=2
pkgdesc='Secure Reliable Transport - transport technology that optimizes streaming performance across unpredictable networks (git version)'
arch=('i686' 'x86_64')
url='https://www.srtalliance.org/'
license=('MPL')
depends=('openssl')
makedepends=('git' 'cmake')
provides=('srt' 'libsrt.so')
conflicts=('srt')
source=("$pkgname"::'git+https://github.com/Haivision/srt.git')
sha256sums=('SKIP')

prepare() {
    cd "$pkgname"
    
    # remove insecure rpath
    sed -i '/set(FORCE_RPATH/d' CMakeLists.txt
}

pkgver() {
    cd "$pkgname"
    
    # git, tags available
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    cd "$pkgname"
    
    mkdir -p build
    cd build
    
    cmake \
        -DCMAKE_COLOR_MAKEFILE:BOOL='ON' \
        -DCMAKE_INSTALL_BINDIR:PATH='bin' \
        -DCMAKE_INSTALL_INCLUDEDIR:PATH='include' \
        -DCMAKE_INSTALL_LIBDIR:PATH='lib' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DENABLE_CXX11:BOOL='ON' \
        -DENABLE_C_DEPS:BOOL='ON' \
        -DENABLE_GETNAMEINFO:BOOL='OFF' \
        -DENABLE_HEAVY_LOGGING:BOOL='OFF' \
        -DENABLE_LOGGING:BOOL='ON' \
        -DENABLE_PROFILE:BOOL='OFF' \
        -DENABLE_SHARED:BOOL='ON' \
        -DENABLE_STATIC:BOOL='OFF' \
        -DENABLE_SUFLIP:BOOL='OFF' \
        -DUSE_GNUTLS:BOOL='OFF' \
        -Wno-dev \
        ..
        
    make
}

package() {
    cd "${pkgname}/build"
    
    make DESTDIR="$pkgdir" install
}
