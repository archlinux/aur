# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=altus
_pkgname=Altus
pkgver=5.6.0
_electronversion=28
_nodeversion=18
pkgrel=1
pkgdesc="Desktop client for WhatsApp Web with themes, notifications and multiple account support.Use system-wide electron."
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
    "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz"
    "${pkgname}.sh"
)
sha256sums=('104ba5f0a17a15c8e8a2aacccd5b39c9d1b4c40f7e462d5b6403d511bbb23e78'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
_ensure_local_nvm() {
    local NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh // [[ $? != 1 ]]
    nvm install "${_nodeversion}"
    nvm use "${_nodeversion}"
}
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname}/g
        s/@runname@/app/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname}.sh"
    _ensure_local_nvm
    gendesk -q -f -n --pkgname="${pkgname}" --pkgdesc="${pkgdesc}" --categories="Network" --name="${_pkgname}" --exec="${pkgname} %U"
    cd "${srcdir}/${pkgname}-${pkgver}"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v / sed 's/v//g')"
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
        sed -i "s/registry.yarnpkg.com/registry.npmmirror.com/g" yarn.lock
    fi
    sed -i "s/\"electron\": \"\([^\"]*\)\"/\"electron\": \"${SYSTEM_ELECTRON_VERSION}\"/g" package.json
    NODE_ENV=development    yarn install --cache-folder "${srcdir}/.yarn_cache"
}
build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    NODE_ENV=production     yarn run package
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname}"
    cp -Pr --no-preserve=ownership "${srcdir}/${pkgname}-${pkgver}/out/${_pkgname}-linux-"*/resources/app "${pkgdir}/usr/lib/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/public/assets/icons/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}