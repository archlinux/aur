# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgbase=openjph
pkgname=('openjph' 'openjph-doc')
pkgver=0.10.4
pkgrel=1
pkgdesc='Open-source implementation of JPEG2000 Part-15'
arch=('x86_64')
url='https://github.com/aous72/OpenJPH/'
license=('BSD-2-Clause')
makedepends=('cmake' 'doxygen' 'libtiff')
source=("https://github.com/aous72/OpenJPH/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz"
        '010-openjph-fix-tests.patch'::'https://github.com/aous72/OpenJPH/commit/8f5924d65f6a65dc2e3c4f3083b6c83675138ac2.patch')
sha256sums=('0f89f9b15c74281ba516f643527d19f3864c95b6646c158d16d4c73fe9eb5255'
            'eec65e6bdbc57439e631c6b4f72f311286daeb1a4d3001feaac15fcde4a74176')

prepare() {
    patch -d "OpenJPH-${pkgver}" -Np1 -i "${srcdir}/010-openjph-fix-tests.patch"
}

build() {
    cmake -B build -S "OpenJPH-${pkgver}" \
        -G 'Unix Makefiles' \
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
}

package_openjph-doc() {
    pkgdesc+=' (documentation)'
    arch=('any')
    
    install -d -m755 "${pkgdir}/usr/share/doc"
    install -D -m644 "OpenJPH-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    cp -dr --no-preserve='ownership' "OpenJPH-${pkgver}/docs/html" "${pkgdir}/usr/share/doc/openjph"
}
