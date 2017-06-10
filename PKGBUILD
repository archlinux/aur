# Maintainer: Daniel Bermond < yahoo-com: danielbermond >

pkgname=libmysofa
pkgver=0.4
pkgrel=1
pkgdesc='C library to read HRTFs if they are stored in the AES69-2015 SOFA format'
arch=('i686' 'x86_64')
url='https://hoene.github.io/libmysofa/'
license=('APACHE')
makedepends=(
    # official repositories:
        'cmake'
    # AUR:
        'libresample' 'bcunit-cunit-compat'
)
conflicts=('libmysofa-git')
source=("${pkgname}-${pkgver}.tar.gz"::'https://github.com/hoene/libmysofa/archive/v0,.4.tar.gz')
noextract=("${pkgname}-${pkgver}.tar.gz")
options=('staticlibs')
sha256sums=('db843d03361839a523984db3ccdf03426d636b4637fc040001c7a6aabaafee98')

build() {
    # extract sources (version 0.4 has wrongly typed characters in filename)
    mkdir -p "${pkgname}-${pkgver}"
    cd "${pkgname}-${pkgver}"
    bsdtar -xf "${srcdir}/${pkgname}-${pkgver}.tar.gz" -s'|[^/]*/||'
    
    # replace 'CUnit.h' references for 'Cunit.h' (due to packaging of bcunit-cunit-compat)
    cd src/tests
    sed -i 's/CUnit\.h/Cunit\.h/' tests.c
    sed -i 's/CUnit\.h/Cunit\.h/' tests.h
    
    cd "${srcdir}/${pkgname}-${pkgver}/build"
    cmake \
        -DCMAKE_BUILD_TYPE:STRING=Release \
        -DCMAKE_COLOR_MAKEFILE:BOOL=ON \
        -DCMAKE_INSTALL_PREFIX:PATH=/usr \
        ..
    make all
}

package() {
    # includes
    cd "${pkgname}-${pkgver}/src/hrtf"
    install -D -m644 mysofa.h  "${pkgdir}/usr/include/mysofa.h"
    
    # library
    cd "${srcdir}/${pkgname}-${pkgver}/build/src"
    install -D -m644 libmysofa.a "${pkgdir}/usr/lib/libmysofa.a"
    
    # license
    cd "${srcdir}/${pkgname}-${pkgver}"
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
