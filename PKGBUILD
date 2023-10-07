# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=mockoon
pkgver=5.0.0
pkgrel=1
pkgdesc="The easiest and quickest way to run mock APIs locally. No remote deployment, no account required, open source."
arch=('any')
url="https://mockoon.com/"
_githuburl="https://github.com/mockoon/mockoon"
license=('MIT')
conflicts=("${pkgname}")
depends=('bash' 'electron26' 'hicolor-icon-theme')
makedepends=('gendesk' 'asar' 'npm')
source=("${pkgname}-${pkgver}.tar.gz::${_githuburl}/archive/refs/tags/v${pkgver}.tar.gz"
    "${pkgname}.sh")
sha256sums=('628abefb9dcfe0fe34d7796bbf638d242e1ab6dd65ad39cade7ed9afff919636'
            'a7bec56b5400cf77c6e9ea912e447ce07f673990c034487faa9c8be069f27ca7')
prepare() {
    gendesk -q -f -n --categories "Development" --name "${pkgname}" --exec "${pkgname}"
}
build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    npm run bootstrap
    npm run build:libs
    npm run build:desktop:prod
    sed '12,20d' -i "${srcdir}/${pkgname}-${pkgver}/packages/desktop/build-configs/electron-builder.linux.js"
    npm run package:desktop:linux
    asar extract "${srcdir}/${pkgname}-${pkgver}/packages/desktop/packages/linux-unpacked/resources/app.asar" "${srcdir}/app.asar.unpacked"
    cp -r "${srcdir}/${pkgname}-${pkgver}/packages/desktop/dist" "${srcdir}/app.asar.unpacked"
    asar pack "${srcdir}/app.asar.unpacked" "${srcdir}/app.asar"
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/app.asar" -t "${pkgdir}/opt/${pkgname}/resources"
    for _icons in 16x16 24x24 32x32 48x48 64x64 96x96 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/${pkgname}-${pkgver}/packages/desktop/build-res/icon_${_icons}x32.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname}.png"
    done
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}