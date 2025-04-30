# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=altus
_pkgname=Altus
pkgver=5.7.1
_electronversion=35
_nodeversion=22
pkgrel=2
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
    "${pkgname}-${pkgver}::git+${url}#tag=${pkgver}"
    "${pkgname}.sh"
)
sha256sums=('0d9c45617f9036d60518b26df0fb725f3bc3c8931f31f9c2a3d624dd7a3de4c2'
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
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    HOME="${srcdir}/.electron-gyp"
    mkdir -p "${srcdir}/.electron-gyp"
    touch "${srcdir}/.electron-gyp/.yarnrc"
    if [[ "$(curl -s ipinfo.io/country)" == *"CN"* ]]; then
        {
            echo 'npmRegistryServer: "https://registry.npmmirror.com"'
            echo "cacheFolder: "${srcdir}"/.yarn/cache"
            echo "globalFolder: "${srcdir}"/.yarn/global"
        } >> .yarnrc.yml
        export npm_config_electron_mirror=https://registry.npmmirror.com/-/binary/electron/
        export npm_config_electron_builder_binaries_mirror=https://registry.npmmirror.com/-/binary/electron-builder-binaries/
    fi
    sed -i "s/\"electron\": \"\([^\"]*\)\"/\"electron\": \"${SYSTEM_ELECTRON_VERSION}\"/g" package.json
    sed -i -e "
        /import MakerAppImage/d
        s/new MakerAppImage(), //g
    " forge.config.ts
    _yarnver=`grep "yarn@" package.json | awk '{print $2}' | sed "s/\"//g;s/yarn@//g;s/,//g"`
    corepack enable yarn
    echo y | yarn version "${_yarnver}"
    NODE_ENV=development    yarn install
}
build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    local electronDist="/usr/lib/electron${_electronversion}"
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