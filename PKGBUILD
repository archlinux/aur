# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=ui-tars
pkgname="${_appname}-desktop-git"
_pkgname='UI TARS'
pkgver=0.2.3.r112.g00df4a5
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
            '31ad33b633744f5361abd964be306cea53ae1050e760c787115f7eca60045ae6')
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
    cd "${srcdir}/${pkgname%-git}.git"
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-git}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${pkgname%-git}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname%-git}.sh"
    _ensure_local_nvm
    gendesk -q -f -n \
        --pkgname="${pkgname%-git}" \
        --pkgdesc="${pkgdesc}" \
        --categories="Utility" \
        --name="${_pkgname}" \
        --exec="${pkgname%-git} %U"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    HOME="${srcdir}/.electron-gyp"
    {
        echo -e '\n'
        #echo 'build_from_source=true'
        echo "cache=${srcdir}/.npm_cache"
        echo "maxsockets=32"
    } >> .npmrc
    if [[ "$(curl -s ipinfo.io/country)" == *"CN"* ]]; then
        {
            echo 'registry=https://registry.npmmirror.com'
            echo 'electron_mirror=https://registry.npmmirror.com/-/binary/electron/'
            echo 'electron_builder_binaries_mirror=https://registry.npmmirror.com/-/binary/electron-builder-binaries/'
        } >> .npmrc
        cp .npmrc "apps/${_appname}"
    fi
    export NODE_ENV=development
    msg "Use corepack to installing pnpm9"
    corepack enable pnpm
    echo y | corepack use pnpm@9
    msg "Installing global dependencies..."
    sed -i "/agent-tars/d" pnpm-workspace.yaml
    npx pnpm install
    msg "Installing @electron-forge/plugin-local-electron"
    npx pnpm add -D -w @electron-forge/plugin-local-electron
}
build() {
    cd "${srcdir}/${pkgname%-git}.git/apps/${_appname}"
    msg "Change electron version"
    sed -i "s/\"electron\": \"[^\"]*\"/\"electron\": \"${SYSTEM_ELECTRON_VERSION}\"/g" package.json
    export NODE_ENV=production
    msg "Define local electron location"
    local electronDist="/usr/lib/electron${_electronversion}"
    msg "Changed to use local electron"
    sed -i -e "/^[[:space:]]*plugins:[[:space:]]*\[.*\$/a\\
    {\\
        name: \"@electron-forge/plugin-local-electron\",\\
        config: {\\
            electronPath: \"${electronDist}\"\\
        }\\
    }," forge.config.ts
    msg "Clean old files"
    npx pnpm run clean
    msg "Typecheck"
    npx pnpm run typecheck:node
    npx pnpm run typecheck:web
    msg "Build package"
    npx pnpm run build:dist
    msg "Use local electron to package"
    npx pnpm run package
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm644 "${srcdir}/${pkgname%-git}.git/apps/${_appname}/out/${_pkgname}-linux-"*/resources/app.asar \
        -t "${pkgdir}/usr/lib/${pkgname%-git}"
    cp -Pr --no-preserve=ownership "${srcdir}/${pkgname%-git}.git/apps/${_appname}/out/${_pkgname}-linux-"*/resources/app.asar.unpacked \
        "${pkgdir}/usr/lib/${pkgname%-git}"
    install -Dm644 "${srcdir}/${pkgname%-git}.git/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname%-git}.git/apps/${_appname}/resources/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-git}.png"
    install -Dm644 "${srcdir}/${pkgname%-git}.git/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}