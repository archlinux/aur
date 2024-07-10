# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=requestly-git
_pkgname=Requestly
pkgver=1.6.1.r1.g4d25fef
_electronversion=27
_nodeversion=18
pkgrel=1
pkgdesc="Debug your network request across all platforms and browsers using a single app"
arch=('x86_64')
url="https://requestly.io/"
_ghurl="https://github.com/requestly/requestly-desktop-app"
_proxyurl="https://github.com/requestly/requestly-proxy"
license=('AGPL-3.0-only')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'npm'
    'nvm'
    'gendesk'
    'git'
    'asar'
    'curl'
)
source=(
    "${pkgname//-/.}::git+${_ghurl}.git"
    "${pkgname%-git}-proxy::git+${_proxyurl}.git"
    "${pkgname%-git}.sh"
)
sha256sums=('SKIP'
            'SKIP'
            '2b2e8aeed33fd71c521e49fd54fb2fa81218d16aef8bccb88d77909055ab8051')
pkgver() {
    cd "${srcdir}/${pkgname//-/.}"
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/v//g'
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
        -e "s|@appasar@|app.asar|g" \
        -e "s|@cfgdirname@|${_pkgname}|g" \
        -e "s|@options@||g" \
        -i "${srcdir}/${pkgname%-git}.sh"
    _ensure_local_nvm
    gendesk -f -n -q --pkgname="${pkgname%-git}" --pkgdesc="${pkgdesc}" --categories="Development" --name="${_pkgname}" --exec="${pkgname%-git} %U"
    export npm_config_build_from_source=true
    export npm_config_cache="${srcdir}/.npm_cache"
    #export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    #export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    #export npm_config_target="${SYSTEM_ELECTRON_VERSION}"
    #export ELECTRONVERSION="${_electronversion}"
    HOME="${srcdir}/.electron-gyp"
    if [ `curl -s ipinfo.io/country | grep CN | wc -l ` -ge 1 ];then
        export npm_config_registry=https://registry.npmmirror.com
        export npm_config_disturl=https://registry.npmmirror.com/-/binary/node/
        export npm_config_electron_mirror=https://registry.npmmirror.com/-/binary/electron/
        export npm_config_electron_builder_binaries_mirror=https://registry.npmmirror.com/-/binary/electron-builder-binaries/
    else
        echo "Your network is OK."
    fi
    cd "${srcdir}/${pkgname%-git}-proxy"
    NODE_ENV=development npm install
    NODE_ENV=development npm run build
    cd "${srcdir}/${pkgname//-/.}"
    sed "s|AppImage|dir|g;s|icon.icns|icon.png|g" -i package.json
    sed "s|process.resourcesPath|\"\/usr\/lib\/${pkgname%-git}\"|g" -i src/main/main.ts
    NODE_ENV=development npm install
    NODE_ENV=production npm run package
    asar e "${srcdir}/${pkgname//-/.}/release/build/linux-unpacked/resources/app.asar" "${srcdir}/app.asar.unpacked"
    install -Dm644 src/loadingScreen/index.html -t "${srcdir}/app.asar.unpacked/dist/loadingScreen"
    asar p "${srcdir}/app.asar.unpacked" "${srcdir}/app.asar"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm644 "${srcdir}/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-git}"
    cp -r "${srcdir}/${pkgname//-/.}/release/build/linux-unpacked/resources/"{app.asar.unpacked,assets,static} "${pkgdir}/usr/lib/${pkgname%-git}"
    install -Dm644 "${srcdir}/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16x16 32x32 64x64 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/${pkgname//-/.}/assets/icons/${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-git}.png"
    done
}