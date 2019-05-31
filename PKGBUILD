# Maintainer: Daniel Bermond < gmail-com: danielbermond >

pkgname=intel-svt-av1
pkgver=0.5.0
pkgrel=1
pkgdesc='An AV1-compliant encoder for Intel CPUs of 5th Generation (Broadwell) and above'
arch=('x86_64')
url='https://github.com/OpenVisualCloud/SVT-AV1/'
license=('BSD')
depends=('gcc-libs')
makedepends=('cmake' 'yasm' 'python')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/OpenVisualCloud/SVT-AV1/archive/v${pkgver}.tar.gz")
sha256sums=('cdf36926820d2efcf019ed1a1e66cbc2470b86a28606a00497eb842bd2e495b1')

build() {
    cd "SVT-AV1-${pkgver}"
    
    cmake \
        -DCMAKE_ASM_NASM_COMPILER:FILEPATH='/usr/bin/yasm' \
        -DCMAKE_BUILD_TYPE:STRING='Release' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DCMAKE_SKIP_INSTALL_RPATH:BOOL='YES' \
        -Wno-dev \
        .
        
    make
}

check() {
    cd "SVT-AV1-${pkgver}"
    
    make test
}

package() {
    cd "SVT-AV1-${pkgver}"
    
    make DESTDIR="$pkgdir" install
    
    # remove decoder (not yet implemented by upstream)
    rm "${pkgdir}/usr/bin/SvtAv1DecApp"
    rm "${pkgdir}/usr/lib/libSvtAv1Dec.so"
    rm "${pkgdir}/usr/lib/pkgconfig/SvtAv1Dec.pc"
    
    # remove test files
    rm "${pkgdir}/usr/bin/SvtAv1UnitTests"
    rm "${pkgdir}/usr/lib/libgtest_all.so"
    
    install -D -m644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
