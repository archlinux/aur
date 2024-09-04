# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=altus
_pkgname=Altus
pkgver=5.3.0
_electronversion=28
_nodeversion=18
pkgrel=1
pkgdesc="Desktop client for WhatsApp Web with themes, notifications and multiple account support"
arch=('any')
url="https://github.com/amanharwara/altus"
license=('GPL-3.0-only')
conflicts=("${pkgname}")
depends=(
    "electron${_electronversion}"
    'nodejs'
)
makedepends=(
    'yarn'
    'npm'
    'nvm'
    'gendesk'
    'curl'
    'git'
)
options=(
    '!strip'
    '!emptydirs'
)
source=(
    "${pkgname}.git::git+${url}.git#tag=${pkgver}"
    "${pkgname}.sh"
)
sha256sums=('cbaac42fd6477a8d46f24a0b814ae058370e92cd5d87c6f0213472ddaf71c90a'
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
        -e "s|@runname@|app|g" \
        -e "s|@cfgdirname@|${_pkgname}|g" \
        -e "s|@options@|env ELECTRON_OZONE_PLATFORM_HINT=auto|g" \
        -i "${srcdir}/${pkgname}.sh"
    _ensure_local_nvm
    gendesk -q -f -n --pkgname="${pkgname}" --pkgdesc="${pkgdesc}" --categories="Network" --name="${_pkgname}" --exec="${pkgname} %U"
    cd "${srcdir}/${pkgname}.git"
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
    NODE_ENV=production     yarn run package
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname}"
    cp -r "${srcdir}/${pkgname}.git/out/${_pkgname}-linux-"*/resources/app "${pkgdir}/usr/lib/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.git/public/assets/icons/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}.git/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}