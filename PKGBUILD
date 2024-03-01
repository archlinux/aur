# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=upscayl-git
_pkgname=Upscayl
pkgver=2.10.0.r0.gc759638
pkgrel=1
_electronversion=27
_nodeversion=18
pkgdesc="Free and Open Source AI Image Upscaler for Linux, MacOS and Windows built with Linux-First philosophy."
arch=('x86_64')
url='https://upscayl.org/'
_ghurl='https://github.com/upscayl/upscayl'
license=('AGPL-3.0-only')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
depends=(
    "electron${_electronversion}"
    'libvips'
    'nodejs'
)
makedepends=(
    'git'
    'npm'
    'nvm'
    'elfutils'
)
source=(
    "${pkgname//-/.}::git+${_ghurl}.git"
    "${pkgname%-git}.sh"
)
sha256sums=('SKIP'
            '50b10386d13e5bec806aeb78f819c4edd0208a4d184332e53866c802731217fe')
pkgver() {
    cd "${srcdir}/${pkgname//-/.}"
    git describe --long --tags --exclude='*[a-z][a-z]*' | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}
_ensure_local_nvm() {
    export NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install "${_nodeversion}"
    nvm use "${_nodeversion}"
}
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname%-git}|g" \
        -e "s|@runname@|app.asar|g" \
        -i "${srcdir}/${pkgname%-git}.sh"
    _ensure_local_nvm
    cd "${srcdir}/${pkgname//-/.}"
    export npm_config_build_from_source=true
    export npm_config_cache="${srcdir}/.npm_cache"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    export npm_config_target="${SYSTEM_ELECTRON_VERSION}"
    export ELECTRONVERSION="${_electronversion}"
    export npm_config_disturl=https://electronjs.org/headers
    HOME="${srcdir}/.electron-gyp"
    sed "s|-l zip|-l zip --publish never|g" -i package.json
    npm install
    npm run dist:zip
    sed -e "s|${pkgname%-git}-run|${pkgname%-git}|g;s|org.${pkgname%-git}.${_pkgname}|${pkgname%-git}|g" \
        -e "5i\Icon=${pkgname%-git}" \
        -i "${srcdir}/${pkgname//-/.}/org.${pkgname%-git}.${_pkgname}.desktop"
}
package(){
    install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-git}"
    cp -r "${srcdir}/${pkgname//-/.}/dist/linux-"*/resources/* "${pkgdir}/usr/lib/${pkgname%-git}"
    install -Dm644 "${srcdir}/${pkgname//-/.}/build/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-git}.png"
    install -Dm644 "${srcdir}/${pkgname//-/.}/org.${pkgname%-git}.${_pkgname}.desktop" \
        "${pkgdir}/usr/share/applications/${pkgname%-git}.desktop"
}