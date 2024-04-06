# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=flashpoint-launcher
_pkgname="Flashpoint Launcher"
pkgver=13.0.1
_electronversion=19
_nodeversion=16
pkgrel=1
pkgdesc="A desktop application used to browse, manage and play games from Flashpoint Archive"
arch=('x86_64')
url="http://bluemaxima.org/flashpoint/"
_ghurl="https://github.com/FlashpointProject/launcher"
license=('MIT')
conflicts=("${pkgname}")
depends=(
    'python>3'
    'alsa-lib'
    'gtk3'
    'nspr'
    'nss'
)
makedepends=(
    'gendesk'
    'npm'
    'nvm'
    'rust'
    'git'
    'gcc'
    'base-devel'
    'libnss_nis'
)
source=(
    "${pkgname}.git::git+${_ghurl}.git#tag=${pkgver}"
)
sha256sums=('370d0088befdd781ff88c2cc6014cbe19d952b483acb8fa9f095de33118352e3')
_ensure_local_nvm() {
    export NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install "${_nodeversion}"
    nvm use "${_nodeversion}"
}
build() {
    _ensure_local_nvm
    gendesk -q -f -n --categories="Game" --name="${_pkgname}" --exec="${pkgname} --no-sandbox %U"
    cd "${srcdir}/${pkgname}.git"
    export npm_config_build_from_source=true
    export npm_config_cache="${srcdir}/.npm_cache"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    export npm_config_target="${SYSTEM_ELECTRON_VERSION}"
    export ELECTRONVERSION="${_electronversion}"
    export npm_config_disturl=https://electronjs.org/headers
    HOME="${srcdir}/.electron-gyp"
    if [ `curl -s ipinfo.io/country | grep CN | wc -l ` -ge 1 ];then
        export npm_config_registry=https://registry.npmmirror.com
        export npm_config_electron_mirror=https://registry.npmmirror.com/-/binary/electron/
        export npm_config_electron_builder_binaries_mirror=https://registry.npmmirror.com/-/binary/electron-builder-binaries/
        export RUSTUP_DIST_SERVER=https://mirrors.ustc.edu.cn/rust-static
	    export RUSTUP_UPDATE_ROOT=https://mirrors.ustc.edu.cn/rust-static/rustup
    else
        echo "Your network is OK."
    fi
    export CARGO_HOME="${srcdir}/.cargo"
    rm -rf dist
    npm install --force
    npm run build
    npm run pack
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt/"${pkgname}",usr/bin}
    cp -r "${srcdir}/${pkgname}.git/dist/linux-unpacked/"* "${pkgdir}/opt/${pkgname}"
    ln -sf "/opt/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.git/icons/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}.git/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}