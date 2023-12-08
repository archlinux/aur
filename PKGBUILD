# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=any-sync-gui
_appname="Lan同步"
pkgver=1.3.0
_electronversion=25
pkgrel=4
pkgdesc="一款支持在pc与pc或移动设备之间同步文本信息或文件的应用"
arch=('any')
url="https://github.com/easyhutu/any-sync-gui"
license=('custom')
conflicts=("${pkgname}")
depends=(
    'libxcomposite'
    'libxkbcommon'
    'libxfixes'
    'libcups'
    'mesa'
    'alsa-lib'
    'expat'
    'cairo'
    'libxrandr'
    'pango'
    'libxext'
    'libxcb'
    'at-spi2-core'
    'libdrm'
    'nspr'
    'libxdamage'
    'nss'
    'libx11'
    'gtk3'
)
makedepends=(
    'npm'
    'nodejs'
    'gendesk'
    'git'
)
source=(
    "${pkgname}-${pkgver}::git+${url}.git#tag=v${pkgver}"
    "${pkgname}.sh"
)
sha256sums=('SKIP'
            '43d92406203568b43197eb0ff5bcb2cdc305bb2c972becb6c9b6c2a0dad3df55')
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname}|g" \
        -e "s|@appasar@|app.asar|g" \
        -i "${srcdir}/${pkgname}.sh"
    gendesk -f -n -q --categories "Utility" --name "${_appname}" --exec "${pkgname}" #--no-sandbox %U"
    export npm_config_build_from_source=true
    export npm_config_cache="${srcdir}/.npm_cache"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    export ELECTRONVERSION="${_electronversion}"
    cd "${srcdir}/${pkgname}-${pkgver}/fe"
    npm install --force
    npm run build
    cd "${srcdir}/${pkgname}-${pkgver}/electron_gui"
    sed '24,27d' -i forge.config.js
    npm install --force
    npm run package
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/electron_gui/out/${_appname}-"*/resources/app.asar -t "${pkgdir}/usr/lib/${pkgname}"
    cp -r "${srcdir}/${pkgname}-${pkgver}/electron_gui/out/${_appname}-"*/resources/{dist,public} "${pkgdir}/usr/lib/${pkgname}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname}/resources"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/electron_gui/public/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/electron_gui/out/${_appname}-"*/LICENSE* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}