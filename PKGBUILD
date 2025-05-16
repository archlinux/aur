# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=any-sync-gui
_pkgname='Lan同步'
pkgver=1.6.0
_electronversion=25
_nodeversion=18
pkgrel=10
pkgdesc="Cross-platform local area network synchronization tool.(Use system-wide electron)一款支持在pc与pc或移动设备之间同步文本信息或文件的应用"
arch=('any')
url="https://github.com/easyhutu/any-sync-gui"
license=('ISC')
conflicts=("${pkgname}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'npm'
    'nvm'
    'gendesk'
    'curl'
    'git'
)
source=(
    "${pkgname}-${pkgver}::git+${url}#tag=v${pkgver}"
    "${pkgname}.sh"
)
sha256sums=('e2a3d2cd7e299d90edcd2ea10b83aa86bbed89c39dad0a8491ca3cbe4953e18d'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
_ensure_local_nvm() {
    local NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install "${_nodeversion}"
    nvm use "${_nodeversion}"
}
prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${pkgname}/g
        s/@options@//g
    " "${srcdir}/${pkgname}.sh"
    gendesk -f -n -q \
        --pkgname="${pkgname}" \
        --pkgdesc="${pkgdesc}" \
        --categories="Utility" \
        --name="${_pkgname}" \
        --exec="${pkgname} %U"
    _ensure_local_nvm
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
        echo fe electron_gui | xargs -n 1 cp .npmrc
        find ./ -type f -name "package-lock.json" -exec sed -i "s/registry.npmjs.org/registry.npmmirror.com/g" {} +
    fi
    cd "${srcdir}/${pkgname}-${pkgver}/fe"
    NODE_ENV=development    npm install --legacy-peer-deps
    NODE_ENV=production     npm run build
    cd "${srcdir}/${pkgname}-${pkgver}/electron_gui"
    sed -i "s/\"electron\": \"[^\"]*\"/\"electron\": \"${SYSTEM_ELECTRON_VERSION}\"/g;s/${_pkgname}/${pkgname%-bin}/g" package.json
    find ./ -type f -name "*.js" -exec sed -i "s/process.resourcesPath/\'\/usr\/lib\/${pkgname%-git}\'/g" {} +
    NODE_ENV=development    npm install --legacy-peer-deps
    NODE_ENV=development    npm add -D @electron-forge/plugin-local-electron
}
build() {
    cd "${srcdir}/${pkgname}-${pkgver}/electron_gui"
    local electronDist="/usr/lib/electron${_electronversion}"
    sed -i -e "/^[[:space:]]*plugins:[[:space:]]*\[.*\$/a\\
    {\\
        name: \"@electron-forge/plugin-local-electron\",\\
        config: {\\
            electronPath: \"${electronDist}\"\\
        }\\
    }," forge.config.js
    NODE_ENV=production     npm run package
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/electron_gui/out/${pkgname}-"*/resources/app.asar -t "${pkgdir}/usr/lib/${pkgname}"
    cp -Pr --no-preserve=ownership "${srcdir}/${pkgname}-${pkgver}/electron_gui/out/${pkgname}-"*/resources/{dist,public} "${pkgdir}/usr/lib/${pkgname}"
    #install -Dm755 -d "${pkgdir}/usr/lib/${pkgname}/resources"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    _icon_sizes=(16x16 32x32 128x128 256x256 512x512)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/${pkgname}-${pkgver}/electron_gui/public/icons.iconset/icon_${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname}.png"
    done
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/package.json" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}