# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=mockoon
pkgver=6.1.0
_electronversion=26
_nodeversion=18
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
    'node-gyp'
    'make'
    'gcc'
)
source=(
    "${pkgname}::git+${_ghurl}.git#tag=v${pkgver}"
    "${pkgname}.sh"
)
sha256sums=('SKIP'
            '5ce46265f0335b03568aa06f7b4c57c5f8ffade7a226489ea39796be91a511bf')
_ensure_local_nvm() {
    export NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install "${_nodeversion}"
    nvm use "${_nodeversion}"
}
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname}|g" \
        -e "s|@appasar@|app.asar|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    _ensure_local_nvm
    gendesk -q -f -n --categories "Development" --name "${pkgname}" --exec "${pkgname}"
    cd "${srcdir}/${pkgname}"
    sed '12,20d' -i "${srcdir}/${pkgname}/packages/desktop/build-configs/electron-builder.linux.js"
    export npm_config_build_from_source=true
    export npm_config_cache="$srcdir/.npm_cache"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    export ELECTRONVERSION="${_electronversion}"
    npm run bootstrap
    npm run build:libs
    npm run build:desktop:prod
    npm run package:desktop:linux
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/packages/desktop/packages/linux-unpacked/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname}"
    for _icons in 16x16 24x24 32x32 48x48 64x64 96x96 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/${pkgname}/packages/desktop/build-res/icon_${_icons}x32.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname}.png"
    done
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}/LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}