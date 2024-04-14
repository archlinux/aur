# Maintainer: sukanka <su975853527 at gmail dot com>

pkgname=iauto
pkgver=3.7.1
pkgrel=1
pkgdesc="Flowchart diagrams drawer"
arch=('x86_64')
url="https://www.iautodraw.com"
license=('unknown')
depends=(electron13)
makedepends=(p7zip gendesk)
source=("${pkgname}-${pkgver}.exe::${url}/static/version/IAuto%20Setup%20${pkgver}(win%2064).exe")
sha512sums=('158da6104f5b10c4e5fc627bf2923b78084e5a4748d43dc3e1c8e9a0125465173cb504d343dd5483a8219e589d39d6257ef5c524f280b26947eec24c68dc2cfd')

prepare() {
    cd $srcdir
    7z e ${pkgname}-${pkgver}.exe -aoa
    7z x app-64.7z resources/ -aoa

    #     mv resources/app.asar ${pkgname}.asar

    # it will not run without this, don't know why
    asar extract resources/app.asar build/
    asar pack build ${pkgname}.asar
}

package() {
    cd $srcdir/
    for res in {256x256,512-512}; do
        install -Dm644 build/dist/electron/static/image/icons/${res}.png \
            ${pkgdir}/usr/share/icons/hicolor/${res:0:3}x${res:0:3}/apps/${pkgname}.png
    done

    gendesk -f --pkgname "$pkgname" --pkgdesc "IAuto(IA) 流程可视化" --icon "${pkgname}" --categories "Utility;" --name "${pkgname}" --exec "${pkgname}"

    install -Dm644 ${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop

    mkdir -p ${pkgdir}/usr/share/${pkgname}
    mv ${pkgname}.asar ${pkgdir}/usr/share/${pkgname}/

    # link executable
    mkdir -p ${pkgdir}/usr/bin/
    echo """#!/usr/bin/bash
electron13 /usr/share/${pkgname}/${pkgname}.asar "\$@"
""" >${pkgdir}/usr/bin/${pkgname}
    chmod a+x ${pkgdir}/usr/bin/${pkgname}

}
# vim: ts=2 sw=2 et:
