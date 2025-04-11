# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Toadtoad
pkgname=joindesktop-bin
_pkgname=com.joaomgcd.join
_appname='Join Desktop'
pkgver=1.1.3
_electronversion=9
pkgrel=2
pkgdesc='An official desktop app for Join by Joaoapps built in Electron.(Prebuilt version.Use system-wide electron)'
arch=('x86_64')
url="https://joaoapps.com/join/desktop/"
_ghurl="https://github.com/joaomgcd/JoinDesktop"
license=('LicenseRef-unknown')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb"
    "${pkgname%-bin}.sh"
)
sha256sums=('2b017608c8e634484f63f732556abe4e13b23f995f78a413cf564816f961c4aa'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_appname}/g
        s/@options@//g
    " "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed -i "
        s/\"\/opt\/${_appname}\/${_pkgname}\"/${pkgname%-bin}/g
        s/Icon=${_pkgname}/Icon=${pkgname%-bin}/g
    " "${srcdir}/usr/share/applications/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_appname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/opt/${_appname}/resources/app.asar.unpacked" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_appname}/swiftshader/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/swiftshader"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/0x0/apps/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/opt/${_appname}/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}