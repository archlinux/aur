# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=jm-desktop-bin
pkgver=2.0.0
_electronversion=37
pkgrel=1
pkgdesc="A jm comic desktop app by react + electron.(Prebuilt version).一个禁漫的第三方客户端"
arch=('x86_64')
url="https://github.com/Dedicatus546/jm-desktop"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'gendesk'
    'asar'
)
source=(
    "${pkgname%-bin}-${pkgver}.zip::${url}/releases/download/v${pkgver}/${pkgname%-bin}-Linux-${pkgver}.zip"
    #"${pkgname%-bin}-${pkgver}.png::https://raw.githubusercontent.com/Dedicatus546/jm-desktop/v${pkgver}/public/png/512x512.png"
    "${pkgname%-bin}.sh"
)
sha256sums=('de9d9b16c958769b03c48bb15380af72a4bb51c92d6fb763657828f9627deb7d'
            'f2fe8c189974ffb9d445e9a42bd4f1d5b60185607c3fcafae79ab44be224e013')
_get_electron_version() {
    _electronversion="$(strings "${srcdir}/${pkgname%-bin}" | grep '^Chrome/[0-9.]* Electron/[0-9]' | cut -d'/' -f3 | cut -d'.' -f1)"
    echo -e "The electron version is: \033[1;31m${_electronversion}\033[0m"
}
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${pkgname%-bin}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname%-bin}.sh"
    _get_electron_version
    gendesk -q -f -n \
        --pkgname="${pkgname%-bin}" \
        --pkgdesc="${pkgdesc}" \
        --categories="AudioVideo" \
        --name="${pkgname%-bin}" \
        --exec="${pkgname%-bin} %U"
    asar e "${srcdir}/resources/app.asar" "${srcdir}/app.asar.unpacked"
    sed -i "s/pi.getPath(\"exe\")/\'\/usr\/lib\/${pkgname%-bin}\/${pkgname%-bin}\'/g" "${srcdir}/app.asar.unpacked/dist-electron/main.js"
    asar p  "${srcdir}/app.asar.unpacked"  "${srcdir}/app.asar"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/resources/app.asar.unpacked" "${pkgdir}/usr/lib/${pkgname%-bin}"
    _icon_sizes=(16x16 32x32 48x48 64x64 128x128 256x256 512x512)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/app.asar.unpacked/dist/png/${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}/data"
    chown -R "${USER}:${USED}" "${pkgdir}/usr/lib/${pkgname%-bin}/data"
}
