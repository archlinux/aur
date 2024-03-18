# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=thorium-reader-git
_pkgname="Thorium Reader"
pkgver=2.3.0.r128.gad41fc04a
_electronversion=29
_nodeversion=20
pkgrel=1
pkgdesc="Cross-platform desktop reading app based on the Readium Desktop toolkit"
arch=('any')
url="https://github.com/edrlab/thorium-reader"
license=('BSD-3-Clause')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
depends=(
    "electron${_electronversion}"
    'hicolor-icon-theme'
)
makedepends=(
    'gendesk'
    'git'
    'nvm'
    'npm'
)
source=(
    "${pkgname%-git}.git::git+${url}.git"
    "${pkgname%-git}.sh"
)
sha256sums=('SKIP'
            'dc0c5ca385ad81a08315a91655c7c064b5bf110eada55e61265633ae198b39f8')
pkgver() {
    cd "${pkgname%-git}.git"
    git describe --long --tags --exclude='*[a-z][a-z]*' | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}
_ensure_local_nvm() {
    export NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install "${_nodeversion}"
    nvm use "${_nodeversion}"
}
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname%-git}|g" \
        -e "s|@runname@|app.asar|g" \
        -e "s|@options@||g" \
        -i "${srcdir}/${pkgname%-git}.sh"
    _ensure_local_nvm
    gendesk -q -f -n --categories="Utility" --name="${_pkgname}" --exec="${pkgname%-git} %U"
    cd "${srcdir}/${pkgname%-git}.git"
    export npm_config_build_from_source=true
    export npm_config_cache="${srcdir}/.npm_cache"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    export npm_config_target="${SYSTEM_ELECTRON_VERSION}"
    export ELECTRONVERSION="${_electronversion}"
    export npm_config_disturl=https://electronjs.org/headers
    HOME="${srcdir}/.electron-gyp"
    if [ `curl -s ipinfo.io/country | grep CN | wc -l ` -ge 1 ];then
        echo 'registry="https://registry.npmmirror.com/"' >> .npmrc
        echo 'electron_mirror="https://registry.npmmirror.com/-/binary/electron/"' >> .npmrc
        echo 'electron_builder_binaries_mirror="https://registry.npmmirror.com/-/binary/electron-builder-binaries/"' >> .npmrc
    else
        echo "Your network is OK."
    fi
    sed "s|--linux --x64 --publish never|-l --dir|g" -i package.json
    npm ci
    npm run prepackage:linux
    npm run package:linux
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}" 
    install -Dm644 "${srcdir}/${pkgname%-git}.git/release/linux-"*/resources/app.asar -t "${pkgdir}/usr/lib/${pkgname%-git}/"
    for _icons in 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/${pkgname%-git}.git/resources/icons/${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-git}.png"
    done
    install -Dm644 "${srcdir}/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications/"
    install -Dm644 "${srcdir}/${pkgname%-git}.git/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}