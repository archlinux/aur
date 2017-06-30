# Maintainer: Daniel Bermond < yahoo-com: danielbermond >

pkgname=libmysofa
pkgver=0.5
pkgrel=1
pkgdesc='C library to read HRTFs if they are stored in the AES69-2015 SOFA format'
arch=('i686' 'x86_64')
url='https://hoene.github.io/libmysofa/'
license=('BSD')
depends=('glibc' 'zlib')
makedepends=('cmake')
conflicts=('libmysofa-git')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/hoene/libmysofa/archive/v${pkgver}.tar.gz")
sha256sums=('c4ffef39c24b14ea91f5631058adfd192e491e2d5c48bf7f5678e6fb02daa814')

build() {
    cd "${pkgname}-${pkgver}/build"
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
    # includes
    cd "${pkgname}-${pkgver}/src/hrtf"
    install -D -m644 mysofa.h  "${pkgdir}/usr/include/mysofa.h"
    
    # library
    cd "${srcdir}/${pkgname}-${pkgver}/build/src"
    install -D -m755 libmysofa.so "${pkgdir}/usr/lib/libmysofa.so"
    
    # license
    cd "${srcdir}/${pkgname}-${pkgver}"
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
