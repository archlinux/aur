# Maintainer: sukanka <su975853527 at gmail dot com>

pkgname=iauto
pkgver=3.7.6
pkgrel=1
pkgdesc="Flowchart diagrams drawer"
arch=('x86_64')
url="https://www.iautodraw.com"
_electron=electron25
license=('unknown')
depends=(${_electron})
makedepends=(p7zip gendesk)
source=("${pkgname}-${pkgver}.exe::${url}/static/version/IAuto%20Setup%20${pkgver}(win%2064).exe")
sha512sums=('f10d78741f5504182d3cce5cc12d7cf4a41b77dc97e6f3fc5a1f0838409d636b003ef826797539e4585bd86dc8a47f4a02188baba6a5b893ec9edc973bd37e7b')

prepare() {
    cd $srcdir
    7z e ${pkgname}-${pkgver}.exe -aoa
    7z x app-64.7z resources/ -aoa
    echo """#!/usr/bin/bash
${_electron} /usr/share/${pkgname}/${pkgname}.asar "\$@"
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
