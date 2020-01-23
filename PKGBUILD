# Maintainer: RedTide <redtid3@gmail.com>

_pkgname="sfizz"
pkgname="${_pkgname}-git"
pkgver=r801.8ab993b
pkgrel=1
pkgdesc="SFZ library and LV2 plugin"
url="https://sfz.tools/sfizz"
arch=('x86_64')
license=('custom:BSD-2-Clause' 'custom:ISC')
makedepends=('git' 'cmake')
depends=('libsndfile')
provides=('sfizz')
conflicts=('sfizz')
source=("$pkgname"::"git+https://github.com/sfztools/sfizz#branch=develop")
sha512sums=('SKIP')
pkgver() {
    cd "${pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
prepare() {
    cd "${srcdir}/${pkgname}"
    git submodule update --init --recursive
}
build() {
    mkdir -p build
    cd build
    cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX="/usr" "${srcdir}/${pkgname}"
    cmake --build . --target all
}
package() {
    DESTDIR="${pkgdir}" cmake --build "${srcdir}/build" --target install
    install -Dm644 "${srcdir}/${pkgname}/LICENSE.md" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
