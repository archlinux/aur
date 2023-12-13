# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=epub-reader
_pkgname=Epub-Reader
pkgver=1.0.5
_electronversion=18
_nodeversion=16
pkgrel=5
pkgdesc="Epub/Book Reader Application built with ElectronJS"
arch=('any')
url="https://mignaway.github.io/epub-reader-website/"
_ghurl="https://github.com/mignaway/EpubReader"
license=('MIT')
conflicts=("${pkgname}")
depends=(
    "electron${_electronversion}"
    'libxcrypt-compat'
)
makedepends=(
    'yarn'
    'npm'
    'nvm'
    'gendesk'
    'git'
)
source=(
    "${pkgname}-${pkgver}::git+${_ghurl}.git#tag=v${pkgver}"
    "${pkgname}.sh"
)
sha256sums=('SKIP'
            '8915ca75d453698df81f7f3305cce6869f4261d754d90f0c3724b73c7b24ca84')
_ensure_local_nvm() {
    export NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install "${_nodeversion}"
    nvm use "${_nodeversion}"
}
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname}|g" \
        -e "s|@appasar@|app.asar|g" \
        -i "${srcdir}/${pkgname}.sh"
    _ensure_local_nvm
    gendesk -f -n -q --categories "Utility" --name "${_pkgname}" --exec "${pkgname}"
    cd "${srcdir}/${pkgname}-${pkgver}"
    export npm_config_build_from_source=true
    export npm_config_cache="${srcdir}/.npm_cache"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    export ELECTRONVERSION="${_electronversion}"
    yarn install --cache-folder "${srcdir}/.yarn_cache" 
    yarn dist:linux
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/dist/linux-unpacked/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname}"
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}/LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/src/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}