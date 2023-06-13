# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="wai-chat-desktop-bin"
_appname="Wai Chat"
pkgver=1.1.2
pkgrel=2
pkgdesc="An electron project for chatgpt wai chat bot"
arch=('any')
url="https://github.com/ptp-build/wai-chat-desktop"
license=('custom')
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-appimage")
depends=('nspr' 'glib2' 'hicolor-icon-theme' 'libxrandr' 'expat' 'glibc' 'libxdamage' 'libdrm' 'gtk3' 'pango' 'alsa-lib' 'at-spi2-core' \
    'libxkbcommon' 'libx11' 'gcc-libs' 'nss' 'libxfixes' 'libcups' 'libxcomposite' 'mesa' 'libxcb' 'cairo' 'libxext' 'dbus')
makedepends=('npm' 'gendesk')
source=("${pkgname%-bin}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('7f69542f9d0fccf9e2cd26ed495580731fbc9a45658576ab8c65a9c0537c89ab')
build() {
    cd "${srcdir}/${pkgname%-bin}-${pkgver}"
    npm install && npm run package
}
package() {
    install -Dm755 -d "${pkgdir}/opt/${pkgname%-bin}"
    cp -r "${srcdir}/${pkgname%-bin}-${pkgver}/out/${_appname}-linux-x64/"* "${pkgdir}/opt/${pkgname%-bin}"
    for _icons in 256x256 512x512;do
        install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}/src/icons/favicon.${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${pkgdir}/opt/${pkgname%-bin}/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
    gendesk -f -n --icon "${pkgname%-bin}" --categories "Utility" --name "${_appname}" --exec "\"/opt/${pkgname%-bin}/${_appname}\" %U"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}