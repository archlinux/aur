# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=own3d-desktop-git
_pkgname="OWN3D Pro Desktop"
pkgver=r5.e09e55b
_electronversion=29
pkgrel=1
pkgdesc="Public Development Preview of the OWN3D Desktop App"
arch=('any')
url="https://www.own3d.pro/"
_ghurl="https://github.com/own3d/desktop"
license=("MIT")
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}=${pkgver%.r*}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'npm'
    'git'
    'nodejs'
    'gendesk'
)
source=(
    "${pkgname%-git}.git::git+${_ghurl}.git"
    "${pkgname%-git}.sh")
sha256sums=('SKIP'
            'dc0c5ca385ad81a08315a91655c7c064b5bf110eada55e61265633ae198b39f8')
pkgver() {
    cd "${srcdir}/${pkgname%-git}.git"
    #git describe --long --tags --exclude='*[a-z][a-z]*' | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname%-git}|g" \
        -e "s|@runname@|app.asar|g" \
        -e "s|@options@|env ELECTRON_OZONE_PLATFORM_HINT=auto|g" \
        -i "${srcdir}/${pkgname%-git}.sh"
    gendesk -q -f -n --categories="Game" --name="${_pkgname}" --exec="${pkgname%-git} %U"
    cd "${srcdir}/${pkgname%-git}.git"
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
        export npm_config_registry=https://registry.npmmirror.com
        export npm_config_electron_mirror=https://registry.npmmirror.com/-/binary/electron/
        export npm_config_electron_builder_binaries_mirror=https://registry.npmmirror.com/-/binary/electron-builder-binaries/
    else
        echo "Your network is OK."
    fi
    yarn install --cache-folder "${srcdir}/.yarn_cache"
    yarn run package
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm644 "${srcdir}/${pkgname%-git}.git/out/prod/${_pkgname}-linux-"*/resources/app.asar -t "${pkgdir}/usr/lib/${pkgname%-git}"
    install -Dm644 "${srcdir}/${pkgname%-git}.git/images/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-git}.png"
    install -Dm644 "${srcdir}/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname%-git}.git/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}