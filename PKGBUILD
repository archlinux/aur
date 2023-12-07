# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=image-stitching
_pkgname="${pkgname}-electron-app"
pkgver=1.1.0
_electronversion=25
pkgrel=3
pkgdesc="This Image Stitcher was specifically built to stitch images in a horizontal layout one after the other from left to right. Primarily used for stitching multiple seperate images of a single scratch together."
arch=('x86_64')
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
    "${pkgname}-${pkgver}::git+${url}.git#tag=${pkgver}"
    "${pkgname}.sh"
)
sha256sums=('SKIP'
            '8915ca75d453698df81f7f3305cce6869f4261d754d90f0c3724b73c7b24ca84')
_ensure_local_nvm() {
    export NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install 14
    nvm use 14
}
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname}|g" \
        -e "s|@appasar@|app|g" \
        -i "${srcdir}/${pkgname}.sh"
    _ensure_local_nvm
    gendesk -q -f -n --categories "Graphics;Utility" --name "${pkgname}" --exec "${pkgname}"
    cd "${srcdir}/${pkgname}-${pkgver}"
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
    cp -r "${srcdir}/${pkgname}-${pkgver}/out/${pkgname}-linux-x64/resources/app" "${pkgdir}/usr/lib/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/src/assets/square-smt-logo.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/out/${pkgname}-linux-x64/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}