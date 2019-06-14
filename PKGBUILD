# Maintainer: Daniel Bermond < gmail-com: danielbermond >

pkgname=intel-svt-hevc
pkgver=1.3.0
pkgrel=2
pkgdesc='An HEVC-compliant encoder for Intel CPUs of 5th Generation (Broadwell) and above'
arch=('x86_64')
url='https://github.com/OpenVisualCloud/SVT-HEVC/'
license=('BSD')
depends=('gcc-libs')
makedepends=('cmake' 'yasm')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/OpenVisualCloud/SVT-HEVC/archive/v${pkgver}.tar.gz"
        'intel-svt-hevc-fix-build-on-non-intel.patch')
sha256sums=('ef21f3a13e33b4f61af4a0c79337ce9e4f73f6fe13d1c2afe2c3b0712f4158d9'
            'e18d5cba469242e35fcbf285a3f05cd954d27b3243c8760333c5487b60e55132')

prepare() {
    cd "SVT-HEVC-${pkgver}"
    
    mkdir -p build
    
    # hack: fix build on non-intel cpu
    local _cpu_vendor
    _cpu_vendor="$(awk -F':' '/vendor_id/ { gsub(" ", "", $2); print $2 }' /proc/cpuinfo | uniq)"
    if [ "$_cpu_vendor" != 'GenuineIntel' ] 
    then
        patch -Np1 -i "${srcdir}/intel-svt-hevc-fix-build-on-non-intel.patch"
    fi
}

build() {
    cd "SVT-HEVC-${pkgver}/build"
    
    cmake \
        -DCMAKE_ASM_NASM_COMPILER:FILEPATH='/usr/bin/yasm' \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -Wno-dev \
        ..
        
    make
}

package() {
    cd "SVT-HEVC-${pkgver}/build"
    
    make DESTDIR="$pkgdir" install
    
    install -D -m644 "${srcdir}/SVT-HEVC-${pkgver}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
