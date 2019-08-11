# Maintainer: Daniel Bermond < gmail-com: danielbermond >

pkgname=intel-svt-hevc
pkgver=1.4.0
pkgrel=1
pkgdesc='An HEVC-compliant encoder for Intel CPUs of 5th Generation (Broadwell) and above'
arch=('x86_64')
url='https://github.com/OpenVisualCloud/SVT-HEVC/'
license=('BSD')
depends=('glibc')
makedepends=('cmake' 'yasm')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/OpenVisualCloud/SVT-HEVC/archive/v${pkgver}.tar.gz")
sha256sums=('7bb2ed0d6a46dbb6478127762b12f3d21a7901fd68876ce61f91360c5c52798e')

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
