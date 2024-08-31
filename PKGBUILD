# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=udeler
_pkgname=Udeler
_appname=udemy-downloader-gui
pkgver=1.13.2
_electronversion=11
_nodeversion=18
pkgrel=1
pkgdesc="An unofficail desktop application for downloading Udemy Courses."
arch=('any')
url="https://github.com/heliomarpm/udemy-downloader-gui"
license=('MIT')
conflicts=("${pkgname}")
provides=("${pkgname}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'npm'
    'git'
    'nvm'
    'gendesk'
    'cmake'
    'gcc'
    'curl'
)
source=(
    "${pkgname}.git::git+${url}.git#tag=v${pkgver}"
    "${pkgname}.sh"
)
sha256sums=('f9dd17b229ca2208656441bc23c99912ae05babcd47011a58df5cc93311dc78d'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
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
        -e "s|@cfgdirname@|${_pkgname}|g" \
        -e "s|@options@||g" \
        -i "${srcdir}/${pkgname}.sh"
    _ensure_local_nvm
    gendesk -q -f -n --pkgname="${pkgname}" --pkgdesc="${pkgdesc}" --categories="Utility" --name="${_pkgname}" --exec="${pkgname} %U"
    cd "${srcdir}/${pkgname}.git"
    export npm_config_build_from_source=true
    export npm_config_cache="${srcdir}/.npm_cache"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    export ELECTRONVERSION="${_electronversion}"
    HOME="${srcdir}/.electron-gyp"
    if [[ "$(curl -s ipinfo.io/country)" == *"CN"* ]]; then
        export npm_config_registry=https://registry.npmmirror.com
        export npm_config_disturl=https://registry.npmmirror.com/-/binary/node/
        export npm_config_electron_mirror=https://registry.npmmirror.com/-/binary/electron/
        export npm_config_electron_builder_binaries_mirror=https://registry.npmmirror.com/-/binary/electron-builder-binaries/
    else
        echo "Your network is OK."
    fi
    cp .env.example .env
    sed "s|\"electron\": \"11.5.0\",|\"electron\": \"${SYSTEM_ELECTRON_VERSION}\",|g" -i package.json
    NODE_ENV=development    npm install
    NODE_ENV=production     npx electron-builder -l --dir
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.git/dist/linux-"*/resources/app.asar -t "${pkgdir}/usr/lib/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.git/app/assets/images/build/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}.git/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}