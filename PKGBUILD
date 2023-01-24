# Maintainer: Guilhem Saurel <saurel@laas.fr>

pkgorg='stack-of-tasks'
_pkgname='eiquadprog'
pkgname=("${_pkgname}" "${_pkgname}-docs")
pkgver=1.2.5
pkgrel=2
pkgdesc="Quadratic Programing solver with eigen"
arch=('any')
url="https://github.com/${pkgorg}/${_pkgname}"
license=('LGPL')
depends=()
optdepends=('doxygen')
makedepends=('cmake' 'boost' 'boost-libs' 'eigen')
source=($url/releases/download/v${pkgver}/${_pkgname}-${pkgver}.tar.gz{,.sig})
sha256sums=('c90a8bfa35e316cccef852392e4584381f0394c03adefcdcaa5a153c2ee86f7e'
            'SKIP')
validpgpkeys=('9B1A79065D2F2B806C8A5A1C7D2ACDAF4653CF28')

build() {
    cmake -B "build-$pkgver" -S "$pkgbase-$pkgver" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib
    cmake --build "build-$pkgver"
}

check() {
    cmake --build "build-$pkgver" -t test
}

package_eiquadprog() {
    DESTDIR="$pkgdir/" cmake --build "build-$pkgver" -t install
    rm -rf ${pkgdir}/usr/share/doc
    install -Dm644 "${_pkgname}-${pkgver}/COPYING.LESSER" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_eiquadprog-docs() {
    DESTDIR="$pkgdir/" cmake --build "build-$pkgver" -t install
    rm -rf ${pkgdir}/usr/{lib,include,"share/$_pkgname"}
    install -Dm644 "${_pkgname}-${pkgver}/COPYING.LESSER" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
