# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=hugin-messenger-bin
_pkgname='Hugin Messenger'
pkgver=1.1.1
_electronversion=30
pkgrel=1
pkgdesc="The new version of the private messaging desktop application powered by the Kryptokrona Blockchain.(Prebuilt version.Use system-wide electron)"
arch=('x86_64')
url="https://hugin.chat/"
_ghurl="https://github.com/kryptokrona/hugin-desktop"
license=('GPL-3.0-only')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    "electron${_electronversion}"
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "${pkgname%-bin}.sh"
)
sha256sums=('9f93d62c0c177648096c156c7b242a06fb33596f6637ab1293ff195804f25ba1'
            '31ad33b633744f5361abd964be306cea53ae1050e760c787115f7eca60045ae6')
_get_electron_version() {
    _elec_ver="$(strings "${srcdir}/opt/${_pkgname}/${pkgname%-bin}" | grep '^Chrome/[0-9.]* Electron/[0-9]' | cut -d'/' -f3 | cut -d'.' -f1)"
    echo -e "The electron version is: \033[1;31m${_elec_ver}\033[0m"
}
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    _get_electron_version
    sed -i -e "
        s/\"\/opt\/${_pkgname}\/${pkgname%-bin}\"/${pkgname%-bin}/g
        s/Utility/Network/g
    " "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    find "${srcdir}/opt/${_pkgname}/resources" -type d \( -name "*arm*" -o -name "linux-ia32" \) -exec rm -rf {} +
    ln -sf "/usr/bin/python" "${srcdir}/opt/${_pkgname}/resources/app.asar.unpacked/node_modules/usb/build/node_gyp_bins/python3"
    rm -rf "${srcdir}/opt/${_pkgname}/resources/app.asar.unpacked/node_modules/usb/prebuilds/"win32-*
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/opt/${_pkgname}/resources/"{app.asar.unpacked,bin} "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}
