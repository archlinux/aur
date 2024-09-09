# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=onlook-git
_pkgname=Onlook
pkgver=r170.96c7d72
_electronversion=32
_nodeversion=20
pkgrel=1
pkgdesc="The open source, local-first Webflow alternative. Design directly in your live React site and publish your changes to code."
arch=('any')
_url="https://onlook.dev/"
url="https://github.com/onlook-dev/studio"
license=("Apache-2.0")
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
    'gcc'
    'cmake'
    'curl'
)
source=(
    "${pkgname//-/.}::git+${url}.git"
    "${pkgname%-git}.sh"
)
sha256sums=('SKIP'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
pkgver() {
    cd "${srcdir}/${pkgname//-/.}"
    (
        set -o pipefail
        git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' || 
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )
}
_ensure_local_nvm() {
    local NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install "${_nodeversion}"
    nvm use "${_nodeversion}"
}
build() {
    sed -e "
        s/@electronversion@/${_electronversion}/
        s/@appname@/${pkgname%-git}/
        s/@runname@/app.asar/
        s/@cfgdirname@/${_pkgname}/
        s/@options@//
    " -i "${srcdir}/${pkgname%-git}.sh"
    _ensure_local_nvm
    gendesk -q -f -n --pkgname="${pkgname%-git}" --pkgdesc="${pkgdesc}" --categories="Development" --name="${_pkgname}" --exec="${pkgname%-git} %U"
    cd "${srcdir}/${pkgname//-/.}/app"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    HOME="${srcdir}/.electron-gyp"
    {
        echo 'build_from_source=true'
        echo "cache=${srcdir}/.npm_cache"
        if [[ "$(curl -s ipinfo.io/country)" == *"CN"* ]]; then
            echo 'registry=https://registry.npmmirror.com'
            echo 'disturl=https://registry.npmmirror.com/-/binary/node/'
            echo 'electron_mirror=https://registry.npmmirror.com/-/binary/electron/'
            echo 'electron_builder_binaries_mirror=https://registry.npmmirror.com/-/binary/electron-builder-binaries/'
        else
            echo 'registry=https://registry.npmjs.org'
            echo 'disturl=https://nodejs.org/dist'
            echo 'electron_mirror=https://www.electronjs.org/versions'
            echo 'electron_builder_binaries_mirror=https://github.com/electron-userland/electron-builder-binaries/releases/download'
        fi
    } >> .npmrc
    sed -i "s/\"electron\": \"[^\"]*\"/\"electron\": \"${SYSTEM_ELECTRON_VERSION}\"/" package.json
    sed -i "s/\/\${version}//;s/'AppImage', 'deb', 'rpm'/'dir'/" -i electron-builder.json5
    NODE_ENV=development    npm install
    NODE_ENV=production     npm run build
    NODE_ENV=production     npm run package
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm644 "${srcdir}/${pkgname//-/.}/app/release/linux-"*/resources/app.asar -t "${pkgdir}/usr/lib/${pkgname%-git}"
    install -Dm644 "${srcdir}/${pkgname//-/.}/app/build/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-git}.png"
    install -Dm644 "${srcdir}/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname//-/.}/LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}