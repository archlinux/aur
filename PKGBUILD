# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=catcat-dm-react
_pkgname=CatCatDM
_zhsname='猫猫弹幕姬'
pkgver=3.0.2
_electronversion=23
_nodeversion=18
pkgrel=1
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
    'jq'
)
source=(
    "${pkgname}-${pkgver}::git+${url}#tag=v${pkgver}"
    "${pkgname}.sh"
)
sha256sums=('af657f286d62c41317242f89369b8426f5cbdbe65545ee04ae0fecb078fd9ba1'
            'e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855')
_ensure_local_nvm() {
    local NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install "${_nodeversion}"
    nvm use "${_nodeversion}"
}
_get_electron_version() {
    _elec_ver=$(jq -r '.devDependencies["electron"] // .dependencies["electron"]' "${srcdir}/${pkgname}-${pkgver}/package.json" | tr -d '^')
    _main_ver=$(echo "${_elec_ver}" | cut -d. -f1)
    echo -e "The electron version is: \033[1;31m${_main_ver}\033[0m"
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
    gendesk -f -n -q \
        --pkgname="${pkgname}" \
        --pkgdesc="${pkgdesc}" \
        --categories="Utility" \
        --name="${_pkgname}" \
        --exec="${pkgname} %U" \
        --custom="Name[zh_CN]=${_zhsname}"
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    local HOME="${srcdir}/.electron-gyp"
    export NPM_CONFIG_CACHE="${srcdir}/.npm_cache"
    export NPM_CONFIG_MAXSOCKETS=32
    if [[ "$(curl -s ipinfo.io/country)" == *"CN"* ]]; then
        {
            export NPM_CONFIG_REGISTRY="https://registry.npmmirror.com"
            export NPM_CONFIG_ELECTRON_MIRROR="https://registry.npmmirror.com/-/binary/electron/"
            export NPM_CONFIG_ELECTRON_BUILDER_BINARIES_MIRROR="https://registry.npmmirror.com/-/binary/electron-builder-binaries/"
        }
        find ./ -type f -name "package-lock.json" -exec sed -i "s/registry.npmjs.org/registry.npmmirror.com/g" {} +
    fi
    _ensure_local_nvm
    find src -type f -exec sed -i "s/process.resourcesPath/\'\/usr\/lib\/${pkgname}\'/g" {} +
    sed -i "s/\"electron\": \"[^\"]*\"/\"electron\": \"${SYSTEM_ELECTRON_VERSION}\"/g" package.json
    NODE_ENV=development    npm install --force
    NODE_ENV=development    npm add -D "@chakra-ui/toast"
    NODE_ENV=production     npx patch-package
}
build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    _ensure_local_nvm
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    local electronDist="/usr/lib/electron${_electronversion}"
    NODE_ENV=production     npx ts-node ./.erb/scripts/clean.js dist
    NODE_ENV=production     npm run build
    NODE_ENV=production     npm exec -c "electron-builder --linux dir -c.electronDist=${electronDist}"
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname}"
	find "${srcdir}/${pkgname}-${pkgver}/release/build/linux-"*"/resources" -maxdepth 1 -type f -exec install -Dm644 -t "${pkgdir}/usr/lib/${pkgname}" {} +
    if find "${srcdir}/${pkgname}-${pkgver}/release/build/linux-"*"/resources" -mindepth 1 -maxdepth 1 -type d | read; then
        for _subdir in "${srcdir}/${pkgname}-${pkgver}/release/build/linux-"*"/resources/"*; do
            if [ -d "${_subdir}" ]; then
                cp -Pr --no-preserve=ownership "${_subdir}" "${pkgdir}/usr/lib/${pkgname}"
            fi
        done
    fi
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    _icon_sizes=(16x16 24x24 32x32 48x48 64x64 96x96 128x128 256x256 512x512 1024x1024)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/${pkgname}-${pkgver}/assets/icons/${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname}.png"
    done
    install -Dm644  "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
