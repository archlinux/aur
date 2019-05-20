# Maintainer:  Iyán Méndez Veiga <me (at) iyanmv (dot) com>
# Contributor: Ingo Bürk <admin (at) airblader (dot) de>

pkgname=huestacean
pkgver=v2.6
pkgrel=2
pkgdesc="Philips Hue control app for desktop with screen syncing"
arch=('any')
url="https://github.com/BradyBrenot/huestacean"
license=('Apache')
depends=('qt5-base' 'qt5-quickcontrols2' 'qt5-remoteobjects')
makedepends=('git' 'cmake')
provides=("${pkgname}")
source=("${pkgname}::git+https://github.com/BradyBrenot/huestacean#tag=${pkgver}"
        "${pkgname}.desktop"
        "${pkgname}.png")
sha256sums=("SKIP"
            "94fab0d5a9dc2f454528d3bcbb11d4437fcb87390181791d26be9bb51127ca77"
            "ec3bacc6516c8cd091d52edaf9f0e98fc846c95e538faa625e167af7c583dcee")

build() {
    cd "${pkgname}"
    git submodule sync
    git submodule update --init --recursive

    mkdir -p build
    cd build
    cmake ..
    make huestacean
}

package() {
    cd "${srcdir}"

    sed -i "s/REPL_NAME/${pkgname}/g"               "${pkgname}.desktop"
    sed -i "s/REPL_COMMENT/${pkgdesc}/g"            "${pkgname}.desktop"

    install -Dm 755 "${pkgname}/build/${pkgname}"   "${pkgdir}/usr/bin/${pkgname}"
    install -Dm 644 "${pkgname}.desktop"            "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm 644 "${pkgname}.png"                "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}