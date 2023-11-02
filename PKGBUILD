# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=electron-music
pkgver=1.0
pkgrel=1
pkgdesc="An netease music player,can download muisc."
arch=('x86_64')
url="https://github.com/zhongfulin123/electron-music"
license=('custom')
conflicts=("${pkgname}")
depends=(
    'bash'
    'electron25'
    'hicolor-icon-theme'
)
makedepends=(
    'gendesk'
    'npm'
    'nodejs>=18.17.5'
    'pnpm'
)
source=(
    "${pkgname}-${pkgver}.zip::${url}/archive/refs/tags/v${pkgver}.zip"
    "${pkgname}.sh"
)
sha256sums=('36e3d21f9ddf95dfe6fb8d3887dedd973b36ea26f131eb0346170428673a3ee0'
            '32a0143733423a5ece2e4a62dbdffc477c2c0b403c56682f6e698b4681e38f77')
build() {
    gendesk -f -n -q --categories "AudioVideo" --name "${pkgname}" --exec "${pkgname}"
    cd "${srcdir}/${pkgname}-${pkgver}"
    sed -e '/- snap/d' -e '/- deb/d' -i electron-builder.yml
    pnpm install
    pnpm build:linux
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/dist/linux-unpacked/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/build/icon.png" -t "${pkgdir}/usr/lib/${pkgname}/app.asar.unpacked/resources"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/build/icon.png" "${pkgdir}/usr/lib/${pkgname}/app.asar.unpacked/resources/logo.png"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/build/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/dist/linux-unpacked/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
