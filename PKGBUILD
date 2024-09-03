# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=local-llama-git
_pkgname="Local Llama"
pkgver=1.0.1.r0.g0be6972
_electronversion=31
_nodeversion=18
pkgrel=1
pkgdesc="Local Llama also known as L³ is designed to be easy to use, with a user-friendly interface and advanced settings."
arch=('any')
url="https://folio.tib0.com/"
_ghurl="https://github.com/tib0/local-llama"
license=('CC-BY-NC-ND-4.0')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}=${pkgver%.r*}")
depends=(
    "electron${_electronversion}"
    'vulkan-icd-loader'
    'nodejs'
)
makedepends=(
    'gendesk'
    'npm'
    'nvm'
    'curl'
    'git'
)
options=(
    '!emptydirs'
)
source=(
    "${pkgname%-git}.git::git+${_ghurl}.git"
    "${pkgname%-git}.sh"
)
sha256sums=('SKIP'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
pkgver() {
    cd "${srcdir}/${pkgname%-git}.git"
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/v//g'
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
        -e "s|@cfgdirname@|${_pkgname}|g" \
        -e "s|@options@|env ELECTRON_OZONE_PLATFORM_HINT=auto|g" \
        -i "${srcdir}/${pkgname%-git}.sh"
    _ensure_local_nvm
    gendesk -f -n -q --pkgname="${pkgname%-git}" --pkgdesc="${pkgdesc}" --categories="Utility" --name="${_pkgname}" --exec="${pkgname%-git} %U"
    cd "${srcdir}/${pkgname%-git}.git"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    export ELECTRONVERSION="${_electronversion}"
    HOME="${srcdir}/.electron-gyp"
    echo 'build_from_source=true'  >> .npmrc
    echo "cache="${srcdir}"/.npm_cache"  >> .npmrc
    if [[ "$(curl -s ipinfo.io/country)" == *"CN"* ]]; then
        echo 'registry=https://registry.npmmirror.com' >> .npmrc
        echo 'disturl=https://registry.npmmirror.com/-/binary/node/' >> .npmrc
        echo 'electron_mirror=https://registry.npmmirror.com/-/binary/electron/' >> .npmrc
        echo 'electron_builder_binaries_mirror=https://registry.npmmirror.com/-/binary/electron-builder-binaries/' >> .npmrc
    else
        echo "Your network is OK."
    fi
    sed "/\"electron\": /d;80i\    \"electron\": \"${SYSTEM_ELECTRON_VERSION}\"," -i package.json
    NODE_ENV=development    npm install
    NODE_ENV=production     npm run build
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/${pkgname%-git}.git/out/esm/${_pkgname}-linux-"*/resources/app "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-git}.git/static/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-git}.png"
    install -Dm644 "${srcdir}/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname%-git}.git/LICENCE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}