# Maintainer: sukanka <su975853527 at gmail dot com>

pkgname=iauto
pkgver=3.7.5
pkgrel=1
pkgdesc="Flowchart diagrams drawer"
arch=('x86_64')
url="https://www.iautodraw.com"
license=('unknown')
depends=(electron13)
makedepends=(p7zip gendesk)
source=("${pkgname}-${pkgver}.exe::${url}/static/version/IAuto%20Setup%20${pkgver}(win%2064).exe")
sha512sums=('7d1606cc4c52808cf91b3a3d5debd18d3d15967ec9b6fcdfb803d12afe1974609950d1f3e732ff7bc986d5ea6c8fe9db29af8d36ef9b679555c1ea35ece405a4')

prepare() {
    cd $srcdir
    7z e ${pkgname}-${pkgver}.exe -aoa
    7z x app-64.7z resources/ -aoa
    echo """#!/usr/bin/bash
electron13 /usr/share/${pkgname}/${pkgname}.asar "\$@"
""" >${pkgname}.sh
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

    install -Dm644 ${pkgname}.asar -t ${pkgdir}/usr/share/${pkgname}/

    # link executable
    install -Dm755 ${pkgname}.sh ${pkgdir}/usr/bin/${pkgname}
}
# vim: ts=2 sw=2 et:
