# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=image-stitching
_pkgname="${pkgname}-electron-app"
pkgver=1.1.0
_electronversion=25
_nodeversion=14
pkgrel=4
pkgdesc="This Image Stitcher was specifically built to stitch images in a horizontal layout one after the other from left to right. Primarily used for stitching multiple seperate images of a single scratch together."
arch=('any')
url="https://github.com/DevanshuSawant/image-stitching-electron-app"
license=('custom')
conflicts=("${pkgname}")
depends=(
    "electron${_electronversion}"
    'python'
    'python-setuptools'
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
    gendesk -q -f -n --categories "Graphics;Utility" --name "${pkgname}" --exec "${pkgname}"
    cd "${srcdir}/${pkgname}.git"
    export npm_config_build_from_source=true
    export npm_config_cache="${srcdir}/.npm_cache"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    export ELECTRONVERSION="${_electronversion}"
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