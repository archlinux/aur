# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=gomoon-git
_pkgname=Gomoon
pkgver=1.0.5.r143.g04d9e1c
_electronversion=28
_nodeversion=18
pkgrel=1
pkgdesc="An ai tools for everyone.一款桌面端的大模型效率工具."
arch=('x86_64')
url="https://gomoon.top/"
_ghurl="https://github.com/wizardAEI/Gomoon"
license=('Apache-2.0')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}=${pkgver%.r*}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'gendesk'
    'nvm'
    'npm'
    'yarn'
    'git'
    'icoutils'
    'curl'
)
noextract=(
    "resources.zip"
)
source=(
    "${pkgname//-/.}::git+${_ghurl}.git"
    "resources.zip::https://github.com/zxp19821005/My_AUR_Files/releases/download/gomoon/gomoon-resources-20240327.zip"
    "${pkgname%-git}.sh"
)
sha256sums=('SKIP'
            'c929b84eb11bd1a344b38a94f4778925a9207ad84e73392552d2ec920b2e6898'
            'dc0c5ca385ad81a08315a91655c7c064b5bf110eada55e61265633ae198b39f8')
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
        -e "s|@options@||g" \
        -i "${srcdir}/${pkgname%-git}.sh"
    _ensure_local_nvm
    gendesk -f -n -q --categories="Development" --name="${_pkgname}" --exec="${pkgname%-git} %U"
    cd "${srcdir}/${pkgname//-/.}"
    export npm_config_build_from_source=true
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    export npm_config_target="${SYSTEM_ELECTRON_VERSION}"
    export ELECTRONVERSION="${_electronversion}"
    export npm_config_disturl=https://electronjs.org/headers
    HOME="${srcdir}/.electron-gyp"
    mkdir -p "${srcdir}/.electron-gyp"
    touch "${srcdir}/.electron-gyp/.yarnrc"
    if [ `curl -s ipinfo.io/country | grep CN | wc -l ` -ge 1 ];then
        export npm_config_registry=https://registry.npmmirror.com
        export npm_config_electron_mirror=https://registry.npmmirror.com/-/binary/electron/
        export npm_config_electron_builder_binaries_mirror=https://registry.npmmirror.com/-/binary/electron-builder-binaries/
    else
        echo "Your network is OK."
    fi
    sed "s|--linux|--dir|g" -i package.json
    bsdtar -xf "${srcdir}/resources.zip" -C "${srcdir}/${pkgname//-/.}"
    # .yarnrc.yml existed
    yarn install #--cache-folder "${srcdir}/.yarn_cache"
    yarn run build:linux
    cp -r resources dist/linux-*/resources/app.asar.unpacked
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm644 "${srcdir}/${pkgname//-/.}/dist/linux-"*/resources/app.asar -t "${pkgdir}/usr/lib/${pkgname%-git}"
    cp -r "${srcdir}/${pkgname//-/.}/dist/linux-"*/resources/app.asar.unpacked "${pkgdir}/usr/lib/${pkgname%-git}"
    install -Dm644 "${srcdir}/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname//-/.}/icons/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-git}.png"
}