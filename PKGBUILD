# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=drawdb-client-git
_pkgname=DrawDB
pkgver=r5.be541e6
_electronversion=35
_nodeversion=22
pkgrel=1
pkgdesc="An unoffical client DrawDB by electron.(Use system-wide electron)"
arch=('any')
url="https://github.com/1917NW/DrawDB-Client"
license=('ISC')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}=${pkgver%.r*}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'npm'
    'nvm'
    'git'
    'curl'
    'libicns'
)
source=(
    "${pkgname%-git}.git::git+${url}"
    "${pkgname%-git}.desktop"
    "${pkgname%-git}.sh"
)
sha256sums=('SKIP'
            'd0496479f5e13e1e9eea98262f622440cf53fd02d2fc92871afd7fae77a42b4e'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
pkgver() {
    cd "${srcdir}/${pkgname%-git}.git"
    set -o pipefail
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/v//g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}
_ensure_local_nvm() {
    local NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install "${_nodeversion}"
    nvm use "${_nodeversion}"
}
prepare() {
    cd "${srcdir}/${pkgname%-git}.git"
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-git}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname%-git}.sh"
    _ensure_local_nvm
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    HOME="${srcdir}/.electron-gyp"
    {
        echo -e '\n'
        #echo 'build_from_source=true'
        echo "cache=${srcdir}/.npm_cache"
    } >> .npmrc
    if [[ "$(curl -s ipinfo.io/country)" == *"CN"* ]]; then
        {
            echo 'registry=https://registry.npmmirror.com'
            echo 'electron_mirror=https://registry.npmmirror.com/-/binary/electron/'
            echo 'electron_builder_binaries_mirror=https://registry.npmmirror.com/-/binary/electron-builder-binaries/'
        } >> .npmrc
        find ./ -type f -name "package-lock.json" -exec sed -i "s/registry.npmjs.org/registry.npmmirror.com/g" {} +
    fi
    icns2png -x electron/icon/electron.icns -o ./
    cp electron_32x32x32.png electron/icon/electron.png
    sed -i "s/icns/png/g" electron/main.js
    sed -i "s/\"electron\": \"[^\"]*\"/\"electron\": \"${SYSTEM_ELECTRON_VERSION}\"/g" package.json
    NODE_ENV=development    npm install --legacy-peer-deps
    NODE_ENV=development    npm add -D @electron-forge/plugin-local-electron
}
build() {
    cd "${srcdir}/${pkgname%-git}.git"
    local electronDist="/usr/lib/electron${_electronversion}"
    sed -i -e "
        33i\    {
        33i\      name: '@electron-forge/plugin-local-electron',
        33i\      config: {
        33i\        electronPath: \'${electronDist}\'
        33i\      }
        33i\    },
    " forge.config.js
    NODE_ENV=production     npm run package
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm644 "${srcdir}/${pkgname%-git}.git/out/${_pkgname}-linux-"*/resources/app.asar -t "${pkgdir}/usr/lib/${pkgname%-git}"
    install -Dm644 "${srcdir}/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    icon_sizes=(16x16 32x32 256x256 512x512 1024x1024)
    for _icons in "${icon_sizes[@]}";do
        install -Dm644 "${srcdir}/${pkgname%-git}.git/electron_${_icons}x32.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-git}.png"
    done
    install -Dm644 "${srcdir}/${pkgname%-git}.git/package.json" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}