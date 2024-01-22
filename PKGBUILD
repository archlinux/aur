# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=lanzouyun-pan
pkgver=3.4.7
_electronversion=18
_nodeversion=17
pkgrel=1
pkgdesc="蓝奏云网盘、客户端,实现了蓝奏云大部分功能并添加了许多增强型功能,可作为网盘的日常管理工具使用,项目用 electron 构建."
arch=('any')
url="https://github.com/chenhb23/lanzouyun-disk"
license=('MIT')
conflicts=("${pkgname}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'gendesk'
    'nvm'
    'npm'
    'yarn'
    'git'
    'node-gyp'
    'make'
    'gcc'
)
options=(
    '!strip'
)
source=(
    "${pkgname}.git::git+${url}.git#tag=v${pkgver}"
    "${pkgname}.sh"
)
sha256sums=('SKIP'
            'd4272fed78cdcacd9edfb019134ac485d65b43f4d8c7a4179edbaed56af9b231')
_ensure_local_nvm() {
    export NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install "${_nodeversion}"
    nvm use "${_nodeversion}"
}
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname}|g" \
        -e "s|@appasar@|app.asar|g" \
        -i "${srcdir}/${pkgname}.sh"
    _ensure_local_nvm
    gendesk -f -n -q --categories "Network" --name "${pkgname}" --exec "${pkgname} %U"
    cd "${srcdir}/${pkgname}.git"
    export npm_config_build_from_source=true
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    export ELECTRONVERSION="${_electronversion}"
    sed -e "s|-mw|-l|g" \
        -e "47i\    \"linux\": {" \
        -e "47i\        \"target\": \"AppImage\"," \
        -e "47i\        \"artifactName\": \"lanzouyun-\${version}-\${arch}.\${ext}\"" \
        -e "47i\    }," \
        -i app/package.json
    yarn install --cache-folder "${srcdir}/.yarn_cache"
    yarn run build
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.git/app/dist/linux-"*/resources/app.asar -t "${pkgdir}/usr/lib/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.git/public/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}.git/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}