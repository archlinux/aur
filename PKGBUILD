# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=sigma-file-manager-git
_pkgname="Sigma file manager"
pkgver=1.7.0.r35.gd558e2a
_electronversion=20
_nodeversion=15.14.0
pkgrel=1
pkgdesc="A free, open-source, quickly evolving, modern file manager (explorer / browser) app for Windows and Linux."
arch=('any')
url="https://sigma-file-manager.vercel.app"
_ghurl="https://github.com/aleksey-hoffman/sigma-file-manager"
license=('GPL3-or-Later')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
depends=(
    #"electron${_electronversion}"
    'alsa-lib'
    'nss'
    'libxrandr'
    'mesa'
    'libdrm'
    'libxkbcommon'
    'gtk3'
)
makedepends=(
    'gendesk'
    'git'
    'nvm'
    'npm'
    'python'
)
source=(
    "${pkgname%-git}.git::git+${_ghurl}.git"
)
sha256sums=('SKIP')
pkgver() {
    cd "${srcdir}/${pkgname%-git}.git"
    git describe --long --tags --exclude='*[a-z][a-z]*' | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}
_ensure_local_nvm() {
    export NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install "${_nodeversion}"
    nvm use "${_nodeversion}"
}
build() {
    _ensure_local_nvm
    gendesk -q -f -n --categories "Utility" --name "${_pkgname}" --exec "${pkgname%-git} --no-sandbox %U"
    cd "${srcdir}/${pkgname%-git}.git"
    export npm_config_build_from_source=true
    export npm_config_cache="${srcdir}/.npm_cache"
    #export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    #export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    #export ELECTRONVERSION="${_electronversion}"
    npm install node-gyp@8.4.0
    npm install --force
    npm run build
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt/"${pkgname%-git}",usr/bin}
    cp -r "${srcdir}/${pkgname%-git}.git/dist_electron/linux-"*/* "${pkgdir}/opt/${pkgname%-git}"
    ln -sf "/opt/${pkgname%-git}/${pkgname%-git}" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm644 "${srcdir}/${pkgname%-git}.git/build/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-git}.png"
    install -Dm644 "${srcdir}/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname%-git}.git/LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}