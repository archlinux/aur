# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgbase=openjph
pkgname=(
    'openjph'
    'openjph-doc')
pkgver=0.25.2
pkgrel=1
pkgdesc='Open-source implementation of JPEG2000 Part-15'
arch=('x86_64')
url='https://github.com/aous72/OpenJPH/'
license=('BSD-2-Clause')
makedepends=(
    'cmake'
    'doxygen'
    'gcc14'
    'libtiff')
checkdepends=(
    'expat')
source=("https://github.com/aous72/OpenJPH/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('ae5f09562cb811cb2fb881c5eb74583e18db941848cfa3c35787e2580f3defc6')

build() {
    # https://github.com/aous72/OpenJPH/issues/186
    export CC='gcc-14'
    export CXX='g++-14'
    
    cmake -B build -S "OpenJPH-${pkgver}" \
        -G 'Unix Makefiles' \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DOJPH_DISABLE_SSSE3:BOOL='ON' \
        -DOJPH_DISABLE_SSE4:BOOL='ON' \
        -DOJPH_DISABLE_AVX:BOOL='ON' \
        -DOJPH_DISABLE_AVX2:BOOL='ON' \
        -DOJPH_DISABLE_AVX512:BOOL='ON' \
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
    depends=(
        'gcc-libs'
        'glibc'
        'libtiff')
    
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
