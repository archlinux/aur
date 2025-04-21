# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=ui-tars
pkgname="${_appname}-desktop-git"
_pkgname='UI TARS'
pkgver=0.1.0.r0.gf79cfd7
_electronversion=34
_nodeversion=20
pkgrel=1
pkgdesc="A GUI Agent application based on UI-TARS(Vision-Lanuage Model) that allows you to control your computer using natural language.(Use system-wide electron)"
arch=('any')
url="https://github.com/bytedance/UI-TARS-desktop"
license=('Apache-2.0')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}=${pkgver%.r*}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'gendesk'
    'pnpm'
    'npm'
    'nvm'
    'git'
    'curl'
    'python-setuptools'
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
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/v//g;s/Agent.TARS.//g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}
_ensure_local_nvm() {
    local NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install "${_nodeversion}"
    nvm use "${_nodeversion}"
}
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-git}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${pkgname%-git}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname%-git}.sh"
    _ensure_local_nvm
    gendesk -q -f -n --pkgname="${pkgname%-git}" --pkgdesc="${pkgdesc}" --categories="Utility" --name="${_pkgname}" --exec="${pkgname%-git} %U"
    cd "${srcdir}/${pkgname%-git}.git"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    HOME="${srcdir}/.electron-gyp"
    {
        echo -e '\n'
        #echo 'build_from_source=true'
        echo 'link-workspace-packages=true'
        echo 'fetch-retry-maxtimeout=10000'
        echo "cache-dir="${srcdir}"/.pnpm_cache"
        echo "store-dir="${srcdir}"/.pnpm_store"
        echo "shamefully-hoist=true"
        echo "virtual-store-dir-max-length=80"
    } >> .npmrc
    if [[ "$(curl -s ipinfo.io/country)" == *"CN"* ]]; then
        {
        echo 'registry=https://registry.npmmirror.com'
        echo 'electron_mirror=https://cdn.npmmirror.com/binaries/electron/'
        echo 'electron_builder_binaries_mirror=https://npmmirror.com/mirrors/electron-builder-binaries/'
        } >> .npmrc
        cp .npmrc "${srcdir}/${pkgname%-git}.git/apps/agent-tars"
    fi
    sed -i "s/FSPanel/FsPanel/g" apps/agent-tars/src/renderer/src/components/CanvasPanel/EventPlayer/renderPlatformPanel.tsx
    NODE_ENV=development    pnpm install
}
build() {
    cd "${srcdir}/${pkgname%-git}.git/apps/${_appname}"
    sed -i -e "
        s/make --enable-logging/package/g
        s/\"electron\": \"[^\"]*\"/\"electron\": \"${SYSTEM_ELECTRON_VERSION}\"/g
    " package.json
    NODE_ENV=production     pnpm run build
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm644 "${srcdir}/${pkgname%-git}.git/apps/${_appname}/out/${_pkgname}-linux-"*/resources/app.asar \
        -t "${pkgdir}/usr/lib/${pkgname%-git}"
    cp -Pr --no-preserve=ownership "${srcdir}/${pkgname%-git}.git/apps/${_appname}/out/${_pkgname}-linux-"*/resources/app.asar.unpacked \
        "${pkgdir}/usr/lib/${pkgname%-git}"
    install -Dm644 "${srcdir}/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname%-git}.git/apps/${_appname}/resources/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-git}.png"
    install -Dm644 "${srcdir}/${pkgname%-git}.git/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}