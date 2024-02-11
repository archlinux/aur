# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=electron-music-player
_appname=EMP
_pkgname=emp
pkgver=0.8.8
_electronversion=25
_nodeversion=18
pkgrel=5
pkgdesc="A functional music player for FLAC, mp3, and m4a audio. "
arch=("any")
url="https://github.com/kevinfrei/EMP"
license=("CC0-1.0")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
    'hicolor-icon-theme'
)
makedepends=(
    'yarn'
    'npm'
    'gendesk'
    'nvm'
    'git'
)
source=(
    "${pkgname}.git::git+${url}.git#tag=v${pkgver}"
    "${pkgname}.sh"
)
sha256sums=('SKIP'
            '0fb7b939a071f4a08476bdd5aa143d2aa8cd335c83309f9919be16cd5c3e2014')
_ensure_local_nvm() {
    export NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install "${_nodeversion}"
    nvm use "${_nodeversion}"
}
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname}|g" \
        -e "s|@runname@|app.asar|g" \
        -i "${srcdir}/${pkgname}.sh"

    _ensure_local_nvm
    gendesk -q -f -n --categories "AudioVideo" --name "EMP: Electron Music Player" --exec "${pkgname} %U"
    cd "${srcdir}/${pkgname}.git" || exit
    export npm_config_build_from_source=true
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    export npm_config_target="${SYSTEM_ELECTRON_VERSION}"
    export ELECTRONVERSION="${_electronversion}"
    export npm_config_disturl=https://electronjs.org/headers
    HOME="${srcdir}/.electron-gyp"
    sed -e '9i\  "repository": "github:kevinfrei/EMP",' -e "s|\"./\"|\"https://github.com/kevinfrei/EMP\"|g" -i package.json
    sed "s|\/\${version}||g" -i electron-builder.json5
    sed "s|app.isPackaged|!app.isPackaged|g" -i electron/main.ts
    sed "s|!app.isPackaged|app.isPackaged|g" -i electron/menu.ts
    sed "s|(!app.isPackaged)|(app.isPackaged)|g;s|app.isPackaged,|!app.isPackaged,|g" -i electron/window.ts
    # .yarnrc.yml existed
    yarn install
    npx lerna run build 
    npx tsc
    npx vite build
    npx electron-builder -l AppImage
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.git/release/linux-"*/resources/app.asar -t "${pkgdir}/usr/lib/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.git/public/logo.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}.git/LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}