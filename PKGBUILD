# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgbase=openjph
pkgname=('openjph' 'openjph-doc')
pkgver=0.10.3
pkgrel=1
pkgdesc='Open-source implementation of JPEG2000 Part-15'
arch=('x86_64')
url='https://github.com/aous72/OpenJPH/'
license=('BSD')
makedepends=('cmake' 'doxygen' 'libtiff')
options=('!emptydirs')
source=("https://github.com/aous72/OpenJPH/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('9333fe0d07b19e9cee45708beb6a965d3d4aa31b19c5e0de54c9d46618bb4835')

build() {
    cmake -B build -S "OpenJPH-${pkgver}" \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DOJPH_ENABLE_INTEL_AVX512:BOOL='OFF' \
        -DOJPH_BUILD_TESTS:BOOL='ON' \
        -Wno-dev
    cmake --build build
    
    cd "OpenJPH-${pkgver}/docs"
    doxygen
}

check() {
    ctest --test-dir build --output-on-failure
}

package_openjph() {
    depends=('libtiff')
    
    DESTDIR="$pkgdir" cmake --install build
    install -D -m644 "OpenJPH-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    rm -r "${pkgdir}/usr"/{include/gtest,lib/{libgtest*,cmake/GTest,pkgconfig/gtest*}}
}

package_openjph-doc() {
    pkgdesc+=' (documentation)'
    arch=('any')
    
    install -d -m755 "${pkgdir}/usr/share/doc"
    install -D -m644 "OpenJPH-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    cp -dr --no-preserve='ownership' "OpenJPH-${pkgver}/docs/html" "${pkgdir}/usr/share/doc/openjph"
}
