# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=geforce-infinity-bin
_pkgname=GeForceInfinity
pkgver=1.1.2
_electronversion=37
pkgrel=1
pkgdesc="A work-in-progress application designed to enhance the GeForce NOW experience.(Prebuilt version.Use system-wide electron)"
arch=('x86_64')
url="https://geforce-infinity.xyz/"
_ghurl="https://github.com/AstralVixen/GeForce-Infinity"
license=('MIT')
conflicts=("${pkgname%-bin}")
prodives=("${pkgname%-bin}=${pkgver}")
depends=(
    "electron${_electronversion}"
)
options=(
    '!emptydirs'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/${pkgver}/${_pkgname}-linux-${pkgver}-amd64.deb"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/AstralVixen/GeForce-Infinity/${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('09536cb6a66f13ce4e1875ce51516a83ce59a7a305824daa2b553feb73751508'
            '669b46a31342a99549197ed97fac42000bbfe178114b2d6843aa08f6902b11a1'
            'f2fe8c189974ffb9d445e9a42bd4f1d5b60185607c3fcafae79ab44be224e013')
_get_electron_version() {
    _electronversion="$(strings "${srcdir}/opt/${_pkgname}/${pkgname%-bin}" | grep '^Chrome/[0-9.]* Electron/[0-9]' | cut -d'/' -f3 | cut -d'.' -f1)"
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
    bsdtar -xf "${srcdir}/data."*
    _get_electron_version
    sed -i -e "
        s/\/opt\/${_pkgname}\///g
        s/\/opt\/${_pkgname}\/resources\/infinitylogo\.ico/${pkgname%-bin}/g
    " "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/opt/${_pkgname}/resources/"* "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/500x500/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
