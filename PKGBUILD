# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=netflix
pkgname="discord-${_appname}"
_pkgname=Discord-Netflix
pkgver=1.1.16
_electronversion="30.0.1+wvcus"
_nodeversion=18
pkgrel=1
pkgdesc="An updated and improved version from the original Discord-Netflix from Nirewen."
arch=('any')
url="https://discord.gg/kbf8EjpxbU"
_ghurl="https://github.com/V0l-D/Discord-Netflix"
license=('GPL-3.0-only')
conflicts=("${pkgname}")
depends=(
    'nodejs'
    'gtk3'
    'nspr'
    'nss'
    'alsa-lib'
)
makedepends=(
    'gendesk'
    'nvm'
    'npm'
    'cmake'
    'gcc'
    'git'
)
source=(
    "${pkgname}.git::git+${_ghurl}.git#tag=v${pkgver}"
)
sha256sums=('83f3b92aa97fead0c42c863787af0adec49e456958d817cda74f0a157529b468')
_ensure_local_nvm() {
    export NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install "${_nodeversion}"
    nvm use "${_nodeversion}"
}
build() {
    _ensure_local_nvm
    gendesk -f -n -q --pkgname="${pkgname}" --pkgdesc="${pkgdesc}" --categories="Utility" --name="${_pkgname}" --exec="${pkgname} --no-sandbox %U"
    cd "${srcdir}/${pkgname}.git"
    export npm_config_build_from_source=true
    export npm_config_cache="${srcdir}/.npm_cache"
    HOME="${srcdir}/.electron-gyp"
    sed "s|AppImage|dir|g" -i package.json
    NODE_ENV=development npm install
    NODE_ENV=production npm run linbuild
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt/"${pkgname}",usr/bin}
    cp -r "${srcdir}/${pkgname}.git/dist/linux-"*/* "${pkgdir}/opt/${pkgname}"
    ln -sf "/opt/${pkgname}/${_appname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.git/assets/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}.git/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}