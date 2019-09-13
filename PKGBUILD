# Maintainer: Daniel Bermond < gmail-com: danielbermond >

pkgname=svt-av1
pkgver=0.6.0
pkgrel=1
pkgdesc='An AV1-compliant encoder and decoder for Intel CPUs of 5th Generation (Broadwell) and above'
arch=('x86_64')
url='https://github.com/OpenVisualCloud/SVT-AV1/'
license=('BSD')
depends=('gcc-libs')
makedepends=('cmake' 'yasm' 'python')
provides=('intel-svt-av1')
conflicts=('intel-svt-av1')
replaces=('intel-svt-av1')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/OpenVisualCloud/SVT-AV1/archive/v${pkgver}.tar.gz")
sha256sums=('4ff6f05a9528fe8a7b3d6708fe1115d15d26a5a9b0b676d8a250a0b2e8630579')

prepare() {
    cd "SVT-AV1-${pkgver}"
    
    mkdir -p build
}

build() {
    cd "SVT-AV1-${pkgver}/build"
    
    # remove executable stack from libraries
    export LDFLAGS+=' -Wl,-z,noexecstack'
    
    cmake \
        -DBUILD_SHARED_LIBS:BOOL='ON' \
        -DCMAKE_ASM_NASM_COMPILER:FILEPATH='/usr/bin/yasm' \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_LIBDIR:PATH='lib' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DNATIVE:BOOL='OFF' \
        -Wno-dev \
        ..
        
    make
}

package() {
    cd "SVT-AV1-${pkgver}/build"
    
    make DESTDIR="$pkgdir" install
    
    install -D -m644 "${srcdir}/SVT-AV1-${pkgver}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
