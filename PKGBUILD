# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=subtitle-translator-electron-bin
pkgver=0.6.1
pkgrel=1
pkgdesc="Translate subtitle using ChatGPT"
arch=('x86_64')
url="https://github.com/gnehs/subtitle-translator-electron"
license=("MIT")
depends=('libxfixes' 'nspr' 'at-spi2-core' 'gcc-libs' 'gtk3' 'libxcb' 'pango' 'dbus' 'glibc' 'libdrm' 'cairo' 'mesa' 'libxrandr' \
    'glib2' 'libxdamage' 'libxext' 'expat' 'libxkbcommon' 'alsa-lib' 'nss' 'libxcomposite' 'libx11' 'libcups')
makedepends=('npm' 'gendesk')
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-appimage" "${pkgname%-electron-bin}" "${pkgname%-electron-bin}-appimage")
source=("${pkgname%-bin}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('065933c972aa4a1dc7f37ffb4c86b57fb76d4bef49c1cfe97f1911c50882ea4d')
build() {
    cd "${srcdir}/${pkgname%-bin}-${pkgver}"
    npm install
    npm run build -l
}
package() {
    install -Dm755 -d "${pkgdir}/opt/${pkgname%-bin}"
    cp -r "${srcdir}/${pkgname%-bin}-${pkgver}/release/linux-unpacked/"* "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}/build/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    gendesk -f -n --icon "${pkgname%-bin}" --categories "Utility" --name "Subtitle Translator" --exec "/opt/${pkgname%-bin}/${pkgname%-bin} %U"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}