# Maintainer: Daniel Bermond < gmail-com: danielbermond >

_srcname='chromaprint'
pkgname=chromaprint-fftw
pkgver=1.4.3
pkgrel=3
pkgdesc='Extracts fingerprints from any audio source (uses fftw for FFT calculations instead of ffmpeg)'
arch=('i686' 'x86_64')
url='https://acoustid.org/chromaprint'
license=('MIT')
makedepends=('cmake')
depends=('fftw')
provides=('chromaprint')
conflicts=('chromaprint')
source=("${_srcname}-${pkgver}.tar.gz"::"https://github.com/acoustid/chromaprint/archive/v${pkgver}.tar.gz")
sha256sums=('d4ae6596283aad7a015a5b0445012054c634a4b9329ecb23000cd354b40a283b')

prepare() {
    cd "${_srcname}-${pkgver}"
    
    sed -n '18,36p' LICENSE.md > LICENSE
}

build() {
    cd "${_srcname}-${pkgver}"
    
    cmake \
        -DBIN_INSTALL_DIR:PATH='/usr/bin' \
        -DBUILD_SHARED_LIBS:BOOL='ON' \
        -DBUILD_TESTS:BOOL='ON' \
        -DBUILD_TOOLS:BOOL='OFF' \
        -DCMAKE_BUILD_TYPE:STRING='Release' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DEXEC_INSTALL_PREFIX:PATH='/usr' \
        -DFFT_LIB:STRING='fftw3' \
        -DINCLUDE_INSTALL_DIR:PATH='/usr/include' \
        -Wno-dev \
        .
        
    make
}

check() {
    cd "${_srcname}-${pkgver}"
    
    make check
}

package() {
    cd "${_srcname}-${pkgver}"
    
    make DESTDIR="$pkgdir" install
    
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}"
}
