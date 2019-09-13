# Maintainer: Daniel Bermond < gmail-com: danielbermond >

pkgname=svt-hevc
pkgver=1.4.1
pkgrel=1
pkgdesc='An HEVC-compliant encoder for Intel CPUs of 5th Generation (Broadwell) and above'
arch=('x86_64')
url='https://github.com/OpenVisualCloud/SVT-HEVC/'
license=('BSD')
depends=('glibc')
makedepends=('cmake' 'yasm')
provides=('intel-svt-hevc')
conflicts=('intel-svt-hevc')
replaces=('intel-svt-hevc')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/OpenVisualCloud/SVT-HEVC/archive/v${pkgver}.tar.gz")
sha256sums=('8ceb14acddd0af48e87deb17dc0a54fc9f82c50d6e0b392076fa8f7d0533f74b')

prepare() {
    cd "SVT-HEVC-${pkgver}"
    
    mkdir -p build
}

build() {
    cd "SVT-HEVC-${pkgver}/build"
    
    # remove executable stack from libarary
    export LDFLAGS="${LDFLAGS} -Wl,-z,noexecstack"
    
    cmake \
        -DBUILD_SHARED_LIBS:BOOL='ON' \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_LIBDIR:PATH='lib' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DNATIVE:BOOL='OFF' \
        -Wno-dev \
        ..
        
    make
}

package() {
    cd "SVT-HEVC-${pkgver}/build"
    
    make DESTDIR="$pkgdir" install
    
    install -D -m644 "${srcdir}/SVT-HEVC-${pkgver}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
