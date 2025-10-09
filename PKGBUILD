# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=wordpress-studio-git
_appname=Studio
_pkgname="WordPress ${_appname}"
pkgver=1.6.0.r10.g3fd55cf
_electronversion=38
_nodeversion=22
pkgrel=1
pkgdesc="A free desktop app that helps developers streamline their local WordPress development workflow.(Use system-wide electron)"
arch=('any')
url="https://developer.wordpress.com/studio/"
_ghurl="https://github.com/Automattic/studio"
license=('GPL-2.0-or-later')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}=${pkgver%.r*}")
depends=(
    "electron${_electronversion}"
    'php'
)
makedepends=(
    'npm'
    'git'
    'nvm'
    'gendesk'
    'curl'
)
options=(
    '!strip'
    '!emptydirs'
)
source=(
    "${pkgname%-git}.git::git+${_ghurl}.git"
    "${pkgname%-git}.sh"
)
sha256sums=('SKIP'
            '31ad33b633744f5361abd964be306cea53ae1050e760c787115f7eca60045ae6')
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
_get_electron_version() {
    _elec_ver="$(grep -m 1 '"electron":' "${srcdir}/${pkgname%-git}.git/package.json" | cut -d'"' -f4 | tr -d '^' | cut -d. -f1)"
    echo -e "The electron version is: \033[1;31m${_elec_ver}\033[0m"
}
prepare() {
    cd "${srcdir}/${pkgname%-git}.git"
    _get_electron_version
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-git}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_appname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname%-git}.sh"
    gendesk -q -f -n \
        --pkgname="${pkgname%-git}" \
        --pkgdesc="${pkgdesc}" \
        --categories="Development" \
        --name="${_pkgname}" \
        --exec="${pkgname%-git} %U"
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    HOME="${srcdir}/.electron-gyp"
    {
        echo -e '\n'
        #echo 'build_from_source=true'
        echo "cache=${srcdir}/.npm_cache"
        echo "maxsockets=10"
    } >> .npmrc
    if [[ "$(curl -s ipinfo.io/country)" == *"CN"* ]]; then
        {
            echo 'registry=https://registry.npmmirror.com'
            echo 'electron_mirror=https://registry.npmmirror.com/-/binary/electron/'
            echo 'electron_builder_binaries_mirror=https://registry.npmmirror.com/-/binary/electron-builder-binaries/'
        } >> .npmrc
        find ./ -type f -name "package-lock.json" -exec sed -i "s/registry.npmjs.org/registry.npmmirror.com/g" {} +
    fi
    _ensure_local_nvm
    sed -i "s/\"electron\": \"[^\"]*\"/\"electron\": \"${SYSTEM_ELECTRON_VERSION}\"/g" package.json
    NODE_ENV=development    npm install
    NODE_ENV=development    npm add -D @electron-forge/plugin-local-electron
}
build() {
    cd "${srcdir}/${pkgname%-git}.git"
    _ensure_local_nvm
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    local electronDist="/usr/lib/electron${_electronversion}"
    sed -i "/^[[:space:]]*plugins:[[:space:]]*\[.*\$/a\\
    {\\
        name: \"@electron-forge/plugin-local-electron\",\\
        config: {\\
            electronPath: \'${electronDist}\',\\
        },\\
    }," forge.config.*
    NODE_ENV=production     npm run package
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm644 "${srcdir}/${pkgname%-git}.git/out/${_appname}-linux-"*/resources/app.asar -t "${pkgdir}/usr/lib/${pkgname%-git}"
    cp -Pr --no-preserve=ownership "${srcdir}/${pkgname%-git}.git/out/${_appname}-linux-"*/resources/{assets,bin,cli,wp-files} "${pkgdir}/usr/lib/${pkgname%-git}"
    install -Dm644 "${srcdir}/${pkgname%-git}.git/assets/studio-app-icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-git}.png"
    install -Dm644 "${srcdir}/${pkgname%-git}.git/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname%-git}.git/LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}