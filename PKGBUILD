# Maintainer : Daniel Bermond < gmail-com: danielbermond >
# Contributor: Devaux Fabien <fdev31@gmail.com>

pkgname=srt-git
_srcname=srt
pkgver=1.3.1.r45.g4c3dccb
pkgrel=1
pkgdesc='Secure Reliable Transport - transport technology that optimizes streaming performance across unpredictable networks (git version)'
arch=('i686' 'x86_64')
url='https://www.srtalliance.org/'
license=('MPL')
depends=('openssl')
makedepends=('git' 'cmake')
provides=('srt')
conflicts=('srt')
source=('git+https://github.com/Haivision/srt.git')
sha256sums=('SKIP')

prepare() {
    cd "$_srcname"
    
    # remove insecure rpath
    sed -i '/set(FORCE_RPATH/d' CMakeLists.txt
}

pkgver() {
    cd "$_srcname"
    
    # git, tags available
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    cd "$_srcname"
    
    mkdir -p build
    cd build
    
    cmake \
        -DCMAKE_INSTALL_BINDIR:PATH='bin' \
        -DCMAKE_INSTALL_INCLUDEDIR:PATH='include' \
        -DCMAKE_INSTALL_LIBDIR:PATH='lib' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DENABLE_TESTING='True' \
        -Wno-dev \
        ..
        
    make
}

check() {
    cd "${_srcname}/build"
    
    ./utility-test
}

package() {
    cd "${_srcname}/build"
    
    make DESTDIR="$pkgdir" install
    
    rm "$pkgdir"/usr/bin/*-test
    
    # build tries this but fails when DESTDIR is set
    ln -s srt-live-transmit "${pkgdir}/usr/bin/stransmit"
}
