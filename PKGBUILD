# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=geforcenow-electron-bin
_pkgname="com.github.hmlendea.${pkgname%-bin}"
_appname='GeForce NOW'
pkgver=2.2.0
_electronversion=35
pkgrel=1
pkgdesc="Linux Desktop client for Nvidia's GeForce NOW game streaming service.(Prebuilt version.Use system-wide electron)"
arch=('x86_64')
url="https://github.com/hmlendea/gfn-electron"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
    'nodejs'
)
source=(
    "${pkgname%-bin}-${pkgver}.zip::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux.zip"
    "${pkgname%-bin}.sh"
)
sha256sums=('ec62644e6f94eb4919c0895f73736b2074686c829144506162be38074ef1da2a'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app/g
        s/@cfgdirname@/${_appname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname%-bin}.sh"
    sed -i -e "
        s/\/opt\/${pkgname%-bin}\///g
        s/nvidia/${pkgname%-bin}/g
    " "${srcdir}/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/resources/app" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/resources/app/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}