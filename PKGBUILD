# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=odoo-manager-bin
_pkgname='Odoo Manager'
pkgver=1.1.0
_electronversion=35
pkgrel=1
pkgdesc="Professional Odoo instance management tool for Docker environments.(Prebuilt version.Use system-wide electron)"
arch=('x86_64')
url="https://odoo.webgraphix.online/"
_ghurl="https://github.com/danielmederos2424/odoo-manager"
license=('LicenseRef-PROPRIETARY')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    "electron${_electronversion}"
    'docker'
)
options=(
    '!emptydirs'
)
source=(
    "${pkgname%-bin}-${pkgver}.pacman::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-linux.pacman"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/danielmederos2424/odoo-manager/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('a25428db5a58d2172512698b6fa5dd65681f3e9dd9c443694e447eff0431493e'
            'e77afd5054b99ecd770f3a0e1c059f9ed6381fca0630392ba5e66bbe1ac50d4d'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${pkgname%-bin}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname%-bin}.sh"
    sed -i "s/\"\/opt\/${_pkgname}\/${pkgname%-bin}\"/${pkgname%-bin}/g" "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    _icon_sizes=(16x16 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}