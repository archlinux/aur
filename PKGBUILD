# Maintainer: Bruno Pagani <archange@archlinux.org>

pkgname=cozy-desktop
pkgver=3.13.3
pkgrel=1
pkgdesc="File synchronisation for Cozy Cloud on Desktop"
arch=(any)
url="https://cozy-labs.github.io/cozy-desktop/"
license=(AGPL3)
depends=(electron2)
makedepends=(nodejs-lts-carbon yarn git node-gyp python2)
source=(${pkgname}-${pkgver}.tar.gz::"https://github.com/cozy-labs/${pkgname}/archive/v${pkgver}.tar.gz"
        "${pkgname}.desktop"
        "${pkgname}.sh"
        icons.tar.xz)
sha256sums=('968b178c570e44270c9c04225736f07e4dea2be91ea7d1542779b2156874b946'
            'df0935e38d99c506b622d99d85179ec4612140d78fcd8c73103cb89c4f58ebab'
            '6c2df91fca75903c1e518eab56ba9cddfd3e7af6d4433207d9861ce22338f677'
            '69631fcd5f2334deffd3a5e2708cd06801fd9c22f1ebd2892c2d829dc33adf97')

prepare() {
    cd ${pkgname}-${pkgver}
    yarn install
}

build() {
    cd ${pkgname}-${pkgver}
    yarn build
}

package() {
    cd ${pkgname}-${pkgver}
    yarn dist --dir

    install -dm755 "${pkgdir}"/usr/lib/${pkgname}
    cp -r dist/linux-unpacked/resources "${pkgdir}"/usr/lib/${pkgname}/

    rm "${pkgdir}"/usr/lib/cozy-desktop/resources/app.asar.unpacked/gui/scripts/macos-add-favorite.py
    rmdir "${pkgdir}"/usr/lib/cozy-desktop/resources/app.asar.unpacked/gui/{scripts/,}

    cd "${srcdir}"
    install -dm755 "${pkgdir}"/usr/share/icons/
    cp -r hicolor "${pkgdir}"/usr/share/icons/

    install -Dm755 ${pkgname}.sh "${pkgdir}"/usr/bin/${pkgname}
    install -Dm644 ${pkgname}.desktop "${pkgdir}"/usr/share/applications/${pkgname}.desktop
}
