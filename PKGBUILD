# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=slack-on-keys-bin
pkgver=1.1.2
_electronversion=24
pkgrel=4
pkgdesc="Control your Slack from any app window with keyboard shortcuts ⚡ Set up custom keyboard shortcuts for various Slack actions"
arch=('x86_64')
url="https://github.com/yakshaG/slack-on-keys"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}-bin"
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/yakshaG/slack-on-keys/main/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('4c491c4d8a3ebe49089463265d80ca5b46e74dc1e802f0466940b1f194f14525'
            'f95d9068a4ccb1cbc8bad397f046494b5e2d6546fd6be7546edd5c26765cd956'
            'dc0c5ca385ad81a08315a91655c7c064b5bf110eada55e61265633ae198b39f8')
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app.asar|g" \
        -e "s|@options@||g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/lib/${pkgname%-bin}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
}