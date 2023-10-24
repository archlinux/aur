# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# CO-Maintainer: HentaiShiroYuki <hentaishiroyuki at gmail dot com>
# Contributor: Sofia Lima
pkgname=vencord-desktop-bin
_appname=vencorddesktop
_pkgname=Vesktop
_assetname=VencordDesktop
pkgver=0.4.0
pkgrel=1
pkgdesc="A cross platform electron-based desktop app aiming to give you a snappier Discord experience with Vencord pre-installed"
arch=('x86_64')
url="https://github.com/Vencord/Vesktop"
license=('GPL3')
depends=('bash' 'electron27' 'hicolor-icon-theme')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${_assetname}_${pkgver}_amd64.deb"
    "${pkgname%-bin}.sh")
sha256sums=('7dab64d24b664c0e280e6a4a5250a059885d9e4b8e88da310266eec9fdc7739a'
            'a8d790301249bf3a11217dd297354b3b59223609616ff7906cdfbb1bd20c7339')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|/opt/${_pkgname}/${_appname} %U|${pkgname%-bin}|g;s|Icon=${_appname}|Icon=${pkgname%-bin}|g" \
        -i "${srcdir}/usr/share/applications/${_appname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/app.asar" -t "${pkgdir}/opt/${pkgname%-bin}/resources"
    install -Dm644 "${srcdir}/usr/share/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${_appname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
}