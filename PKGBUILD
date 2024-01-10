# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: begin-theadventure <begin-thecontact.ncncb at dralias dot com>
# Contributor: joelvaz0x01 <joelvaz dot whitehat at gmail dot com>
# Contributor: Dawid Weglarz <dawid.weglarz95@gmail.com>
# Contributor: candroid_man <candroid_man@protonmail.com>
# Contributor: Ada <adadonderr@gmail.com>
# Contributor: Christian Finnberg <christian@finnberg.net>
pkgname=notesnook
pkgver=2.6.14
_electronversion=25
_nodeversion=16
pkgrel=2
pkgdesc="A fully open source & end-to-end encrypted note taking alternative to Evernote"
arch=('x86_64')
url="https://notesnook.com/"
_ghurl="https://github.com/streetwriters/notesnook"
license=('GPL3')
provides=("${pkgname}=${pkgver}")
conflicts=("${pkgname}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'nvm'
    'npm'
    'git'
    'zip'
    'node-gyp'
    'make'
    'gcc'
)
source=(
    "${pkgname}.git::git+${_ghurl}.git#tag=v${pkgver}"
    "${pkgname}.desktop"
    "${pkgname}.sh"
)
sha256sums=('SKIP'
            '102a538ee9432310d854842a578cd3371df0431b4db617479de66aa45b5f2440'
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
        -e "s|@appasar@|app|g" \
        -i "${srcdir}/${pkgname}.sh"
    _ensure_local_nvm
    cd "${srcdir}/${pkgname}.git"
    export npm_config_build_from_source=true
    export npm_config_cache="${srcdir}/.npm_cache"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    export ELECTRONVERSION="${_electronversion}"
    sed -e "3i\  \"version\": \"${pkgver}\"," \
        -e "3i\  \"description\": \"${pkgdesc}\"," \
        -e "3i\  \"author\": \"Streetwriters (Private) Limited,support@streetwriters.co,https://streetwriters.co\"," \
        -e "55i\    \"electron\": \"25.9.3\"," \
        -i package.json
    npm install --ignore-scripts --prefer-offline --no-audit
    npm run bootstrap -- --scope=web
    npx nx build:desktop @notesnook/web
    npm run bootstrap -- --scope=desktop
    cd "${srcdir}/${pkgname}.git/apps/desktop"
    npx nx run release --project @notesnook/desktop
    npx electron-builder --linux AppImage:x64 AppImage:arm64 -p never
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname}"
    case "${CARCH}" in
        x86_64)
            _osarch=linux-unpacked
        ;;
        aarch64)
            _osarch=linux-arm64-unpacked
        ;;
    esac
    cp -r "${srcdir}/${pkgname}.git/apps/desktop/output/${_osarch}/resources/"{app,assets} "${pkgdir}/usr/lib/${pkgname}"
    for _icons in 16x16 24x24 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/${pkgname}.git/apps/desktop/assets/icons/${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname}.png"
    done
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}