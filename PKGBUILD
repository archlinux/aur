# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=easyedit-bin
_pkgname=EasyEdit
pkgver=1.3.8
_electronversion=38
pkgrel=1
pkgdesc="An easy markdown editor that allows you to write MarkDown (MD) and preview it in real-time. You can save, load .md files and export to PDF.(Prebuilt version.Use system-wide electron)"
arch=(
    #'aarch64'
    #'armv7h'
    'x86_64'
)
url="https://github.com/gcclinux/EasyEdit"
license=('MIT')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    "electron${_electronversion}"
)
source=(
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/gcclinux/EasyEdit/${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
#source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.rpm::${url}/releases/download/${pkgver}/${_pkgname}-${pkgver}-aarch64.rpm")
#source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.rpm::${url}/releases/download/${pkgver}/${_pkgname}-${pkgver}-armv7l.rpm")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${url}/releases/download/${pkgver}/${_pkgname}-${pkgver}-amd64.deb")
sha256sums=('71385eb5d7dd9bd556196b805ff27e72710a85f9c31c230eb503b6d68de91596'
            '31ad33b633744f5361abd964be306cea53ae1050e760c787115f7eca60045ae6')
sha256sums_x86_64=('ce24d7966b0792c4289aba2cf19b3d0baa42550916fa736b6a4ecfc115650329')
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
    sed -i "s/\/opt\/${_pkgname}\///g" "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/"{app.asar,"${pkgname%-bin}.png"} -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/512x512/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}