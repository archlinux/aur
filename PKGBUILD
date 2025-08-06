# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=alicorn-git
_pkgname='Alicorn Launcher'
pkgver=3.0.3.r0.gcf2e857
_electronversion=36
_nodeversion=22
pkgrel=1
pkgdesc="A high performance custom Minecraft launcher.(Use system-wide electron)"
arch=(
    'aarch64'
    'x86_64'
)
url="https://alc.pages.dev/"
_ghurl="https://github.com/Andy-K-Sparklight/Alicorn"
license=('GPL-3.0-only')
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'npm'
    'nvm'
    'git'
    'curl'
    'bun'
)
source=(
    "${pkgname//-/.}::git+${_ghurl}.git"
    "${pkgname%-git}.sh"
)
sha256sums=('SKIP'
            '31ad33b633744f5361abd964be306cea53ae1050e760c787115f7eca60045ae6')
pkgver() {
    cd "${srcdir}/${pkgname//-/.}"
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
    cd "${srcdir}/${pkgname//-/.}"
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-git}/g
        s/@runname@/app/g
        s/@cfgdirname@/${pkgname%-git}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname%-git}.sh"
    _ensure_local_nvm
    gendesk -q -f -n \
        --pkgname="${pkgname%-git}" \
        --pkgdesc="${pkgdesc}" \
        --categories="Game" \
        --name="${_pkgname}" \
        --exec="${pkgname%-git} %U"
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
        bun --config "${srcdir}/${pkgname//-/.}/bunfig.toml"
    fi
    sed -i "s/\"win32\", \"darwin\", //g" pack.ts
    NODE_ENV=development    bun install
}
build() {
    cd "${srcdir}/${pkgname//-/.}"
    local electronDist="/usr/lib/electron${_electronversion}"
    NODE_ENV=production     bun run dist
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-git}/app"
    case "${CARCH}" in
        aarch64)
            _OS_ARCH=arm64
            ;;
        x86_64)
            _OS_ARCH=x64
            ;;
    esac
    cp -Pr --no-preserve=ownership "${srcdir}/${pkgname//-/.}/dist/${_pkgname}-linux-${_OS_ARCH}/resources/app" "${pkgdir}/usr/lib/${pkgname%-git}/app"
    install -Dm644 "${srcdir}/${pkgname//-/.}/resources/icons/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-git}.png"
    install -Dm644 "${srcdir}/${pkgname//-/.}/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname//-/.}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}