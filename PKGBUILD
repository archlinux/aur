# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# CO-Maintainer: HentaiShiroYuki <hentaishiroyuki at gmail dot com>
# Contributor: Sofia Lima
pkgname=vencord-desktop-bin
_appname=vencorddesktop
_pkgname=Vesktop
_assetname=VencordDesktop
pkgver=0.3.3
pkgrel=1
pkgdesc="A cross platform electron-based desktop app aiming to give you a snappier Discord experience with Vencord pre-installed"
arch=('x86_64')
url="https://github.com/Vencord/Vesktop"
license=('GPL3')
depends=('bash' 'electron25' 'hicolor-icon-theme')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${_assetname}_${pkgver}_amd64.deb"
    "${pkgname%-bin}.sh")
sha256sums=('9dafe672987d16499488b9294cc8e5d0435ba4937522f142f9e5d54d2a653fc8'
            'e5584dfcc4e47d4001b77da837a9171e13b956a99cb0e98f1309c4a25dceeabb')
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