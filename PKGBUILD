# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=finance-manager-git
_pkgname="Finance Manager"
pkgver=1.0.1.r0.gdd8f453
_electronversion=29
_nodeversion=18
pkgrel=1
pkgdesc="Simple application to manager revenue and expenses."
arch=('any')
url="https://github.com/programmingKyle/finance-manager"
license=("MIT")
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}=${pkgver%.r*}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'npm'
    'git'
    'nvm'
    'gendesk'
    'base-devel'
    'gcc'
)
source=(
    "${pkgname%-git}.git::git+${url}.git"
    "${pkgname%-git}.sh")
sha256sums=('SKIP'
            '05762c556c85a4423b28600ccbbe7b7dcdd3d1be526ef4a588a510671fa6c62a')
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
        -e "s|@options@|env ELECTRON_OZONE_PLATFORM_HINT=auto|g" \
        -i "${srcdir}/${pkgname%-git}.sh"
    _ensure_local_nvm
    gendesk -q -f -n --categories="Utility" --name="${_pkgname}" --exec="${pkgname%-git} %U"
    cd "${srcdir}/${pkgname%-git}.git"
    export npm_config_build_from_source=true
    export npm_config_cache="${srcdir}/.npm_cache"
    #export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    #export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    #export npm_config_target="${SYSTEM_ELECTRON_VERSION}"
    #export ELECTRONVERSION="${_electronversion}"
    export npm_config_disturl=https://registry.npmmirror.com/-/binary/node/
    HOME="${srcdir}/.electron-gyp"
    if [ `curl -s ipinfo.io/country | grep CN | wc -l ` -ge 1 ];then
        export npm_config_registry=https://registry.npmmirror.com
        export npm_config_electron_mirror=https://registry.npmmirror.com/-/binary/electron/
        export npm_config_electron_builder_binaries_mirror=https://registry.npmmirror.com/-/binary/electron-builder-binaries/
    else
        echo "Your network is OK."
    fi
    npm install
    npx electron-builder -l --dir
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm644 "${srcdir}/${pkgname%-git}.git/dist/linux-"*/resources/app.asar -t "${pkgdir}/usr/lib/${pkgname%-git}"
    install -Dm644 "${srcdir}/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname%-git}.git/dist/linux-"*/LICENSE* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}