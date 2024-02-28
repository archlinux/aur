# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=prospect-mail
_pkgname="Prospect Mail"
pkgver=0.5.2
_electronversion=27
_nodeversion=20
pkgrel=2
pkgdesc="An Outlook mail desktop client powered by Electron"
arch=(
    'aarch64'
    'armv7h'
    'x86_64'
)
url="https://github.com/julian-alarcon/prospect-mail"
license=('MIT')
conflicts=(
    "${pkgname}"
    "${pkgname}-beta"
)
provides=("${pkgname}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'gendesk'
    'git'
    'nvm'
    'npm'
    'yarn'
    'gcc'
    'make'
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
    gendesk -q -f -n --categories="Network" --name="${_pkgname}" --exec="${pkgname} %U"
    cd "${srcdir}/${pkgname}.git"
    export npm_config_build_from_source=true
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    export npm_config_target="${SYSTEM_ELECTRON_VERSION}"
    export ELECTRONVERSION="${_electronversion}"
    export npm_config_disturl=https://electronjs.org/headers
    HOME="${srcdir}/.electron-gyp"
    yarn install --cache-folder "${srcdir}/.yarn_cache"
    case "${CARCH}" in
        aarch64)
            yarn run dist:linux:appimage:arm64
        ;;
        armv7h)
            yarn run dist:linux:appimage:arm
        ;;
        x86_64)
            yarn run dist:linux:appimage:x64
        ;;
    esac
    cd "${srcdir}/${pkgname}.git/dist/.icon-set"
    cp icon_256.png icon_256x256.png
    cp icon_512.png icon_512x512.png
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.git/dist/linux-"*/resources/app.asar -t "${pkgdir}/usr/lib/${pkgname}"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/${pkgname}.git/dist/.icon-set/icon_${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname}.png"
    done
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}.git/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}