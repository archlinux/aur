# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: ArcanusNEO <admin@transcliff.top>
# Contributor: zhullyb < zhullyb [at] outook dot com >
# Contributor: sukanka < su975853527 [at] gmail dot com >
_pkgname=aliyunpan
pkgname="${_pkgname}-odomu-git"
_zhsname="阿里云盘小白羊"
pkgver=3.24.40213.r0.g26a0d6e
_electronversion=21
_nodeversion=18
pkgrel=1
pkgdesc="阿里云盘小白羊版，odomu's fork"
arch=("any")
url="https://github.com/odomu/aliyunpan"
license=("MIT")
provides=("${_pkgname}-liupan1890")
conflicts=(
    "${pkgname%-git}"
    "${_pkgname}-liupan1890"
    "xbyyunpan"
    "xbydriver"
)
depends=(
    "electron${_electronversion}-bin"
)
makedepends=(
    'npm'
    'pnpm'
    'git'
    'nvm'
    'gendesk'
)
source=(
    "${pkgname%-git}.git::git+${url}.git"
    "${pkgname%-git}.sh")
sha256sums=('SKIP'
            'dc0c5ca385ad81a08315a91655c7c064b5bf110eada55e61265633ae198b39f8')
pkgver() {
    cd "${srcdir}/${pkgname%-git}.git"
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
    gendesk -q -f -n --pkgname="${_pkgname}-odomu-git" --categories="Network" --name="${pkgname%-git}" --exec="${pkgname%-git} %U"
    sed "4i\Name[zh]=${_zhsname}" -i "${srcdir}/${pkgname%-git}.desktop"
    cd "${srcdir}/${pkgname%-git}.git"
    export npm_config_build_from_source=true
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    export npm_config_target="${SYSTEM_ELECTRON_VERSION}"
    export ELECTRONVERSION="${_electronversion}"
    export npm_config_disturl=https://electronjs.org/headers
    HOME="${srcdir}/.electron-gyp"
    pnpm config set store-dir "${srcdir}/.pnpm_store"
    pnpm config set cache-dir "${srcdir}/.pnpm_cache"
    pnpm config set link-workspace-packages true
    if [ `curl -s ipinfo.io/country | grep CN | wc -l ` -ge 1 ];then
        export npm_config_registry=https://registry.npmmirror.com
        export npm_config_electron_mirror=https://registry.npmmirror.com/-/binary/electron/
        export npm_config_electron_builder_binaries_mirror=https://registry.npmmirror.com/-/binary/electron-builder-binaries/
    else
      echo "Your network is OK."
    fi
    pnpm install
    pnpm run build:test
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm644 "${srcdir}/${pkgname%-git}.git/release/linux-"*/resources/app.asar -t "${pkgdir}/usr/lib/${pkgname%-git}"
    cp -r "${srcdir}/${pkgname%-git}.git/release/linux-"*/resources/{crx,engine,images} "${pkgdir}/usr/lib/${pkgname%-git}"
    for _icons in 30x30 48x48 64x64 256x256;do
        install -Dm644 "${srcdir}/${pkgname%-git}.git/static/images/icon_${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-git}.png"
    done
    install -Dm644 "${srcdir}/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname%-git}.git/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}