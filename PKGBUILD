# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=realm-studio-git
_pkgname="Realm Studio"
pkgver=15.2.1.r1.gb501e04
_electronversion=27
_nodeversion=18
pkgrel=1
pkgdesc='A tool, any developer or system administrator would use when building and maintaining their app built on the Realm Mobile Platform.'
arch=('x86_64')
url="https://realm.io/products/realm-studio/"
_ghurl="https://github.com/realm/realm-studio"
license=('Apache-2.0')
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
    'cmake'
    'gcc'
    'curl'
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
    gendesk -q -f -n --pkgname="${pkgname%-git}" --pkgdesc="${pkgdesc}" --categories="Utility" --name="${_pkgname}" --exec="${pkgname%-git} %U"
    cd "${srcdir}/${pkgname%-git}.git"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    HOME="${srcdir}/.electron-gyp"
    {
        #echo 'build_from_source=true'
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
    sed -i "s/\"electron\": \"[^\"]*\"/\"electron\": \"${SYSTEM_ELECTRON_VERSION}\"/;/AppImage/d;s/\"tar.gz\"/\"dir\"/" package.json
    NODE_ENV=development    npm install
    NODE_ENV=production     npm run prepackage
    NODE_ENV=production     npm run package
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm644 "${srcdir}/${pkgname%-git}.git/dist/linux-"*/resources/app.asar -t "${pkgdir}/usr/lib/${pkgname%-git}"
    install -Dm755 "${srcdir}/${pkgname%-git}.git/dist/linux-"*/resources/app.asar.unpacked/node_modules/realm/binding/build/realm.node \
        -t "${pkgdir}/usr/lib/${pkgname%-git}/app.asar.unpacked/node_modules/realm/binding/build"
    install -Dm644 "${srcdir}/${pkgname%-git}.git/resources/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-git}.png"
    install -Dm644 "${srcdir}/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname%-git}.git/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}