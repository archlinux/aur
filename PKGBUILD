# Maintainer: Daniel Bermond < gmail-com: danielbermond >

pkgname=libmysofa-git
_srcname=libmysofa
pkgver=0.7.r0.g2ed84bb
pkgrel=1
pkgdesc='C library to read HRTFs if they are stored in the AES69-2015 SOFA format (git version)'
arch=('i686' 'x86_64')
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
    cd "$_srcname"
    
    # git, tags available
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    cd "${_srcname}/build"
    
    cmake \
        -DBUILD_TESTS:BOOL='ON' \
        -DCMAKE_INSTALL_LIBDIR:PATH='lib' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -Wno-dev \
        ..
        
    make all
}

check() {
    cd "${_srcname}/build"
    
    make test
}

package() {
    cd "${_srcname}/build"
    
    make DESTDIR="$pkgdir" install
    
    cd "${srcdir}/${_srcname}"
    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
