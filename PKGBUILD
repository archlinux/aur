# Maintainer: Eugene Hwang <hwang dot eug @ gee-mail dot com>

_appname=TickTick
_pkgname=ticktick
pkgname=ticktick-nativefier
pkgver=2020.04.09
pkgrel=1
pkgdesc='Todo list, checklist, and task manager app'
arch=('any')
url='https://www.ticktick.com'
license=('MIT')
depends=('electron')
makedepends=('nodejs-nativefier' 'imagemagick')
source=("${pkgname}.png"
        "${pkgname}.desktop")
sha256sums=('c0153332b79acd7dc2d4891b123ec2d8fef2f6fdcf4d7ee40b0587371806d63b'
            '7d8791f3efc06feb1cb464c3fb7845d5cc143ef60c6223f3f318c632e538d5ab')

build() {
    cd "${srcdir}"

    nativefier \
        --name "${_appname}" \
        --icon "${pkgname}.png" \
        --single-instance \
        --tray \
        --verbose \
        https://www.ticktick.com
}

package() {
    install -dm755 "${pkgdir}/"{opt,usr/{bin,share/applications}}

    cp -rL "${srcdir}/${_appname}-linux-"* "${pkgdir}/opt/${_pkgname}"
    cp -L "${srcdir}/${pkgname}.png" "${pkgdir}/opt/${_pkgname}/resources/app/icon.png"
    ln -sf "/opt/${_pkgname}/TickTick" "${pkgdir}/usr/bin/${_pkgname}"

    install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    for _size in "192x192" "128x128" "96x96" "64x64" "48x48" "32x32" "24x24" "22x22" "20x20" "16x16" "8x8"
    do
        install -dm755 "${pkgdir}/usr/share/icons/hicolor/${_size}/apps"
        convert "${srcdir}/${pkgname}.png" -resize "${_size}" "${pkgdir}/usr/share/icons/hicolor/${_size}/apps/${_pkgname}.png"
    done
    install -Dm644 "${srcdir}/${pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/0x0/apps/${_pkgname}.png"
}
