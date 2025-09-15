# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=catcat-dm-react
_pkgname=CatCatDM
_zhsname='猫猫弹幕姬'
pkgver=2.0.1
_electronversion=23
_nodeversion=18
pkgrel=7
pkgdesc="Cat Cat DanMu.(Use system-wide electron)哔哩哔哩直播弹幕姬:查看直播间弹幕。"
arch=('any')
url="https://github.com/kokolokksk/catcat-dm-react"
license=('MIT')
conflicts=("${pkgname}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'npm'
    'nvm'
    'gendesk'
    'git'
    'curl'
)
source=(
    "${pkgname}-${pkgver}::git+${url}#tag=v${pkgver}"
    "${pkgname}.sh"
)
sha256sums=('c6a22d620f20456e6ff3555e49be08be48ab2a83e4122627ee292a1821d93f3e'
            '31ad33b633744f5361abd964be306cea53ae1050e760c787115f7eca60045ae6')
_ensure_local_nvm() {
    local NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install "${_nodeversion}"
    nvm use "${_nodeversion}"
}
_get_electron_version() {
    _elec_ver="$(grep '"electron":' "${srcdir}/${pkgname}-${pkgver}/package.json" | cut -d'"' -f4 | tr -d '^' | cut -d. -f1)"
    echo -e "The electron version is: \033[1;31m${_elec_ver}\033[0m"
}
prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    _get_electron_version
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@//g
    " "${srcdir}/${pkgname}.sh"
    _ensure_local_nvm
    gendesk -f -n -q \
        --pkgname="${pkgname}" \
        --pkgdesc="${pkgdesc}" \
        --categories="Utility" \
        --name="${_pkgname}" \
        --exec="${pkgname} %U" \
        --custom="Name[zh_CN]=${_zhsname}"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    HOME="${srcdir}/.electron-gyp"
    {
        echo -e '\n'
        #echo 'build_from_source=true'
        echo "cache=${srcdir}/.npm_cache"
        echo "maxsockets=10"
    } >> .npmrc
    if [[ "$(curl -s ipinfo.io/country)" == *"CN"* ]]; then
        {
            echo 'registry=https://registry.npmmirror.com'
            echo 'electron_mirror=https://registry.npmmirror.com/-/binary/electron/'
            echo 'electron_builder_binaries_mirror=https://registry.npmmirror.com/-/binary/electron-builder-binaries/'
        } >> .npmrc
        find ./ -type f -name "package-lock.json" -exec sed -i "s/registry.npmjs.org/registry.npmmirror.com/g" {} +
    fi
    find src -type f -exec sed -i "s/process.resourcesPath/\'\/usr\/lib\/${pkgname}\'/g" {} +
    sed -i "s/\"electron\": \"[^\"]*\"/\"electron\": \"${SYSTEM_ELECTRON_VERSION}\"/g" package.json
    NODE_ENV=development    npm install --force
    NODE_ENV=development    npm add -D "@chakra-ui/toast"
    NODE_ENV=production     npx patch-package
}
build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    _ensure_local_nvm
    local electronDist="/usr/lib/electron${_electronversion}"
    NODE_ENV=production     npx ts-node ./.erb/scripts/clean.js dist
    NODE_ENV=production     npm run build
    NODE_ENV=production     npm exec -c "electron-builder --linux dir -c.electronDist=${electronDist}"
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/release/build/linux-"*/resources/app.asar -t "${pkgdir}/usr/lib/${pkgname}"
    cp -Pr --no-preserve=ownership  "${srcdir}/${pkgname}-${pkgver}/release/build/linux-"*/resources/assets "${pkgdir}/usr/lib/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    _icon_sizes=(16x16 24x24 32x32 48x48 64x64 96x96 128x128 256x256 512x512 1024x1024)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/${pkgname}-${pkgver}/assets/icons/${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname}.png"
    done
    install -Dm644  "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}