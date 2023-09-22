# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=webeep-sync-bin
_appname=webeep-sync
pkgver=1.0.3
pkgrel=1
pkgdesc="Keep all your WeBeep files synced on your computer!"
arch=('x86_64')
url="https://github.com/toto04/webeep-sync"
license=('GPL3')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron22' 'hicolor-icon-theme')
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}-debian.deb"
    "${pkgname%-bin}.sh")
sha256sums=('8e77681185c6795fbfbf038a5cde95f78c2aadf19108804fb1a4d64c6d2c615a'
            'a4cf086da3983c0bd3ea36788e575c9dc6dd9dc04ff9a9ac94a2c4d45a171206')
build() {
    bsdtar -xf "${srcdir}/data.tar.zst"
    sed "s| %U||g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    asar p "${srcdir}/usr/lib/${pkgname%-bin}/resources/app" "${srcdir}/app.asar"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/app.asar" -t "${pkgdir}/opt/${pkgname%-bin}/resources"
    for _icons in 32x32 48x48 64x64 96x96 128x128 256x256;do
      install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
        -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}
