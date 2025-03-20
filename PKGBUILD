# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=clipharbor-bin
_pkgname=ClipHarbor
pkgver=0.3.2
_electronversion=35
pkgrel=1
pkgdesc="A powerful clipboard management application, helps you efficiently manage your clipboard history with ease and style. (Prebuilt version.Use system-wide electron)"
arch=(
    'x86_64'
)
url="https://github.com/yurentle/ClipHarbor"
license=('MIT')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    "electron${_electronversion}"
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${_pkgname}_0.3.1_amd64.deb"
    "LICENSE-${pkgver}.md::https://raw.githubusercontent.com/yurentle/ClipHarbor/v${pkgver}/README_EN.md"
    "${pkgname%-bin}.sh"
)
sha256sums=('5f8b0ae38b7c676dc79212282d0165cd148eb3105ad5b05cd3477431b3e23c1c'
            '76d3588ba775a16e309e5d7aa38e6eaf0d12ded8bd1b31ff28f66bf6b221da65'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${pkgname%-bin}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed -i "s/\/opt\/${_pkgname}\/${pkgname%-bin}/${pkgname%-bin}/g" "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/icons/logo_tray_Template.png" -t "${pkgdir}/usr/lib/${pkgname%-bin}/icons"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/512x512/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}