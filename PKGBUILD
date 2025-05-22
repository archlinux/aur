# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=draw.io
pkgname="${_pkgname//./}-desktop-git"
pkgver=27.0.5.r3.g77f64d8
_electronversion=35
_nodeversion=22
pkgrel=1
pkgdesc="A diagramming and whiteboarding desktop app based on Electron that wraps the core draw.io editor.(Use system-wide electron)"
arch=('any')
url="https://www.diagrams.net/"
_ghurl="https://github.com/jgraph/drawio-desktop"
license=('Apache-2.0')
provides=("${pkgname%-git}=${pkgver}")
conflicts=("${pkgname%-git}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'gendesk'
    'git'
    'yarn'
    'npm'
    'nvm'
    'libicns'
    'imagemagick'
    'curl'
)
source=(
    "${pkgname%-git}.git::git+${_ghurl}.git"
    "${pkgname%-git}.xml"
    "${pkgname%-git}.sh"
)
sha256sums=('SKIP'
            'a4e054e91cdbea6fe37c0767460816a951bc7876b5855752898f6575d15f23e6'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
pkgver() {
    cd "${srcdir}/${pkgname%-git}.git"
    set -o pipefail
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/v//g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}
_ensure_local_nvm() {
    local NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install "${_nodeversion}"
    nvm use "${_nodeversion}"
}
prepare() {
    cd "${srcdir}/${pkgname%-git}.git"
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-git}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@//g
    " "${srcdir}/${pkgname%-git}.sh"
    _ensure_local_nvm
    gendesk -q -f -n \
        --pkgname="${pkgname%-git}" \
        --pkgdesc="${pkgdesc}" \
        --categories="Graphics" \
        --name="${_pkgname}" \
        --exec="env ELECTRON_OZONE_PLATFORM_HINT=auto ${pkgname%-git} %U" \
        --mimetypes="application/vnd.jgraph.mxfile;application/vnd.ms-visio.drawing.main+xml"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    HOME="${srcdir}/.electron-gyp"
    mkdir -p "${srcdir}/.electron-gyp"
    if [[ "$(curl -s ipinfo.io/country)" == *"CN"* ]]; then
        {
            echo -e '\n'
            echo 'registry "https://registry.npmmirror.com"'
            echo 'electron_mirror "https://registry.npmmirror.com/-/binary/electron/"'
            echo 'electron_builder_binaries_mirror "https://registry.npmmirror.com/-/binary/electron-builder-binaries/"'
            echo "cacheFolder "${srcdir}"/.yarn/cache"
            echo "pluginsFolder "${srcdir}"/.yarn/plugins"
            echo "globalFolder "${srcdir}"/.yarn/global"
            echo 'useHardlinks true'
            #echo 'buildFromSource true'
            echo 'linkWorkspacePackages true'
            echo 'fetchRetries 3'
            echo 'fetchRetryTimeout 10000'
            echo 'networkConcurrency 10'
        } >> .yarnrc.
        sed -i "s/github.com/github.moeyy.xyz\/https:\/\/github.com/g" .gitmodules
        find ./ -type f -name "yarn.lock" -exec sed -i "s/registry.npmjs.org/registry.npmmirror.com/g;s/registry.yarnpkg.com/registry.npmmirror.com/g" {} +
    fi
    sed -i "/StartupWMClass/d" electron-builder-linux-mac.json
    sed -i "s/\"electron\": \"[^\"]*\"/\"electron\": \"${SYSTEM_ELECTRON_VERSION}\"/g" package.json
    git submodule update --depth=1 --init --recursive
    cd "${srcdir}/${pkgname%-git}.git/drawio"
    rm -rf docs etc src/main/java src/main/webapp/connect src/main/webapp/service-worker* src/main/webapp/workbox-*
    cd "${srcdir}/${pkgname%-git}.git/drawio/src/main/webapp/js"
    rm -rf atlas-viewer.min.js atlas.min.js cryptojs deflate dropbox embed* freehand integrate.min.js jquery jszip \
        mermaid onedrive orgchart reader.min.js rough sanitizer shapes.min.js simplepeer spin viewer-static.min.js viewer.min.js
    cd "${srcdir}/${pkgname%-git}.git"
    NODE_ENV=development    yarn install --cache-folder "${srcdir}/.yarn_cache"
}
build() {
    cd "${srcdir}/${pkgname%-git}.git"
    local electronDist="/usr/lib/electron${_electronversion}"
    NODE_ENV=development    yarn run sync
    NODE_ENV=production     yarn electron-builder --linux dir -c.electronDist="${electronDist}" --config=electron-builder-linux-mac.json
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm755 "${srcdir}/${pkgname%-git}.git/dist/linux-"*/resources/app.asar -t "${pkgdir}/usr/lib/${pkgname%-git}"
    install -Dm644 "${srcdir}/${pkgname%-git}.git/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    _icon_sizes=(16x16 32x32 48x48 64x64 96x96 128x128 192x192 256x256 512x512 720x720 1024x1024)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/${pkgname%-git}.git/build/${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-git}.png"
    done
    install -Dm644 "${srcdir}/${pkgname%-git}.git/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname%-git}.xml" -t "${pkgdir}/usr/share/mime/packages"
}