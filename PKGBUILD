# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=soundcloud
pkgname="${_appname}-rpc-git"
pkgver=0.0.7.r7.ga5a5cee
_electronversion=24
_nodeversion=20
pkgrel=1
pkgdesc="🎵 A SoundCloud Client with Discord Rich Presence, Dark Mode, Last.fm, and AdBlock Support.(Use system-wide electron)"
arch=('any')
url="https://github.com/richardhbtz/soundcloud-rpc"
license=('MIT')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}=${pkgver%.r*}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'gendesk'
    'npm'
    'nvm'
    'git'
    'curl'
    'bun'
    'libicns'
)
source=(
    "${pkgname%-git}.git::git+${url}"
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
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install "${_nodeversion}"
    nvm use "${_nodeversion}"
}
prepare() {
    sed -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-git}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${pkgname%-git}/g
        s/@options@//g
    " -i "${srcdir}/${pkgname%-git}.sh"
    _ensure_local_nvm
    gendesk -q -f -n --pkgname="${pkgname%-git}" --pkgdesc="${pkgdesc}" --categories="Utility" --name="${pkgname%-git}" --exec="${pkgname%-git} %U"
    cd "${srcdir}/${pkgname%-git}.git"
    electronDist="/usr/lib/electron${_electronversion}"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    HOME="${srcdir}/.electron-gyp"
    if [ -f bunfig.toml ]; then
        rm -rf bunfig.toml
    fi
        if [ -f bun.lockb ];then
        rm -rf bun.lockb
    fi
    if [[ "$(curl -s ipinfo.io/country)" == *"CN"* ]]; then
        export npm_config_electron_mirror="https://registry.npmmirror.com/-/binary/electron/"
        export npm_config_electron_builder_binaries_mirror="https://registry.npmmirror.com/-/binary/electron-builder-binaries/"
        export sqlite3_binary_site="https://registry.npmmirror.com/-/sqlite3/"
        {
            echo '[install]'
            echo 'registry = "https://registry.npmmirror.com"'
        } >> bunfig.toml
        find ./ -type f -name "package-lock.json" -exec sed -i "s/registry.npmjs.org/registry.npmmirror.com/g" {} +
    fi
    sed -i "s/\"electron\": \"[^\"]*\"/\"electron\": \"${SYSTEM_ELECTRON_VERSION}\"/g" package.json
    icns2png -x "assets/icons/${_appname}-mac.icns" -o assets/icons
    NODE_ENV=development    bun install
}
build() {
    cd "${srcdir}/${pkgname%-git}.git"
    NODE_ENV=production     bun tsc
    NODE_ENV=production     bun exec "electron-builder --linux dir -c.electronDist=${electronDist}"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm644 "${srcdir}/${pkgname%-git}.git/build/linux-"*/resources/app.asar -t "${pkgdir}/usr/lib/${pkgname%-git}"
    install -Dm644 "${srcdir}/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    icon_sizes=(256x256 512x512 1024x1024)
    for _icons in "${icon_sizes[@]}";do
        install -Dm644 "${srcdir}/${pkgname%-git}.git/assets/icons/${_appname}-mac_${_icons}x32.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-git}.png"
    done
    install -Dm644 "${srcdir}/${pkgname%-git}.git/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
