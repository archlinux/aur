# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=dida
pkgname="${_pkgname}365-bin"
pkgver=6.0.40
_electronversion=21
pkgrel=1
pkgdesc='Todo list, checklist and task manager app, Linux desktop application.(Prebuilt version.Use system-wide electron)'
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
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.rpm::https://cdn.dida365.cn/download/linux/linux_rpm_arm64/${_pkgname}-${pkgver}-aarch64.rpm")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.rpm::https://cdn.dida365.cn/download/linux/linux_rpm_x64/${_pkgname}-${pkgver}-x86_64.rpm")
sha256sums=('f47b9d990cface0f36b30c9a71534308d84518669d17864e4633a4f515d09985'
            'c626332f19edfccbda060f34a325035c5e320cb59cb5fa00055b21338e84b516'
            'f2fe8c189974ffb9d445e9a42bd4f1d5b60185607c3fcafae79ab44be224e013')
sha256sums_aarch64=('46fd91ac1e67181690e28b76a30b4dac937942256cd3f2ead801952b6a1e1b9f')
sha256sums_x86_64=('40d4889bb99c741ed014e21f0d5b850422b2dcce205c069ab959e834fe2cf7df')
_get_electron_version() {
    _electronversion="$(strings "${srcdir}/opt/${_pkgname}/${_pkgname}" | grep '^Chrome/[0-9.]* Electron/[0-9]' | cut -d'/' -f3 | cut -d'.' -f1)"
    echo -e "The electron version is: \033[1;31m${_electronversion}\033[0m"
}
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@//g
    " "${srcdir}/${pkgname%-bin}.sh"
    _get_electron_version
    sed -i -e "
        s/\/opt\/${_pkgname}\/${_pkgname}/${pkgname%-bin}/g
        s/Icon=${_pkgname}/Icon=${pkgname%-bin}/g
    " "${srcdir}/usr/share/applications/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    _icon_sizes=(16x16 24x24 32x32 48x48 64x64 128x128 256x256)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${_pkgname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/LICENSE-"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}