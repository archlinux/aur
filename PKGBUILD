# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=mustang-git
_pkgname=Mustang
pkgver=0.9.27.r4.g7bed9c6
_electronversion=41
_nodeversion=24
pkgrel=1
pkgdesc="New full-featured desktop email, chat and video conference client.(Use system-wide electron)"
arch=('any')
url="https://mustang.im/"
_ghurl="https://github.com/mustang-im/mustang"
license=('LicenseRef-EUPL-1.2')
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
    'yarn'
    'gendesk'
    'jq'
)
source=(
    "${pkgname//-/.}::git+${_ghurl}.git"
    "${pkgname%-git}.sh"
)
sha256sums=('SKIP'
            'a774c2f54fbbeeaac3cefc0f7250796d30c86d27f0fd40b7eaf9c0fdb021623d')
pkgver() {
    cd "${srcdir}/${pkgname%-git}.git"
    set -o pipefail
    git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/v//g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}
_ensure_local_nvm() {
    local NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install "${_nodeversion}"
    nvm use "${_nodeversion}"
}
_get_electron_version() {
    _elec_ver=$(find "${srcdir}" -maxdepth 3 -name "package.json" ! -name "node_modules" \
        -exec jq -r '.devDependencies.electron // empty' {} + 2>/dev/null | grep -v "^$" | head -n 1)
    _elec_ver=$(echo "${_elec_ver}" | sed 's/[^0-9.]//g')
    _main_ver=$(echo "${_elec_ver}" | cut -d. -f1)
    echo -e "The electron version is: \033[1;31m${_main_ver}\033[0m"
}
prepare() {
    cd "${srcdir}/${pkgname//-/.}"
    _get_electron_version
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-git}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${pkgname%-git}/g
    " "${srcdir}/${pkgname%-git}.sh"
    gendesk -q -f -n \
        --pkgname="${pkgname%-git}" \
        --pkgdesc="${pkgdesc}" \
        --categories="Network" \
        --name="${_pkgname}" \
        --exec="${pkgname%-git} %U"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    local HOME="${srcdir}/.electron-gyp"
    mkdir -p "${srcdir}/.electron-gyp"
    if [[ "$(curl -s ipinfo.io/country)" == *"CN"* ]]; then
        export YARN_REGISTRY="https://registry.npmmirror.com"
        export NODEJS_ORG_MIRROR="https://npmmirror.com/mirrors/node"
        export NPM_CONFIG_REGISTRY="https://registry.npmmirror.com"
        export ELECTRON_MIRROR="https://registry.npmmirror.com/-/binary/electron/"
        export ELECTRON_BUILDER_BINARIES_MIRROR="https://registry.npmmirror.com/-/binary/electron-builder-binaries/"
        export NODIST_URL_BASE="https://npmmirror.com/mirrors/node/"
        export npm_config_disturl="https://npmmirror.com/mirrors/node/"
        export npm_config_devdir="${srcdir}/.node-gyp"
        export YARN_CACHE_FOLDER="${srcdir}/.yarn/cache"
        export YARN_PLUGINS_FOLDER="${srcdir}/.yarn/plugins"
        export YARN_GLOBAL_FOLDER="${srcdir}/.yarn/global"
        export YARN_USE_HARDLINKS=true
        # export YARN_BUILD_FROM_SOURCE=true
        export YARN_LINK_WORKSPACE_PACKAGES=true
        export YARN_FETCH_RETRIES=3
        export YARN_FETCH_RETRY_TIMEOUT=10000
        export YARN_NETWORK_CONCURRENCY=32
        yarn config set registry "https://registry.npmmirror.com"
        npm config set registry "https://registry.npmmirror.com"
    fi
    _ensure_local_nvm
    cd "${srcdir}/${pkgname//-/.}/app/build"
    sh "${pkgname%-git}-brand.sh"
    cd "${srcdir}/${pkgname//-/.}/app"
    NODE_ENV=development    yarn install --cache-folder "${srcdir}/.yarn_cache"
    cd "${srcdir}/${pkgname//-/.}/lib"
    NODE_ENV=development    yarn install --cache-folder "${srcdir}/.yarn_cache"
    cd "${srcdir}/${pkgname//-/.}/desktop"
    sed -i "s/\"electron\": \"[^\"]*\"/\"electron\": \"${SYSTEM_ELECTRON_VERSION}\"/g" package.json
    NODE_ENV=development    yarn install --cache-folder "${srcdir}/.yarn_cache"
    cd "${srcdir}/${pkgname//-/.}/desktop/backend"
    NODE_ENV=development    yarn install --cache-folder "${srcdir}/.yarn_cache"
    NODE_ENV=development    yarn add -D semver
}
build() {
    cd "${srcdir}/${pkgname//-/.}/desktop"
    _ensure_local_nvm
    local electronDist="/usr/lib/electron${_electronversion}"
    NODE_OPTIONS="--max-old-space-size=4096" NODE_ENV=production     yarn run build
    NODE_ENV=production     yarn electron-builder --linux dir -c.electronDist="${electronDist}" --config electron-builder.yml
    find "${srcdir}/${pkgname//-/.}/desktop/dist/linux-"*"/resources/app.asar.unpacked" -type d \
        \( -name "darwin-*" -o -name "win32-*" \) -exec rm -rf {} +
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-git}"
	local _app_dir=$(find "${srcdir}" -type f -name "resources.pak" -exec dirname {} + | head -n 1)
	cp -a "${_app_dir}/resources/". "${pkgdir}/usr/lib/${pkgname%-git}/"
    install -Dm644 "${srcdir}/${pkgname//-/.}/desktop/build/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname//-/.}/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname//-/.}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
