# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=chatall-git
_pkgname=ChatALL
pkgver=1.78.103.r0.g0a9a37d
_electronversion=28
_nodeversion=18
pkgrel=1
pkgdesc="Concurrently chat with ChatGPT, Bing Chat, Bard, Alpaca, Vicuna, Claude, ChatGLM, MOSS, 讯飞星火, 文心一言 and more, discover the best answers"
arch=('any')
url="http://chatall.ai/"
_ghurl="https://github.com/sunner/ChatALL"
license=('Apache-2.0')
provides=("${pkgname//-/.}")
conflicts=("${pkgname//-/.}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'gendesk'
    'nvm'
    'npm'
    'python'
    'git'
    'curl'
)
source=(
    "${pkgname//-/.}::git+${_ghurl}.git"
    "${pkgname%-git}.sh"
)
sha256sums=('SKIP'
            '61d56055897e9d71d68e185ac2de7c4cb2fbca16eb3fb0091703612c113441f3')
pkgver() {
    cd "${srcdir}/${pkgname//-/.}"
    git describe --long --tags | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}
_ensure_local_nvm() {
    export NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install "${_nodeversion}"
    nvm use "${_nodeversion}"
}
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname//-/.}|g" \
        -e "s|@runname@|app.asar|g" \
        -e "s|@options@|env ELECTRON_OZONE_PLATFORM_HINT=auto|g" \
        -i "${srcdir}/${pkgname%-git}.sh"
    _ensure_local_nvm
    gendesk -f -n -q --categories="Utility" --name="${_pkgname}" --exec="${pkgname//-/.} %U"
    cd "${srcdir}/${pkgname//-/.}"
    export npm_config_build_from_source=true
    export npm_config_cache="${srcdir}/.npm_cache"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    export npm_config_target="${SYSTEM_ELECTRON_VERSION}"
    export ELECTRONVERSION="${_electronversion}"
    export npm_config_disturl=https://registry.npmmirror.com/-/binary/node/
    HOME="${srcdir}/.electron-gyp"
    if [ `curl -s ipinfo.io/country | grep CN | wc -l ` -ge 1 ];then
        export npm_config_registry=https://registry.npmmirror.com
        export npm_config_electron_mirror=https://registry.npmmirror.com/-/binary/electron/
        export npm_config_electron_builder_binaries_mirror=https://registry.npmmirror.com/-/binary/electron-builder-binaries/
    else
        echo "Your network is OK."
    fi
    sed "s|-wml --x64 --arm64|-l --dir|g" -i package.json
    npm install
    npm run release
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname//-/.}"
    install -Dm644 "${srcdir}/${pkgname//-/.}/dist_electron/linux-"*/resources/app.asar -t "${pkgdir}/usr/lib/${pkgname//-/.}"
    install -Dm644 "${srcdir}/${pkgname//-/.}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname//-/.}/src/assets/icon.png" "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname//-/.}.png"
    install -Dm644 "${srcdir}/${pkgname//-/.}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname//-/.}"
}