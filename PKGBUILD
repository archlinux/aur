# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=tithree
_pkgname=Tithree
pkgver=1.3.2
_electronversion=25
_nodeversion=18
pkgrel=2
pkgdesc="Tutor's Time Tally.An app for tallying tutor's time spent on tutoring"
arch=('any')
url="https://github.com/wpwwhimself/tithree"
license=('MIT')
conflicts=("${pkgname}")
depends=(
    "electron${_electronversion}"
    'hicolor-icon-theme'
    'python>=3'
    'python-setuptools'
    'nodejs'
)
makedepends=(
    'gendesk'
    'nvm'
    'npm'
    'git'
    'gcc'
    'base-devel'
)
options=('!strip')
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
    gendesk -f -n -q --categories "Utility" --name "${_pkgname}" --exec "${pkgname} %U"
    cd "${srcdir}/${pkgname}.git"
    export npm_config_build_from_source=true
    export npm_config_cache="${srcdir}/.npm_cache"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    export npm_config_target="${SYSTEM_ELECTRON_VERSION}"
    export ELECTRONVERSION="${_electronversion}"
    export npm_config_disturl=https://electronjs.org/headers
    HOME="${srcdir}/.electron-gyp"
    sed "4i\  \"homepage\": \"${url}\"," -i package.json
    sed "s|target: 'deb',|target: 'appImage'|g" -i .electron-builder.config.js
    convert "${srcdir}/${pkgname}.git/packages/renderer/src/assets/t3_color.svg" "${srcdir}/${pkgname}.git/buildResources/icon.png"
    npm install
    npm run compile
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname}"
    cp -r "${srcdir}/${pkgname}.git/dist/linux-"*/resources/app "${pkgdir}/usr/lib/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.git/packages/renderer/src/assets/t3_color.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}.git/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}