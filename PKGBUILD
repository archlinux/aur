# Maintainer: AOWIS

pkgname='owa-epanet-git'
pkgver=r1577.f36ba6c
pkgrel=1
pkgdesc='Hydraulic and water quality modeling tool for water distribution networks (EPANET)'
provides=('epanet' 'runepanet')
conflicts=('epanet' 'runepanet')
arch=('x86_64')
license=('MIT')
url='https://github.com/OpenWaterAnalytics/EPANET'
makedepends=('git' 'cmake')
depends=()
source=("${pkgname}::git+https://github.com/OpenWaterAnalytics/EPANET.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    printf "r%s.%s" \
        "$(git rev-list --count HEAD)" \
        "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${pkgname}"

    cmake -B build -S . \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr

    cmake --build build
}

package() {
    cd "${srcdir}/${pkgname}"

    DESTDIR="${pkgdir}" cmake --install build

    install -Dm644 LICENSE \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    
    ln -s runepanet "${pkgdir}/usr/bin/epanet"
}
