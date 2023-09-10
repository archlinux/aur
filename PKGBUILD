# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=gmail-desktop-bin
_appname="Gmail Desktop"
pkgver=3.0.0_alpha.37
pkgrel=4
pkgdesc="Nifty Gmail desktop app (unofficial)"
arch=('x86_64')
url="https://github.com/timche/gmail-desktop"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron23' 'hicolor-icon-theme')
makedepends=('asar')
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver//_/-}/${pkgname%-bin}-${pkgver//_/-}-linux.deb"
    "LICENSE::https://raw.githubusercontent.com/timche/gmail-desktop/v${pkgver//_/-}/LICENSE"
    "${pkgname%-bin}.sh")
sha256sums=('aa125803e43bd295154e3d0fa9def4fe3a89d1f312b15e2989aa3a25b1a49861'
            '056c7c1e5bf66eba0167d966d192c743f6b66ed854011c9b6dac04f959f8f5b5'
            '492cbaf77a754639fcd6f2adffa2287b59f44bab5f76336cb3d1307e60ec6ba0')
prepare() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    asar e "${srcdir}/opt/${_appname}/resources/app.asar" "${srcdir}/app.asar.unpacked"
    cp -r "${srcdir}/opt/${_appname}/resources/app.asar.unpacked" "${srcdir}"
    asar p "${srcdir}/app.asar.unpacked" "${srcdir}/${pkgname%-bin}.asar"
    sed "s|\"/opt/${_appname}/${pkgname%-bin}\" %U|${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.asar" -t "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" "${pkgdir}/usr/share/applications"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}