# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=netflix
pkgname="discord-${_appname}"
_pkgname=Discord-Netflix
pkgver=1.1.13
#_electronversion=30
_nodeversion=18
pkgrel=1
pkgdesc="An updated and improved version from the original Discord-Netflix from Nirewen."
arch=('any')
url="https://discord.gg/kbf8EjpxbU"
_ghurl="https://github.com/V0l-D/Discord-Netflix"
license=('GPL-3.0-only')
conflicts=("${pkgname}")
depends=(
    #"electron${_electronversion}"
    'nodejs'
    'gtk3'
    'nspr'
    'nss'
    'alsa-lib'
)
makedepends=(
    'gendesk'
    'nvm'
    'npm'
    'git'
    'base-devel'
    'gcc'
)
source=(
    "${pkgname}.git::git+${_ghurl}.git#tag=v${pkgver}"
    #"${pkgname}.sh"
)
sha256sums=('81bd5a56245e51eeca363dbe9dbb7b443853e81ad940c2f5d502ab3b9885d1cf')
_ensure_local_nvm() {
    export NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install "${_nodeversion}"
    nvm use "${_nodeversion}"
}
build() {
    #sed -e "s|@electronversion@|${_electronversion}|" \
    #    -e "s|@appname@|${pkgname}|g" \
    #    -e "s|@runname@|app.asar|g" \
    #    -e "s|@options@|env ELECTRON_OZONE_PLATFORM_HINT=auto|g" \
    #    -i "${srcdir}/${pkgname}.sh"
    _ensure_local_nvm
    gendesk -f -n -q --categories="Utility" --name="${pkgname}" --exec="${pkgname} --no-sandbox %U"
    cd "${srcdir}/${pkgname}.git"
    export npm_config_build_from_source=true
    export npm_config_cache="${srcdir}/.npm_cache"
    #export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    #export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    #export npm_config_target="${SYSTEM_ELECTRON_VERSION}"
    #export ELECTRONVERSION="${_electronversion}"
    #export npm_config_disturl=https://electronjs.org/headers
    HOME="${srcdir}/.electron-gyp"
    if [ `curl -s ipinfo.io/country | grep CN | wc -l ` -ge 1 ];then
        export npm_config_registry=https://registry.npmmirror.com
        #export npm_config_electron_mirror=https://registry.npmmirror.com/-/binary/electron/
        #export npm_config_electron_builder_binaries_mirror=https://registry.npmmirror.com/-/binary/electron-builder-binaries/
        sed "s|https://github.com/castlabs|https://cors.isteed.cc/github.com/castlabs|g" -i package.json
    else
        echo "Your network is OK."
    fi
    sed "s|AppImage|dir|g" -i package.json
    #npm install
    #npm run linbuild
}
package() {
    #install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    #install -Dm644 "${srcdir}/${pkgname}.git/dist/linux-"*/resources/app.asar -t "${pkgdir}/usr/lib/${pkgname}"
    install -Dm755 -d "${pkgdir}/"{opt/"${pkgname}",usr/bin}
    cp -r "${srcdir}/${pkgname}.git/dist/linux-"*/* "${pkgdir}/opt/${pkgname}"
    ln -sf "/opt/${pkgname}/${_appname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.git/assets/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}.git/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}