# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=listen1-desktop-git
_pkgname=Listen1
pkgver=2.32.0.r2.ga087d36
pkgrel=1
pkgdesc="One for all free music in China.Listen 1 可以搜索和播放来自多个主流音乐网站的歌曲，让你的曲库更全面。并支持收藏功能，方便的创建自己的歌单。"
arch=('any')
url="http://listen1.github.io/listen1"
_ghurl="https://github.com/listen1/listen1_desktop"
license=('MIT')
conflicts=(
    "${pkgname%-git}"
    "${pkgname%-desktop-git}"
    "${pkgname%-desktop-git}-electron"
)
provides=(
    "${pkgname%-git}=${pkgver%.r*}"
)
depends+=(
    "electron${_electronversion}"
)
makedepends=(
    'gendesk'
    'git'
    'nodejs'
    'npm'
)
source=(
    "${pkgname%-git}.git::git+${_ghurl}.git"
    "${pkgname%-git}.sh"
)
sha256sums=('SKIP'
            'dc0c5ca385ad81a08315a91655c7c064b5bf110eada55e61265633ae198b39f8')
pkgver() {
    cd "${srcdir}/${pkgname%-git}.git"
    git describe --long --tags --exclude='*[a-z][a-z]*' | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}
_getelectronver() {
    cd "${srcdir}/${pkgname%-git}.git"
    grep '"electron": ' -i package.json | awk '{print $2}' | sed 's|"||g;s|\^||g;s|\.| |g' | awk '{print $1}'
}
build() {
    _electronversion="$(_getelectronver)"
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname%-git}|g" \
        -e "s|@runname@|app|g" \
        -e "s|@options@||g" \
        -i "${srcdir}/${pkgname%-git}.sh"
    gendesk -q -f -n --categories="AudioVideo" --name="${_pkgname}" --exec="${pkgname%-git} %U"
    cd "${srcdir}/${pkgname%-git}.git"
    export npm_config_build_from_source=true
    export npm_config_cache="${srcdir}/.npm_cache"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    export npm_config_target="${SYSTEM_ELECTRON_VERSION}"
    export ELECTRONVERSION="${_electronversion}"
    export npm_config_disturl=https://electronjs.org/headers
    HOME="${srcdir}/.electron-gyp"
    if [ `curl -s ipinfo.io/country | grep CN | wc -l ` -ge 1 ];then
        export npm_config_registry=https://registry.npmmirror.com
        export npm_config_electron_mirror=https://registry.npmmirror.com/-/binary/electron/
        export npm_config_electron_builder_binaries_mirror=https://registry.npmmirror.com/-/binary/electron-builder-binaries/
    else
        echo "Your network is OK."
    fi
    sed "s|--ia32 --x64|--dir|g" -i package.json
    npm install
    npm run dist:linux
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm644 "${srcdir}/${pkgname%-git}.git/dist/linux-"*/resources/app.asar -t "${pkgdir}/usr/lib/${pkgname%-git}"
    install -Dm644 "${srcdir}/${pkgname%-git}.git/dist/linux-"*/swiftshader/* -t "${pkgdir}/usr/lib/${pkgname%-git}/swiftshader"
    install -Dm644 "${srcdir}/${pkgname%-git}.git/app/resources/logo512.png" -t "${pkgdir}/usr/share/pixmaps/${pkgname%-git}.png"
    install -Dm644 "${srcdir}/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname%-git}.git/LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}