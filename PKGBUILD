# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=easyedit-bin
_pkgname=EasyEdit
pkgver=1.3.6
_electronversion=33
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
prodives=("${pkgname%-bin}=${pkgver}")
depends=(
    "electron${_electronversion}"
)
source=(
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/gcclinux/EasyEdit/${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
#source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${url}/releases/download/${pkgver}/${_pkgname}-${pkgver}-arm64.deb")
#source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.deb::${url}/releases/download/${pkgver}/${_pkgname}-${pkgver}-armv7l.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${url}/releases/download/${pkgver}/${_pkgname}-${pkgver}-amd64.deb")
sha256sums=('71385eb5d7dd9bd556196b805ff27e72710a85f9c31c230eb503b6d68de91596'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
sha256sums_x86_64=('88bace2c9146de14079739b3bb866d32b7197923860a671820eec0623a9b79c0')
prepare() {
    sed -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed -i "s/\/opt\/${_pkgname}\/${pkgname%-bin}/${pkgname%-bin}/g" "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/"{app.asar,"${pkgname%-bin}.png"} -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/512x512/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/usr/share/metainfo/${pkgname%-bin}.appdata.xml" -t "${pkgdir}/usr/share/metainfo"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}