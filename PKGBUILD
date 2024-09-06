# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=map-download-git
_pkgname=MapDownload
pkgver=24.9.5.418.r0.gabe25e2
_electronversion=16
_nodeversion=18
pkgrel=1
pkgdesc="高德地图、百度地图（包括百度自定义地图）、腾讯地图、OpenStreetMap、CartoDb、ArcGIS在线地图的下载"
arch=('any')
url="https://github.com/Hxy1992/MapDownload"
license=('MIT')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}=${pkgver%.r*}")
depends=(
    "electron${_electronversion}"
    'libvips'
    'nodejs'
)
makedepends=(
    'gendesk'
    'npm'
    'nvm'
    'curl'
    'git'
    'gcc'
    'cmake'
    'yarn'
)
source=(
    "${pkgname%-git}.git::git+${url}.git"
    "${pkgname%-git}.sh"
)
sha256sums=('SKIP'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
pkgver() {
    cd "${srcdir}/${pkgname%-git}.git"
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
        -e "s|@runname@|app|g" \
        -e "s|@cfgdirname@|${pkgname%-git}|g" \
        -e "s|@options@|env ELECTRON_OZONE_PLATFORM_HINT=auto|g" \
        -i "${srcdir}/${pkgname%-git}.sh"
    _ensure_local_nvm
    gendesk -f -n -q --pkgname="${pkgname%-git}" --pkgdesc="${pkgdesc}" --categories="Utility" --name="${_pkgname}" --exec="${pkgname%-git} %U"
    cd "${srcdir}/${pkgname%-git}.git"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    HOME="${srcdir}/.electron-gyp"
    mkdir -p "${srcdir}/.electron-gyp"
    if [[ "$(curl -s ipinfo.io/country)" == *"CN"* ]]; then
        echo 'registry "https://registry.npmmirror.com"' > "${srcdir}/.electron-gyp/.yarnrc"
        echo 'disturl "https://registry.npmmirror.com/-/binary/node/"' >> "${srcdir}/.electron-gyp/.yarnrc"
        echo 'electron_mirror "https://registry.npmmirror.com/-/binary/electron/"' >> "${srcdir}/.electron-gyp/.yarnrc"
        echo 'electron_builder_binaries_mirror "https://registry.npmmirror.com/-/binary/electron-builder-binaries/"' >> "${srcdir}/.electron-gyp/.yarnrc"
        echo "cacheFolder "${srcdir}"/.yarn/cache" >> "${srcdir}/.electron-gyp/.yarnrc"
        echo "pluginsFolder "${srcdir}"/.yarn/plugins" >> "${srcdir}/.electron-gyp/.yarnrc"
        echo "globalFolder "${srcdir}"/.yarn/global" >> "${srcdir}/.electron-gyp/.yarnrc"
        echo 'useHardlinks true' >> "${srcdir}/.electron-gyp/.yarnrc"
        echo 'buildFromSource true' >> "${srcdir}/.electron-gyp/.yarnrc"
        echo 'linkWorkspacePackages true' >> "${srcdir}/.electron-gyp/.yarnrc"
        echo 'fetchRetries 3' >> "${srcdir}/.electron-gyp/.yarnrc"
        echo 'fetchRetryTimeout 10000' >> "${srcdir}/.electron-gyp/.yarnrc"
    else
        echo "Your network is OK."
    fi
    sed "s|\"electron\": \"\([^\"]*\)\"|\"electron\": \"${SYSTEM_ELECTRON_VERSION}\"|g" -i package.json
    NODE_ENV=development    yarn install --cache-folder "${srcdir}/.yarn_cache"
    NODE_ENV=production     yarn run precompile
    NODE_ENV=production     yarn run compile
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/${pkgname%-git}.git/dist/linux-"*/resources/app "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-git}.git/buildResources/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-git}.png"
    install -Dm644 "${srcdir}/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644  "${srcdir}/${pkgname%-git}.git/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}