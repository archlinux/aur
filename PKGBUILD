# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=octa-electron
pkgver=2.0.1
_electronversion=24
_nodeversion=18
pkgrel=1
pkgdesc="Svelte-based app for developing vocabulary wrapped in electron"
arch=('any')
url="https://github.com/MeroVinggen/octa-electron"
license=('custom')
conflicts=("${pkgname}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'gendesk'
    'nvm'
    'npm'
    'git'
    'pnpm'
    'imagemagick'
)
source=(
    "${pkgname}.git::git+${url}.git#tag=v${pkgver}"
    "${pkgname}.sh"
)
sha256sums=('SKIP'
            'd4272fed78cdcacd9edfb019134ac485d65b43f4d8c7a4179edbaed56af9b231')
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
        -i "${srcdir}/${pkgname}.sh"
    _ensure_local_nvm
    gendesk -f -n -q --categories "Utility" --name "${pkgname}" --exec "${pkgname} %U"
    cd "${srcdir}/${pkgname}.git"
    export npm_config_build_from_source=true
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    export ELECTRONVERSION="${_electronversion}"
    pnpm config set store-dir "${srcdir}/.pnpm_store"
    pnpm config set cache-dir "${srcdir}/.pnpm_cache"
    pnpm config set link-workspace-packages true
    sed '/- snap/d;/- deb/d' -i electron-builder.yml
    sed "s|icon.ico|icon.png|g" -i src/main/tray/initAppTray.ts
    convert resources/octopus-teal.png -resize 256x256 resources/icon.png
    cp resources/{icon.ico,icon.png} build/
    pnpm install
    pnpm run build:renderers
    npx electron-builder --linux --config
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.git/dist/linux-"*/resources/app.asar -t "${pkgdir}/usr/lib/${pkgname}"
    cp -r "${srcdir}/${pkgname}.git/dist/linux-"*/resources/app.asar.unpacked "${pkgdir}/usr/lib/${pkgname}"
    cp -r "${srcdir}/${pkgname}.git/dist/"{DB,errorLogs} "${pkgdir}/usr/lib/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.git/dist/appConfig.json" -t "${pkgdir}/usr/lib/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.git/resources/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}.git/dist/linux-"*/LICENSE* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}