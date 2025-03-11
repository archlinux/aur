# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=copyman-bin
_pkgname=Copyman
pkgver=0.3.4
_electronversion=34
pkgrel=1
pkgdesc="An Electron application for copying files and folders to multiple destinations while preserving the path.(Prebuilt version.Use system-wide electron)"
arch=('x86_64')
url="http://www.atlantide-design.it/copyman"
_ghurl="https://github.com/atlantidezign/copyman"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/v${pkgver}/${_pkgname}_v${pkgver}_amd64.deb"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/atlantidezign/copyman/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('bb6609eaee44f3b6845d712a698db3bcf727a5d80e6a8de91b3ff93aa64b18a3'
            '878afda6d7ba23c9fe1b0e57d74b1e19a3d7b6f6a5c94fc32e8628e83f6f6d7a'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed -i "s/\/opt\/${_pkgname}\/${pkgname%-bin}/${pkgname%-bin}/g" "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/1024x1024/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}