# Maintainer: Daniel Bermond < yahoo-com: danielbermond >

pkgname=libaom
pkgver=1.0.0
pkgrel=1
pkgdesc='AV1 video codec from Alliance for Open Media'
arch=('i686' 'x86_64')
url='https://aomedia.org/'
license=('BSD')
depends=('gcc-libs')
makedepends=('git' 'cmake' 'perl' 'yasm' 'doxygen')
provides=('aom' 'libaom.so')
conflicts=('libaom-git' 'aom' 'aom-git')
source=("${pkgname}-git"::"git+https://aomedia.googlesource.com/aom#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
    cd "${pkgname}-git"
    
    mkdir -p build
    cd build
    
    cmake \
        -DBUILD_SHARED_LIBS:BOOL='ON' \
        -DCMAKE_COLOR_MAKEFILE:BOOL='ON' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DENABLE_CCACHE:BOOL='OFF' \
        -DENABLE_DECODE_PERF_TESTS:BOOL='OFF' \
        -DENABLE_EXAMPLES:BOOL='ON' \
        -DENABLE_DISTCC:BOOL='OFF' \
        -DENABLE_DOCS:BOOL='ON' \
        -DENABLE_GOMA:BOOL='OFF' \
        -DENABLE_NASM:BOOL='OFF' \
        -DENABLE_TESTS:BOOL='OFF' \
        -DENABLE_TOOLS:BOOL='ON' \
        -DENABLE_WERROR:BOOL='OFF' \
        -DINCLUDE_INSTALL_DIR:PATH='/usr/include' \
        -DLIB_INSTALL_DIR:PATH='/usr/lib' \
        -Wno-dev \
        ..
        
    make
}

package() {
    cd "${pkgname}-git/build"
    
    make DESTDIR="$pkgdir" install
    
    # license
    cd "${srcdir}/${pkgname}-git"
    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 PATENTS -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
