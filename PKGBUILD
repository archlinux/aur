# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=autorecord-manager
_pkgname=LiveAutoRecord
pkgver=4.3.4
pkgrel=1
pkgdesc="基于 Electron 的多平台直播自动录制软件"
arch=('any')
url="https://github.com/WhiteMinds/LiveAutoRecord"
license=('LGPL3')
conflicts=("${pkgname}")
depends=('bash' 'electron20')
makedepends=('gendesk' 'nodejs>=18.12.1' 'npm' 'yarn' 'asar')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
    "${pkgname%-bin}.sh")
sha256sums=('bd47c5f59931adee7f43b7bdcabec4370691d8a9da70133344b66d4e4dcb2eb0'
            '90ad81bb91f541a9171af93750cae3f9ec3f61d7c9c8f26dc5d0072519d83bfe')
build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    yarn install
    cd "${srcdir}/${_pkgname}-${pkgver}/packages/shared"
    yarn build
    cd "${srcdir}/${_pkgname}-${pkgver}/packages/manager"
    yarn build
    sed "s|electron-builder\",|electron-builder --linux AppImage\",|g" -i "${srcdir}/${_pkgname}-${pkgver}/packages/electron/package.json"
    yarn app:build
    asar extract "${srcdir}/${_pkgname}-${pkgver}/packages/electron/build/${pkgver}/linux-unpacked/resources/app.asar" "${srcdir}/app.asar.unpacked"
    cp -r "${srcdir}/${_pkgname}-${pkgver}/packages/electron/build/${pkgver}/linux-unpacked/resources/app.asar.unpacked" "${srcdir}"
    asar pack "${srcdir}/app.asar.unpacked" "${srcdir}/${pkgname}.asar"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname}.asar" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/packages/electron/build/icons/256x256.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    gendesk -f -n --categories "Utility" --name "${pkgname}" --exec "${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}