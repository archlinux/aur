# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgbase=openjph
pkgname=('openjph' 'openjph-doc')
pkgver=0.9.0
pkgrel=1
pkgdesc='Open-source implementation of JPEG2000 Part-15'
arch=('x86_64')
url='https://github.com/aous72/OpenJPH/'
license=('BSD')
makedepends=('cmake' 'doxygen' 'libtiff')
source=("https://github.com/aous72/OpenJPH/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('6970b14e73babb7a2e466be115e45fc55e9e02104248938257dd5bac5c67d41a')

build() {
    cmake -B build -S "OpenJPH-${pkgver}" \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -Wno-dev
    make -C build
    
    cd "OpenJPH-${pkgver}/docs"
    doxygen
}

package_openjph() {
    depends=('libtiff')
    
    make -C build DESTDIR="$pkgdir" install
    install -D -m644 "OpenJPH-${pkgver}/license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_openjph-doc() {
    pkgdesc+=' (documentation)'
    arch=('any')
    
    install -d -m755 "${pkgdir}/usr/share/doc"
    install -D -m644 "OpenJPH-${pkgver}/license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    cp -dr --no-preserve='ownership' "OpenJPH-${pkgver}/docs/html" "${pkgdir}/usr/share/doc/openjph"
}
