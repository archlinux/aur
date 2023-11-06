# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=tailchat-desktop
pkgver=1.9.4
pkgrel=1
pkgdesc="Next generation noIM application in your own workspace, not only another Slack/Discord/Rocket.chat"
arch=('any')
url="https://tailchat.msgbyte.com/"
_githuburl="https://github.com/msgbyte/tailchat"
license=('Apache')
conflicts=("${pkgname}")
depends=(
    'bash'
    'electron18'
    'libxcb'
)
makedepends=(
    'gendesk'
    'npm>=8.19.4'
    'nodejs>=16.20.2'
    'yarn'
)
source=(
    "${pkgname}-${pkgver}.zip::${_githuburl}/archive/refs/tags/v${pkgver}.zip"
    "${pkgname}.sh"
)
sha256sums=('174c5b71b92de7362fdd27a9a8c592345451055104b7114bb985376b7a99dbe6'
            'dfec8c4393216de0affcb58c679055af1d97ae9e530564a37d7bfe922fcefa2c')
build() {
    gendesk -q -f -n --categories "Network" --name "${pkgname}" --exec "${pkgname} --no-sandbox %U"
    cd "${srcdir}/${pkgname%-desktop}-${pkgver}/client/desktop"
    yarn
    yarn build
    yarn electron-builder --linux
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname%-desktop}-${pkgver}/client/desktop/release/build/linux-unpacked/resources/app.asar" \
        -t "${pkgdir}/usr/lib/${pkgname}"
    cp -r "${srcdir}/${pkgname%-desktop}-${pkgver}/client/desktop/release/build/linux-unpacked/resources/"{app.asar.unpacked,assets} \
        "${pkgdir}/usr/lib/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname%-desktop}-${pkgver}/client/desktop/release/build/linux-unpacked/swiftshader/"* \
        -t "${pkgdir}/usr/lib/${pkgname}/swiftshader"
    install -Dm644 "${srcdir}/${pkgname%-desktop}-${pkgver}/client/desktop/assets/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname%-desktop}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}