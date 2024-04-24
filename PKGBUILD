# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=baize-toolbox-git
_pkgname="白泽工具箱"
pkgver=0.0.1.beta1.r13.gbd64c16
_electronversion=29
_nodeversion=18
pkgrel=1
pkgdesc="白泽工具箱是一款功能强大的多媒体工具，为用户提供了多种多样的多媒体处理功能。"
arch=('any')
url="https://baize.plume.vip/"
_ghurl="https://github.com/baizeteam/baize-toolbox"
license=("LGPL-3.0-only")
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}=${pkgver%.r*}")
depends=(
    "electron${_electronversion}"
    'ffmpeg'
)
makedepends=(
    'npm'
    'pnpm'
    'git'
    'nvm'
    'gendesk'
    'icoutils'
)
source=(
    "${pkgname%-git}.git::git+${_ghurl}.git"
    #"${pkgname%-git}.sh"
)
sha256sums=('SKIP'
            'dc0c5ca385ad81a08315a91655c7c064b5bf110eada55e61265633ae198b39f8')
pkgver() {
    cd "${srcdir}/${pkgname%-git}.git"
    git describe --tags | sed 's/\w\+\///g;s/\([^-]*-g\)/r\1/;s/-/./g;s/v//g'
}
_ensure_local_nvm() {
    export NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install "${_nodeversion}"
    nvm use "${_nodeversion}"
}
build() {
    #sed -e "s|@electronversion@|${_electronversion}|" \
    #    -e "s|@appname@|${pkgname%-git}|g" \
    #    -e "s|@runname@|app.asar|g" \
    #    -e "s|@options@|env ELECTRON_OZONE_PLATFORM_HINT=auto|g" \
    #    -i "${srcdir}/${pkgname%-git}.sh"
    _ensure_local_nvm
    gendesk -q -f -n --categories="AudioVideo" --name="${_pkgname}" --exec="${pkgname%-git} --no-sandbox %U"
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
    sed "/- AppImage/d;/- snap/d;s|- deb|- dir|g" -i electron-builder.yml
    pnpm install
    pnpm run build:linux
}
package() {
    #install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
    #install -Dm644 "${srcdir}/${pkgname%-git}.git/dist/linux-"*/resources/app.asar -t "${pkgdir}/usr/lib/${pkgname%-git}"
    #cp -r "${srcdir}/${pkgname%-git}.git/dist/linux-"*/resources/app.asar.unpacked "${pkgdir}/usr/lib/${pkgname%-git}"
    #install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-git}/app.asar.unpacked/resources/linux"
    #ln -sf "/usr/bin/ffmpeg" "${pkgdir}/usr/lib/${pkgname%-git}/app.asar.unpacked/resources/linux/ffmpeg"
    install -Dm755 -d "${pkgdir}/"{opt/"${pkgname%-git}",usr/bin}
    cp -r "${srcdir}/${pkgname%-git}.git/dist/linux-"*/* "${pkgdir}/opt/${pkgname%-git}"
    ln -sf "/opt/${pkgname%-git}/${pkgname%-git}" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm755 -d "${pkgdir}/opt/${pkgname%-git}/resources/app.asar.unpacked/resources/linux"
    ln -sf "/usr/bin/ffmpeg" "${pkgdir}/opt/${pkgname%-git}/resources/app.asar.unpacked/resources/linux/ffmpeg"
    install -Dm644 "${srcdir}/${pkgname%-git}.git/resources/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-git}.png"
    install -Dm644 "${srcdir}/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname%-git}.git/dist/linux-"*/LICENSE* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}