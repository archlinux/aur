# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=godmode
_pkgname=GodMode
pkgver=1.0.0_beta.10
_electronversion=26
_nodeversion=18
pkgrel=4
pkgdesc="AI Chat Browser: Fast, Full webapp access to ChatGPT / Claude / Bard / Bing / Llama2!"
arch=(
    'aarch64'
    'x86_64'
)
url="https://smol.ai/"
_ghurl="https://github.com/smol-ai/GodMode"
license=('MIT')
conflicts=("${pkgname}")
depends=(
    "electron${_electronversion}"
    'hicolor-icon-theme'
)
makedepends=(
    'npm'
    'gendesk'
    'nvm'
    'git'
)
source=(
    "${pkgname}.git::git+${_ghurl}.git#tag=v${pkgver//_/-}"
    "${pkgname}.sh"
)
sha256sums=('SKIP'
            '50b10386d13e5bec806aeb78f819c4edd0208a4d184332e53866c802731217fe')
_ensure_local_nvm() {
    export NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install "${_nodeversion}"
    nvm use "${_nodeversion}"
}
build() {
    _ensure_local_nvm
    gendesk -q -f -n --categories="Utility" --name="${_pkgname}" --exec="${pkgname} %U"
    cd "${srcdir}/${pkgname}.git"
    export npm_config_build_from_source=true
    export npm_config_cache="${srcdir}/.npm_cache"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    export npm_config_target="${SYSTEM_ELECTRON_VERSION}"
    export ELECTRONVERSION="${_electronversion}"
    export npm_config_disturl=https://electronjs.org/headers
    HOME="${srcdir}/.electron-gyp"
    if [ `curl ifconfig.co/country` == "China" ];then
        echo 'registry="https://registry.npmmirror.com/"' >> .npmrc
        echo 'electron_mirror="https://registry.npmmirror.com/-/binary/electron/"' >> .npmrc
        echo 'electron_builder_binaries_mirror="https://registry.npmmirror.com/-/binary/electron-builder-binaries/"' >> .npmrc
    fi
    npm ci
    npm run package-lin
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    if [ "${CARCH}" == "aarch64" ];then
        local _ARCHDIR=linux-arm64-unpacked
    elif [ "${CARCH}" == "x86_64" ];then
        local _ARCHDIR=linux-unpacked
    fi
    install -Dm644 "${srcdir}/${pkgname}.git/release/build/${_ARCHDIR}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname}"
    cp -r "${srcdir}/${pkgname}.git/release/build/${_ARCHDIR}/resources/assets" "${pkgdir}/usr/lib/${pkgname}"
    for _icons in 16x16 24x24 32x32 48x48 64x64 96x96 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/${pkgname}.git/release/build/linux-unpacked/resources/assets/icons/${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname}.png"
    done
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}.git/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}