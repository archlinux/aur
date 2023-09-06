# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=unsplash-wallpapers-bin
_pkgname="Unsplash Wallpapers"
pkgver=1.3.0
pkgrel=1
pkgdesc="A cross-platform desktop application to set wallpapers from Unsplash built with Electron, React, and Redux"
arch=("x86_64")
url="https://github.com/soroushchehresa/unsplash-wallpapers"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron8' 'hicolor-icon-theme')
makedepends=('asar')
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "LICENSE::https://raw.githubusercontent.com/soroushchehresa/unsplash-wallpapers/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh")
sha256sums=('3f6cb08f195d765c65c1858f74815afba5284a7aba9b2a96dd248e09582e148a'
            'e7ee68282295100c6be4565152cb535d43086d2354760a8f006f1e980e0a3bb5'
            'e464eb589827f6ba1b4a83b2f32b924c0e977f245cc0cc3a3e1fde3f38544f82')
prepare() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    asar extract "${srcdir}/opt/${_pkgname}/resources/app.asar" "${srcdir}/app.asar.unpacked"
    cp -r "${srcdir}/opt/${_pkgname}/resources/app.asar.unpacked" "${srcdir}"
    asar pack "${srcdir}/app.asar.unpacked" "${srcdir}/${pkgname%-bin}.asar"
    sed "s|\"/opt/${_pkgname}/${pkgname%-bin}\" %U|${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}   
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.asar" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    for icons in 16x16 24x24 32x32 48x48 64x64 96x96 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${icons}/apps"
    done
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}