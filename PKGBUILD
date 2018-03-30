# Maintainer : Daniel Bermond < yahoo-com: danielbermond >
# Contributor: Devaux Fabien <fdev31@gmail.com>

pkgname=srt-git
pkgver=1.2.3.r0.g1367914
pkgrel=1
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
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DENABLE_CXX11:BOOL='ON' \
        -DENABLE_LOGGING:BOOL='ON' \
        -DENABLE_PROFILE:BOOL='OFF' \
        -DENABLE_SEPARATE_HAICRYPT:BOOL='OFF' \
        -DENABLE_SHARED:BOOL='ON' \
        -DENABLE_SUFLIP:BOOL='ON' \
        -DUSE_GNUTLS:BOOL='OFF' \
        -Wno-dev \
        ..
        
    make
}

package() {
    cd "${pkgname}/build"
    
    make DESTDIR="$pkgdir" install
}
