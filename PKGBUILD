# Maintainer: Guilhem Saurel <saurel@laas.fr>

_org='stack-of-tasks'
_pkgname='eiquadprog'
pkgname=("${_pkgname}" "${_pkgname}-docs")
pkgver=1.3.2
pkgrel=1
pkgdesc="Quadratic Programing solver with eigen"
arch=('any')
url="https://github.com/${_org}/${_pkgname}"
license=('LGPL')
depends=()
optdepends=('doxygen')
makedepends=('cmake' 'boost' 'boost-libs' 'eigen' 'jrl-cmakemodules')
# source=($url/releases/download/v${pkgver}/${_pkgname}-${pkgver}.tar.gz{,.sig})
# validpgpkeys=('9B1A79065D2F2B806C8A5A1C7D2ACDAF4653CF28')
source=($url/archive/refs/tags/v${pkgver}.tar.gz)
sha256sums=('e659462ec435d6a9979378de5c5af04972b35588698ab4ae7cc5d27a32e7e409')

build() {
    cmake -B "build-$pkgver" -S "$pkgbase-$pkgver" \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -Wno-dev
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
    rm -rf ${pkgdir}/usr/{lib,include,share/ament_index,"share/$_pkgname"}
    install -Dm644 "${_pkgname}-${pkgver}/COPYING.LESSER" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
