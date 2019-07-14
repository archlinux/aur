# Maintainer: Daniel Bermond < gmail-com: danielbermond >

pkgname=libmysofa-git
pkgver=0.7.r10.g3dba53f
pkgrel=1
pkgdesc='C library to read HRTFs if they are stored in the AES69-2015 SOFA format (git version)'
arch=('x86_64')
url='https://hoene.github.io/libmysofa/'
license=('BSD')
depends=('zlib')
makedepends=('git' 'cmake' 'cunit')
checkdepends=('nodejs')
provides=('libmysofa')
conflicts=('libmysofa')
source=('git+https://github.com/hoene/libmysofa.git')
sha256sums=('SKIP')

pkgver() {
    cd libmysofa
    
    # git, tags available
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    cd libmysofa/build
    
    cmake \
        -DBUILD_TESTS:BOOL='ON' \
        -DCMAKE_INSTALL_LIBDIR:PATH='lib' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -Wno-dev \
        ..
        
    make all
}

check() {
    cd libmysofa/build
    
    make test
}

package() {
    cd libmysofa/build
    
    make DESTDIR="$pkgdir" install
    
    cd "${srcdir}/libmysofa"
    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
