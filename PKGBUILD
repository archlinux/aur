# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=flexplayer
_pkgname=FlexPlayer
pkgver=1.0.0
_electronversion=26
_nodeversion=20
pkgrel=10
pkgdesc="Plays multiple video files in a grid,built in electron.(Use system-wide electron)"
arch=('x86_64')
url="https://github.com/ricmsd/flexplayer"
license=('MIT')
conflicts=("${pkgname}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'gendesk'
    'npm'
    'nvm'
    'curl'
    'git'
)
source=(
    "${pkgname}-${pkgver}::git+${url}#tag=v${pkgver}"
    "${pkgname}.png"
    "${pkgname}.sh"
)
sha256sums=('0746a0e8fccc9c04f3a0f4dc4860e4c74131f2fc5a1d50efa6bab5a71df9966c'
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
    _ensure_local_nvm
    gendesk -q -f -n \
        --pkgname="${pkgname}" \
        --pkgdesc="${pkgdesc}" \
        --categories="AudioVideo" \
        --name="${_pkgname}" \
        --exec="${pkgname} %U"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    HOME="${srcdir}/.electron-gyp"
    {
        echo -e '\n'
        #echo 'build_from_source=true'
        echo "cache=${srcdir}/.npm_cache"
    } >> .npmrc
    if [[ "$(curl -s ipinfo.io/country)" == *"CN"* ]]; then
        {
            echo 'registry=https://registry.npmmirror.com'
            echo 'electron_mirror=https://registry.npmmirror.com/-/binary/electron/'
            echo 'electron_builder_binaries_mirror=https://registry.npmmirror.com/-/binary/electron-builder-binaries/'
        } >> .npmrc
        echo player electron | xargs -n 1 cp .npmrc
        find ./ -type f -name "package-lock.json" -exec sed -i "s/registry.npmjs.org/registry.npmmirror.com/g" {} +
    fi
    cd "${srcdir}/${pkgname}-${pkgver}/player"
    NODE_ENV=development    npm install
    echo N | NODE_ENV=production     npm run build
    cd "${srcdir}/${pkgname}-${pkgver}/electron"
    install -Dm644 "${srcdir}/${pkgname}.png" "${srcdir}/${pkgname}-${pkgver}/electron/resources/icon.png"
    sed -i '/autoHideMenuBar/a\    icon: path.join(__dirname, "../resources/icon.png"),' main.js
    sed -i "s/\"electron\": \"[^\"]*\"/\"electron\": \"${SYSTEM_ELECTRON_VERSION}\"/g" package.json
    NODE_ENV=development    npm install
    NODE_ENV=development    npm add -D @electron-forge/plugin-local-electron
}
build() {
    cd "${srcdir}/${pkgname}-${pkgver}/electron"
    local electronDist="/usr/lib/electron${_electronversion}"
    sed -i -e "/^[[:space:]]*plugins:[[:space:]]*\[.*\$/a\\
    {\\
        name: \"@electron-forge/plugin-local-electron\",\\
        config: {\\
            electronPath: \"${electronDist}\"\\
        }\\
    }," forge.config.*
    # 添加图标
    sed -i '/asar: true,/a\    extraResources: [\n      {\n        from: "resources",\n        to: "resources"\n      }\n    ],' forge.config.*
    npm run forge:package
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/electron/out/${pkgname}-linux-"*/resources/app.asar -t "${pkgdir}/usr/lib/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}