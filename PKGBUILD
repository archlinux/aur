# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=panfu-desktop-bin
_pkgname='Panfu Desktop'
pkgver=1.5.0
_electronversion=11
pkgrel=1
pkgdesc="The desktop application for Panfu with integrated Flash Player.(Prebuilt version.Use system-wide electron)"
arch=(
    'i686'
    'x86_64'
)
url="https://www.panfu.us/download"
_ghurl="https://github.com/teampanfu/panfu-desktop"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
)
source=(
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/teampanfu/panfu-desktop/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
source_i686=("${pkgname%-bin}-${pkgver}-i686.deb::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_i386.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb")
sha256sums=('e083aaccba0d6eb7cb8a68345e52193d5f3c79561a7601c7cba2a7fa76054507'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
sha256sums_i686=('9aafa640634cc12586c4e489635121706c522c4973398f9e9fb73f356dbcff7e')
sha256sums_x86_64=('084007087a21de616ba3a56f3e200228cfdf9fd7dc2cc4731c1b1c78d99f07e8')
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${pkgname%-bin}/g
        s/@options@//g
    " "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed -i "s/\/opt\/${_pkgname}\///g" "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/app"* -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/plugins/libpepflashplayer.so" -t "${pkgdir}/usr/lib/${pkgname%-bin}/plugins"
    install -Dm644 "${srcdir}/opt/${_pkgname}/swiftshader/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/swiftshader"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    _icon_sizes=(16x16 32x32 48x48 64x64 128x128 256x256)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}