# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=onlook-git
_pkgname=Onlook
pkgver=0.1.5.r409.g9c92c12
_electronversion=35
_nodeversion=20
pkgrel=1
pkgdesc="The open source, local-first Webflow alternative. Design directly in your live React site and publish your changes to code.(Use system-wide electron)"
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
    'bun'
    'git'
    'nvm'
    'gendesk'
    'curl'
    'python-setuptools'
)
source=(
    "${pkgname//-/.}::git+${url}.git"
    "${pkgname%-git}.sh"
)
sha256sums=('SKIP'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
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
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-git}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname%-git}.sh"
    _ensure_local_nvm
    gendesk -q -f -n --pkgname="${pkgname%-git}" --pkgdesc="${pkgdesc}" --categories="Development" --name="${_pkgname}" --exec="${pkgname%-git} %U"
    cd "${srcdir}/${pkgname//-/.}"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    HOME="${srcdir}/.electron-gyp"
    if [ -f bunfig.toml ]; then
        find ./ -type f -name "bunfig.toml" -exec rm -rf {} +
    fi
    if [ -f bun.lockb ];then
        find ./ -type f -name "bun.lockb" -exec rm -rf {} +
    fi
    if [[ "$(curl -s ipinfo.io/country)" == *"CN"* ]]; then
        export npm_config_electron_mirror="https://registry.npmmirror.com/-/binary/electron/"
        export npm_config_electron_builder_binaries_mirror="https://registry.npmmirror.com/-/binary/electron-builder-binaries/"
        export sqlite3_binary_site="https://registry.npmmirror.com/-/sqlite3/"
        {
            echo '[install]'
            echo 'registry = "https://registry.npmmirror.com/"'
            echo 'strict-ssl = false'
        } >> bunfig.toml
        echo apps/studio packages/cli packages/foundation plugins/babel plugins/next | xargs -n 1 cp bunfig.toml
    fi
    NODE_ENV=development    bun install
    NODE_ENV=development    bun install husky@9.1.6 --save-dev --legacy-peer-deps
}
build() {
    cd "${srcdir}/${pkgname//-/.}"
    NODE_ENV=production     bun ci:build
    cd "${srcdir}/${pkgname//-/.}/apps/studio"
    local electronDist="/usr/lib/electron${_electronversion}"
    sed -i "s/\/\${version}//g" builder-config/base.ts
    NODE_ENV=production     bun exec "electron-builder --linux dir -c.electronDist=${electronDist} --config builder-config/base.ts"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm644 "${srcdir}/${pkgname//-/.}/apps/studio/release/linux-"*/resources/app.asar -t "${pkgdir}/usr/lib/${pkgname%-git}"
    install -Dm644 "${srcdir}/${pkgname//-/.}/assets/logo.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname%-git}.svg"
    install -Dm644 "${srcdir}/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname//-/.}/LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}