# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=p3x-onenote-bin
_pkgname=P3X-OneNote
pkgver=2024.10.121
_electronversion=33
pkgrel=1
pkgdesc="Linux Electron Onenote - A Linux compatible version of OneNote.(Prebuilt version.Use system-wide electron)"
arch=(
    'aarch64'
    'armv7h'
    'x86_64'
)
url="https://www.corifeus.com/onenote/"
_ghurl="https://github.com/patrikx3/onenote"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.rpm::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}.aarch64.rpm")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.rpm::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}.armv7l.rpm")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.rpm::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}.x86_64.rpm")
source=(
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/patrikx3/onenote/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('1847e0e0698142ed4347c1441a9fa81c8fbddd44b1d8bbcd5e3647f991759d7f'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
sha256sums_aarch64=('c207d7f02b2e7799983bcef40ba54906ab2b49543d4a02178dad531ddf79b712')
sha256sums_armv7h=('522bd415c3c8b8837607cb41a235e0b36287dcb9871582fbf0d6d5b4e6734205')
sha256sums_x86_64=('16a6d475643fc5649a0abfb53cb6c9fbe7ae0184b901a1b3cb046e5eaa49d8c0')
prepare() {
    sed -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${pkgname%-bin}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " -i "${srcdir}/${pkgname%-bin}.sh"
    sed -i "s/\/opt\/${_pkgname}\/${pkgname%-bin}/${pkgname%-bin}/g" "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    _icon_sizes=(128x128 256x256 512x512)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
