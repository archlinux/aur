# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=gomoon-git
_pkgname=Gomoon
pkgver=1.0.5.r279.g326d9b6
_electronversion=29
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
    "resources.zip::https://github.com/zxp19821005/My_AUR_Files/releases/download/gomoon-1.1.7/gomoon-resources-20240729.zip"
    "${pkgname%-git}.sh"
)
sha256sums=('SKIP'
            'dc94dbd1243700952a3e9d4a783bbf4f31055fdbf9f727c8b0bf8d8bb5bfb605'
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
        -e "s|@runname@|app.asar|g" \
        -e "s|@cfgdirname@|${_pkgname}|g" \
        -e "s|@options@||g" \
        -i "${srcdir}/${pkgname%-git}.sh"
    _ensure_local_nvm
    gendesk -f -n -q --pkgname="${pkgname%-git}" --pkgdesc="${pkgdesc}" --categories="Development" --name="${_pkgname}" --exec="${pkgname%-git} %U"
    cd "${srcdir}/${pkgname//-/.}"
    export npm_config_build_from_source=true
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    #export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    #export npm_config_target="${SYSTEM_ELECTRON_VERSION}"
    #export ELECTRONVERSION="${_electronversion}"
    HOME="${srcdir}/.electron-gyp"
    mkdir -p "${srcdir}/.electron-gyp"
    touch "${srcdir}/.electron-gyp/.yarnrc"
    if [ `curl -s ipinfo.io/country | grep CN | wc -l ` -ge 1 ];then
        export npm_config_registry=https://registry.npmmirror.com
        export npm_config_disturl=https://registry.npmmirror.com/-/binary/node/
        export npm_config_electron_mirror=https://registry.npmmirror.com/-/binary/electron/
        export npm_config_electron_builder_binaries_mirror=https://registry.npmmirror.com/-/binary/electron-builder-binaries/
    else
        echo "Your network is OK."
    fi
    sed "s|--linux|-l --dir|g" -i package.json
    sed "s|process.resourcesPath|\"\/usr\/lib\/${pkgname%-git}\"|g" -i src/main/lib/index.ts
    bsdtar -xf "${srcdir}/resources.zip" -C "${srcdir}/${pkgname//-/.}"
    corepack enable yarn
    yarn set version 3.2.0
    # .yarnrc.yml existed
    NODE_ENV=development yarn install #--cache-folder "${srcdir}/.yarn_cache"
    NODE_ENV=production yarn run build:linux
    cp -r resources dist/linux-*/resources/app.asar.unpacked
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm644 "${srcdir}/${pkgname//-/.}/dist/linux-"*/resources/app.asar -t "${pkgdir}/usr/lib/${pkgname%-git}"
    cp -r "${srcdir}/${pkgname//-/.}/dist/linux-"*/resources/app.asar.unpacked "${pkgdir}/usr/lib/${pkgname%-git}"
    install -Dm644 "${srcdir}/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname//-/.}/resources/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-git}.png"
}