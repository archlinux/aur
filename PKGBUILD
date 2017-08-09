# Maintainer: Daniel Bermond < yahoo-com: danielbermond >

pkgname=libmysofa-git
pkgver=0.6.r3.g00c6e62
pkgrel=2
pkgdesc='C library to read HRTFs if they are stored in the AES69-2015 SOFA format (git version)'
arch=('i686' 'x86_64')
url='https://hoene.github.io/libmysofa/'
license=('BSD')
depends=('glibc' 'zlib')
makedepends=('git' 'cmake')
provides=('libmysofa')
conflicts=('libmysofa')
source=("$pkgname"::'git+https://github.com/hoene/libmysofa.git')
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    
    # git, tags available
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    cd "${pkgname}/build"
    cmake \
        -DBUILD_SHARED_LIBS:BOOL='ON' \
        -DBUILD_TESTS:BOOL='OFF' \
        -DCMAKE_BUILD_TYPE:STRING='Release' \
        -DCMAKE_COLOR_MAKEFILE:BOOL='ON' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -Wno-dev \
        ..
    make all
}

package() {
    cd "${pkgname}/build"
    make DESTDIR="$pkgdir" install
    
    cd "${srcdir}/${pkgname}"
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
