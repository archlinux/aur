# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=elevate-git
pkgver=7.2.2.r3.gdf9e2ce
_electronversion=27
_nodeversion=18
pkgrel=1
pkgdesc="A sport app to 'Elevate' your training experience and goals! Track your fitness and progressions over time. Analyse deeper your activities. And more...Use system-wide electron."
arch=('any')
url="https://thomaschampagne.github.io/elevate-docs/"
_ghurl="https://github.com/thomaschampagne/elevate"
license=('MPL-2.0')
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'npm'
    'git'
    'nvm'
    'gendesk'
    'curl'
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
_get_electron_version() {
    _elec_ver="$(grep '"electron":' "${srcdir}/${pkgname//-/.}/desktop/package.json" | cut -d'"' -f4 | tr -d '^' | cut -d. -f1)"
    echo -e "The electron version is: \033[1;31m${_elec_ver}\033[0m"
}
prepare() {
    cd "${srcdir}/${pkgname//-/.}"
    _get_electron_version
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-git}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${pkgname%-git}-sports-app/g
        s/@options@//g
    " -i "${srcdir}/${pkgname%-git}.sh"
    _ensure_local_nvm
    gendesk -q -f -n \
        --pkgname="${pkgname%-git}" \
        --pkgdesc="${pkgdesc}" \
        --categories="Utility" \
        --name="${pkgname%-git}" \
        --exec="${pkgname%-git} %U"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
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
        echo appcore desktop webextension | xargs -n 1 cp .npmrc
    fi
    sed -i -e "
        s/npm install/NODE_ENV=development npm install/g
        s/\"electron\": \"[^\"]*\"/\"electron\": \"${SYSTEM_ELECTRON_VERSION}\"/g
    " desktop/package.json
    NODE_ENV=development    npm add -D husky
    NODE_ENV=development    npm install
}
build() {
    cd "${srcdir}/${pkgname//-/.}/desktop"
    local electronDist="/usr/lib/electron${_electronversion}"
    NODE_ENV=production     npm run build:prod
    NODE_ENV=production     npm exec -c "electron-builder build --linux dir -c.electronDist=${electronDist}"
    rm -rf "${srcdir}/${pkgname//-/.}/desktop/package/linux-"*/resources/app.asar.unpacked/node_modules/7zip-bin/mac
    case "${CARCH}" in
        aarch64)
            rm -rf "${srcdir}/${pkgname//-/.}/desktop/package/linux-"*/resources/app.asar.unpacked/node_modules/7zip-bin/linux/{arm,ia32,x64}
            ;;
        armv7h)
            rm -rf "${srcdir}/${pkgname//-/.}/desktop/package/linux-"*/resources/app.asar.unpacked/node_modules/7zip-bin/linux/{arm64,ia32,x64}
            ;;
        i686)
            rm -rf "${srcdir}/${pkgname//-/.}/desktop/package/linux-"*/resources/app.asar.unpacked/node_modules/7zip-bin/linux/{arm,arm64,x64}
            ;;
        x86_64)
            rm -rf "${srcdir}/${pkgname//-/.}/desktop/package/linux-"*/resources/app.asar.unpacked/node_modules/7zip-bin/linux/{arm,arm64,ia32}
            ;;
    esac
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm644 "${srcdir}/${pkgname//-/.}/desktop/package/linux-"*/resources/app.asar -t "${pkgdir}/usr/lib/${pkgname%-git}"
    cp -Pr --no-preserve=ownership "${srcdir}/${pkgname//-/.}/desktop/package/linux-"*/resources/app.asar.unpacked "${pkgdir}/usr/lib/${pkgname%-git}"
    install -Dm644 "${srcdir}/${pkgname//-/.}/desktop/res/icons/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-git}.png"
    install -Dm644 "${srcdir}/${pkgname//-/.}/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname//-/.}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}