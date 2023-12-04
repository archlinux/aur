# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=mockoon
pkgver=6.0.1
_electronversion=26
pkgrel=1
pkgdesc="The easiest and quickest way to run mock APIs locally. No remote deployment, no account required, open source."
arch=('any')
url="https://mockoon.com/"
_ghurl="https://github.com/mockoon/mockoon"
license=('MIT')
conflicts=("${pkgname}")
depends=(
    "electron${_electronversion}"
    'hicolor-icon-theme'
)
makedepends=(
    'gendesk'
    'asar'
    'npm'
    'git'
)
source=(
    "${pkgname}-${pkgver}::git+${_ghurl}.git#tag=v${pkgver}"
    "${pkgname}.sh"
)
sha256sums=('SKIP'
            '8915ca75d453698df81f7f3305cce6869f4261d754d90f0c3724b73c7b24ca84')
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname}|g" \
        -e "s|@appasar@|app.asar|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    gendesk -q -f -n --categories "Development" --name "${pkgname}" --exec "${pkgname}"
    cd "${srcdir}/${pkgname}-${pkgver}"
    export npm_config_build_from_source=true
    export npm_config_cache="$srcdir/npm_cache"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    npm run bootstrap
    npm run build:libs
    npm run build:desktop:prod
    sed '12,20d' -i "${srcdir}/${pkgname}-${pkgver}/packages/desktop/build-configs/electron-builder.linux.js"
    npm run package:desktop:linux
    asar e "${srcdir}/${pkgname}-${pkgver}/packages/desktop/packages/linux-unpacked/resources/app.asar" "${srcdir}/app.asar.unpacked"
    cp -r "${srcdir}/${pkgname}-${pkgver}/packages/desktop/dist" "${srcdir}/app.asar.unpacked"
    asar p "${srcdir}/app.asar.unpacked" "${srcdir}/app.asar"
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/app.asar" -t "${pkgdir}/usr/lib/${pkgname}"
    for _icons in 16x16 24x24 32x32 48x48 64x64 96x96 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/${pkgname}-${pkgver}/packages/desktop/build-res/icon_${_icons}x32.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname}.png"
    done
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}