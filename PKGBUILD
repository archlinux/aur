# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=dida
pkgname="${_pkgname}365-bin"
pkgver=6.0.0
_electronversion=21
pkgrel=1
pkgdesc='Todo list, checklist and task manager app, Linux desktop application.Use system-wide electron.'
arch=(
    'aarch64'
    'x86_64'
)
url='https://www.dida365.com'
license=('LicenseRef-custom')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=(
    "${_pkgname}"
    "${pkgname%-bin}"
)
depends=(
    "electron${_electronversion}"
)
source=(
    "LICENSE-opensource.html::${url}/license/web"
    "LICENSE-custom.html::${url}/about/tos"
    "${pkgname%-bin}.sh"
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::https://cdn.dida365.cn/download/linux/linux_deb_arm64/${_pkgname}-${pkgver}-arm64.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::https://cdn.dida365.cn/download/linux/linux_deb_x64/${_pkgname}-${pkgver}-amd64.deb")
sha256sums=('e8a332db3efa4a52a10bcaaa2ff75cfdead789a58bc17a8f75121bee69979e10'
            'cf6b939623f1416a3afae09527aceefb91552fd8ffb30e3498f9d95c043f6396'
            '2b2e8aeed33fd71c521e49fd54fb2fa81218d16aef8bccb88d77909055ab8051')
sha256sums_aarch64=('763291c0b83ecaf7d4288197d0f825bb8b0a012258125943cc1b4e576f2a2bf4')
sha256sums_x86_64=('7d178e16ebd668a1af81fbcf2594031a0217fb1fd163f186f830c977b6e71dae')
build() {
    sed -e "s|@electronversion@|${_electronversion}|g" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app.asar|g" \
        -e "s|@cfgdirname@|${_pkgname}|g" \
        -e "s|@options@||g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed "s|\/opt\/${_pkgname}\/${_pkgname}|${pkgname%-bin}|g;s|Icon=${_pkgname}|Icon=${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    for _icons in 16x16 24x24 32x32 48x48 64x64 128x128 256x256;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${_pkgname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/LICENSE-"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}