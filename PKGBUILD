# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=blinker-git
pkgver=2.1.1.r0.g9ad8ce7
_electronversion=28
_nodeversion=18
pkgrel=1
pkgdesc="Inspired by the 20 20 20 rule, this is a little reminder to look 20 feet away from your screen every 20 minutes. Keep your eyes healthy, reduce eye strain, prevent headaches and increase productivity."
arch=("x86_64")
url="https://github.com/mrkpatchaa/blinker"
license=("CC0-1.0")
provides=("${pkgname%-git}=${pkgver}")
conflicts=("${pkgname%-git}")
depends=(
    "electron${_electronversion}"
    'nodejs'
)
makedepends=(
    'gendesk'
    'git'
    'nvm'
    'npm'
)
source=(
    "${pkgname//-/.}::git+${url}.git"
    "${pkgname%-git}.sh"
)
options=('!emptydirs')
sha256sums=('SKIP'
            '0fb7b939a071f4a08476bdd5aa143d2aa8cd335c83309f9919be16cd5c3e2014')
pkgver() {
    cd "${srcdir}/${pkgname//-/.}"
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
        -e "s|@runname@|app|g" \
        -i "${srcdir}/${pkgname%-git}.sh"
    _ensure_local_nvm
    gendesk -q -f -n --categories "Utility" --name "${pkgname%-git}" --exec "${pkgname%-git} %U"
    cd "${srcdir}/${pkgname//-/.}"
    export npm_config_build_from_source=true
    export npm_config_cache="${srcdir}/.npm_cache"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    export ELECTRONVERSION="${_electronversion}"
    export ELECTRONVERSION="${_electronversion}"
    export npm_config_disturl="https://electronjs.org/headers"
    npm ci
    npm run package
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-git}"
    cp -r "${srcdir}/${pkgname//-/.}/out/com.mrkpatchaa.${pkgname%-git}/${pkgname%-git}-linux-"*/resources/app "${pkgdir}/usr/lib/${pkgname%-git}"
    install -Dm644 "${srcdir}/${pkgname//-/.}/eye.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-git}.png"
    install -Dm644 "${srcdir}/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname//-/.}/out/com.mrkpatchaa.${pkgname%-git}/${pkgname%-git}-linux-"*/LICENSE* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
