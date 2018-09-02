# Maintainer: Daniel Bermond < yahoo-com: danielbermond >

pkgname=gmmlib-git
pkgver=18.3.pre1.r0.g99ff764
pkgrel=1
pkgdesc='Intel Graphics Memory Management Library (git version)'
arch=('i686' 'x86_64')
url='https://github.com/intel/gmmlib/'
license=('MIT')
depends=('gcc-libs')
makedepends=('git' 'cmake')
provides=('gmmlib')
conflicts=('gmmlib')
options=('!emptydirs')
source=("$pkgname"::'git+https://github.com/intel/gmmlib.git')
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    
    # git, tags available
    git describe --long --tags | sed 's/^intel-gmmlib-//;s/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    cd "$pkgname"
    
    mkdir -p build
    cd build
    
    [ "$CARCH" = 'i686'   ] && local _arch='32'
    [ "$CARCH" = 'x86_64' ] && local _arch='64'
    
    cmake \
        -DCMAKE_BUILD_TYPE:STRING='Release' \
        -DCMAKE_INSTALL_LIBDIR:PATH='lib' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DRUN_TEST_SUITE:BOOL='ON' \
        -DARCH="$_arch" \
        -Wno-dev \
        ..
    
    make
}

package() {
    cd "${pkgname}/build"
    
    make DESTDIR="$pkgdir" install
    
    # license
    cd "${srcdir}/${pkgname}"
    install -D -m644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
