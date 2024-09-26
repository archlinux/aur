# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=turbowarp-desktop-git
_pkgname=TurboWarp
_appname="org.turbowarp.${_pkgname}"
pkgver=1.12.3.r51.g7964b8f
_electronversion=32
_nodeversion=20
pkgrel=1
pkgdesc="Scratch mod with a compiler to run projects faster, dark mode for your eyes, a bunch of addons to improve the editor, and more."
arch=("any")
url="https://desktop.turbowarp.org/"
_ghurl="https://github.com/TurboWarp/desktop"
license=("GPL-3.0-only")
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}=${pkgver%.r*}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'npm'
    'nvm'
    'curl'
    'git'
    'gcc'
    'cmake'
)
source=(
    "${pkgname%-git}.git::git+${_ghurl}.git"
    "${pkgname%-git}.sh"
)
sha256sums=('SKIP'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
pkgver() {
    cd "${srcdir}/${pkgname%-git}.git"
    set -o pipefail
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/v//g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}
_ensure_local_nvm() {
    local NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh // [[ $? != 1 ]]
    nvm install "${_nodeversion}"
    nvm use "${_nodeversion}"
}
build() {
    sed -e "
        s/@electronversion@/${_electronversion}/
        s/@appname@/${pkgname%-git}/
        s/@runname@/app.asar/
        s/@cfgdirname@/${pkgname%-git}/
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/
    " -i "${srcdir}/${pkgname%-git}.sh"
    _ensure_local_nvm
    cd "${srcdir}/${pkgname%-git}.git"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v / sed 's/v//g')"
    HOME="${srcdir}/.electron-gyp"
    echo -e '\n' >> .npmrc
    #echo 'build_from_source=true' >> .npmrc
    echo "cache=${srcdir}/.npm_cache" >> .npmrc
    if [[ "$(curl -s ipinfo.io/country)" == *"CN"* ]]; then
        sed -i "s/github.com/gitdl.cn\/https:\/\/github.com/g" .gitmodules
        sed -i "s/github.com\/TurboWarp\/scratch-gui/gitdl.cn\/https:\/\/github.com\/TurboWarp\/scratch-gui/g" package.json
        {
            echo 'registry=https://registry.npmmirror.com'
            echo 'disturl=https://registry.npmmirror.com/-/binary/node/'
            echo 'electron_mirror=https://registry.npmmirror.com/-/binary/electron/'
            echo 'electron_builder_binaries_mirror=https://registry.npmmirror.com/-/binary/electron-builder-binaries/'
        } >> .npmrc
    fi
    sed -i "s/\/opt\/${_pkgname}\/${pkgname%-git}/${pkgname%-git}/g;s/${_appname}/${pkgname%-git}/g" \
        linux-files/"${_appname}.desktop"
    sed "s/${_appname}/${pkgname%-git}/g" -i linux-files/{"${_appname}.metainfo.xml","${_appname}.mime.xml"}
    git submodule init
    git submodule update
    cp .npmrc extensions
    NODE_ENV=development    npm ci
    NODE_ENV=production     npm run fetch
    NODE_ENV=production     npm run webpack:prod
    NODE_ENV=production     npm run electron:package:dir
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm644 "${srcdir}/${pkgname%-git}.git/dist/linux-"*/resources/app.asar -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-git}.git/dist/linux-"*/resources/icon.* -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-git}.git/art/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-git}.png"
    install -Dm644 "${srcdir}/${pkgname%-git}.git/linux-files/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-git}.desktop"
    install -Dm644 "${srcdir}/${pkgname%-git}.git/linux-files/${_appname}.mime.xml" "${pkgdir}/usr/share/mime/applications/${pkgname%-git}.mime.xml"
    install -Dm644 "${srcdir}/${pkgname%-git}.git/linux-files/${_appname}.metainfo.xml" "${pkgdir}/usr/share/metainfo/${pkgname%-git}.metainfo.xml"
    install -Dm644  "${srcdir}/${pkgname%-git}.git/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}