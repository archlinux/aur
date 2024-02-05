# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=flashpoint-launcher
_pkgname="Flashpoint Launcher"
pkgver=12.1.1
_electronversion=19
_nodeversion=16
pkgrel=3
pkgdesc="A desktop application used to browse, manage and play games from Flashpoint Archive"
arch=('x86_64')
url="http://bluemaxima.org/flashpoint/"
_ghurl="https://github.com/FlashpointProject/launcher"
license=('MIT')
conflicts=("${pkgname}")
depends=(
    'python'
    'libnss_nis'
    'gtk3'
)
makedepends=(
    'gendesk'
    'npm'
    'nvm'
    'rust'
    'yarn'
    'git'
    'gcc'
)
source=(
    "${pkgname}.git::git+${_ghurl}.git#tag=${pkgver}"
)
sha256sums=('SKIP')
_ensure_local_nvm() {
    export NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install "${_nodeversion}"
    nvm use "${_nodeversion}"
}
build() {
    _ensure_local_nvm
    gendesk -q -f -n --categories "Game" --name "${_pkgname}" --exec "${pkgname}"
    cd "${srcdir}/${pkgname}.git"
    export npm_config_build_from_source=true
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export ELECTRONVERSION="${_electronversion}"
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    export npm_config_target="${SYSTEM_ELECTRON_VERSION}"
    export CARGO_HOME="${srcdir}/.cargo"
    HOME="${srcdir}/.electron-gyp"
    sed 's|"deb", "7z"|"AppImage"|g' -i gulpfile.js
    yarn install --cache-folder "${srcdir}/.yarn_cache"    
    yarn run release:linux
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt/"${pkgname}",usr/bin}
    cp -r "${srcdir}/${pkgname}.git/dist/linux-unpacked/"* "${pkgdir}/opt/${pkgname}"
    ln -sf "/opt/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.git/icons/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}.git/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}