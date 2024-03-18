# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=wubi-dict-editor
_zhname="五笔码表助手"
pkgver=1.24
_electronversion=24
_nodeversion=18
pkgrel=3
pkgdesc="五笔码表助手 for Rime ( Windows、macOS、Ubuntu ) 基于 electron 开发."
arch=("x86_64")
url="https://github.com/KyleBing/wubi-dict-editor"
license=('GPL-3.0-only')
conflicts=("${pkgname}")
depends=(
    #'ibus-rime'
    "electron${_electronversion}-bin"
    'nodejs'
)
makedepends=(
    'npm'
    'yarn'
    'nvm'
    'gendesk'
    'imagemagick'
    'git'
)
options=(
    '!emptydirs'
)
source=(
    "${pkgname}.git::git+${url}#tag=v${pkgver}"
    "${pkgname}.sh"
)
sha256sums=('1361215223470910299816a5bbdd5c8e00b46d74e9a12118803babeb58151f87'
            'dc0c5ca385ad81a08315a91655c7c064b5bf110eada55e61265633ae198b39f8')
_ensure_local_nvm() {
    export NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install "${_nodeversion}"
    nvm use "${_nodeversion}"
}
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname}|g" \
        -e "s|@runname@|app|g" \
        -i "${srcdir}/${pkgname}.sh"
    _ensure_local_nvm
    gendesk -q -f -n --categories="Utility" --name="${pkgname}" --genericname="${_zhname} for Rime" --exec="${pkgname} %U"
    cd "${srcdir}/${pkgname}.git"
    export npm_config_build_from_source=true
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    export npm_config_target="${SYSTEM_ELECTRON_VERSION}"
    export ELECTRONVERSION="${_electronversion}"
    export npm_config_disturl=https://electronjs.org/headers
    HOME="${srcdir}/.electron-gyp"
    mkdir -p "${srcdir}/.electron-gyp"
    touch "${srcdir}/.electron-gyp/.yarnrc"
    if [ `curl -s ipinfo.io/country | grep CN | wc -l ` -ge 1 ];then
        echo 'registry="https://registry.npmmirror.com/"' >> .npmrc
        echo 'electron_mirror="https://registry.npmmirror.com/-/binary/electron/"' >> .npmrc
        echo 'electron_builder_binaries_mirror="https://registry.npmmirror.com/-/binary/electron-builder-binaries/"' >> .npmrc
    else
        echo "Your network is OK."
    fi
    convert "${srcdir}/${pkgname}.git/assets/img/appIcon/appIcon.ico" "${srcdir}/${pkgname}.png"
    yarn install --cache-folder "${srcdir}/.yarn_cache"
    yarn run package
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname}"
    cp -r "${srcdir}/${pkgname}.git/out/${_zhname}-linux-x64/resources/app" "${pkgdir}/usr/lib/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-3.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}