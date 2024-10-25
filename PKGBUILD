# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=tailchat
pkgname="${_pkgname}-desktop"
pkgver=1.11.7
_electronversion=18
_nodeversion=16
pkgrel=2
pkgdesc="Next generation noIM application in your own workspace, not only another Slack/Discord/Rocket.chat.Use system-wide electron."
arch=('any')
url="https://tailchat.msgbyte.com/"
_ghurl="https://github.com/msgbyte/tailchat"
license=('Apache-2.0')
conflicts=("${pkgname}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'gendesk'
    'npm'
    'nvm'
    'yarn'
    'gcc'
    'cmake'
    'curl'
)
source=(
    "${pkgname}-${pkgver}.tar.gz::${_ghurl}/archive/refs/tags/v${pkgver}.tar.gz"
    "${pkgname}.sh"
)
sha256sums=('5b7b8e42947ae04c150b48c965489c779ecd2b4e0005f83f0033efeff6b72b41'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
_ensure_local_nvm() {
    local NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install "${_nodeversion}"
    nvm use "${_nodeversion}"
}
build() {
    sed -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@//g
    " -i "${srcdir}/${pkgname}.sh"
    _ensure_local_nvm
    gendesk -q -f -n --pkgname="${_pkgname}-desktop" --pkgdesc="${pkgdesc}" --categories="Network" --name="${pkgname}" --exec="${pkgname} %U"
    cd "${srcdir}/${_pkgname}-${pkgver}/client/desktop"
    electronDist="/usr/lib/electron${_electronversion}"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    HOME="${srcdir}/.electron-gyp"
    mkdir -p "${srcdir}/.electron-gyp"
    if [[ "$(curl -s ipinfo.io/country)" == *"CN"* ]]; then
        {
            echo -e '\n'
            echo 'registry "https://registry.npmmirror.com"'
            echo 'disturl "https://registry.npmmirror.com/-/binary/node/"'
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
        } >> .yarnrc
        find ./ -type f -name "yarn.lock" -exec sed -i "s/registry.yarnpkg.com/registry.npmmirror.com/g" {} +
    fi
    find src -type f -exec sed -i "s/process.resourcesPath/\'\/usr\/lib\/${pkgname}\'/" {} \;
    sed -i "s/\"electron\": \"[^\"]*\"/\"electron\": \"${SYSTEM_ELECTRON_VERSION}\"/g" package.json
    sed -i "s/\/build//g" -i electron-builder.yml
    NODE_ENV=development    yarn install
    NODE_ENV=development    yarn add -D ts-node source-map-support
    NODE_ENV=production     yarn ts-node ./.erb/scripts/clean.js dist
    NODE_ENV=production     yarn run build
    NODE_ENV=production     yarn electron-builder --linux dir -c.electronDist="${electronDist}" --config.asar=false
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname}"
    cp -Pr --no-preserve=ownership "${srcdir}/${_pkgname}-${pkgver}/client/desktop/release/linux-"*/resources/{app,assets} "${pkgdir}/usr/lib/${pkgname}"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/client/desktop/assets/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}