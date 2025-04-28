# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=pomotro
_pkgname=Pomotro
pkgver=1.1
_electronversion=25
_nodeversion=20
pkgrel=9
pkgdesc="A Desktop Pomodoro Clock.(Use system-wide electron)"
arch=('x86_64')
url="https://github.com/Ranork/Pomotro"
license=('GPL-3.0-only')
conflicts=("${pkgname}")
depends=(
    "electron${_electronversion}"
    'nodejs'
)
makedepends=(
    'gendesk'
    'nvm'
    'npm'
    'yarn'
    'git'
)
options=(
    '!emptydirs'
)
source=(
    "${pkgname}-${pkgver}::git+${url}#tag=v${pkgver}"
    "${pkgname}.sh"
)
sha256sums=('ab91861fe83ac95b0a5fc40f6265c2169c5185e86682bb27811993889254dbf3'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
_ensure_local_nvm() {
    local NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install "${_nodeversion}"
    nvm use "${_nodeversion}"
}
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname}/g
        s/@runname@/app/g
        s/@cfgdirname@/${pkgname}/g
        s/@options@//g
    " -i "${srcdir}/${pkgname}.sh"
    _ensure_local_nvm
    gendesk -q -f -n --pkgname="${pkgname}" --pkgdesc="${pkgdesc}" --categories="Utility" --name="${_pkgname}" --exec="${pkgname} %U"
    cd "${srcdir}/${pkgname}-${pkgver}"
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
        } >> .yarnrc
        find ./ -type f -name "yarn.lock" -exec sed -i "s/registry.yarnpkg.com/registry.npmmirror.com/g" {} +
    fi
    sed -i "s/\"electron\": \"[^\"]*\"/\"electron\": \"${SYSTEM_ELECTRON_VERSION}\"/g" package.json
    NODE_ENV=development    yarn install --cache-folder "${srcdir}/.yarn_cache"
    NODE_ENV=development    yarn add -D "@electron/packager"
}
build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    NODE_ENV=production     yarn electron-packager . "${_pkgname}" --platform=linux --out=release --overwrite
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname}"
    cp -Pr --no-preserve=ownership "${srcdir}/${pkgname}-${pkgver}/release/${_pkgname}-linux-"*/resources/app "${pkgdir}/usr/lib/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}