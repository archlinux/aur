# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=image-stitching
_pkgname="${pkgname}-electron-app"
_appname="AI Image Stitcher"
pkgver=1.1.0
_electronversion=25
_nodeversion=14
pkgrel=5
pkgdesc="This Image Stitcher was specifically built to stitch images in a horizontal layout one after the other from left to right. Primarily used for stitching multiple seperate images of a single scratch together."
arch=('any')
url="https://github.com/DevanshuSawant/image-stitching-electron-app"
license=('LicenseRef-custom')
conflicts=("${pkgname}")
depends=(
    "electron${_electronversion}"
    'python'
    'python-setuptools'
    'nodejs'
)
makedepends=(
    'gendesk'
    'nvm'
    'npm'
    'git'
)
source=(
    "${pkgname}.git::git+${url}.git#tag=${pkgver}"
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
        -e "s|@runname@|app|g" \
        -i "${srcdir}/${pkgname}.sh"
    _ensure_local_nvm
    gendesk -q -f -n --categories="Graphics;Utility" --name="${_appname}" --exec="${pkgname} %U"
    cd "${srcdir}/${pkgname}.git"
    export npm_config_build_from_source=true
    export npm_config_cache="${srcdir}/.npm_cache"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    export npm_config_target="${SYSTEM_ELECTRON_VERSION}"
    export ELECTRONVERSION="${_electronversion}"
    export npm_config_disturl=https://electronjs.org/headers
    HOME="${srcdir}/.electron-gyp"
    sed '23,26d' -i forge.config.js
    sed "s|AI Image Stitcher|${pkgname}|g" -i package.json
    npm install
    npm run package
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname}"
    cp -r "${srcdir}/${pkgname}.git/out/${pkgname}-linux-"*/resources/app "${pkgdir}/usr/lib/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.git/src/assets/square-smt-logo.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}.git/out/${pkgname}-linux-"*/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}