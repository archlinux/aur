# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=boson-git
pkgver=0.6.1.r0.g4b4a6a2
_electronversion=41
_nodeversion=24
pkgrel=1
pkgdesc="SDSS observer graphical interface.(Use system-wide electron)"
arch=('any')
url="https://albireox.github.io/boson/"
_ghurl="https://github.com/albireox/boson"
license=('BSD-3-Clause')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}=${pkgver%.r*}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'npm'
    'yarn'
    'git'
    'nvm'
    'gendesk'
    'curl'
    'jq'
)
source=(
    "${pkgname//-/.}::git+${_ghurl}.git"
    "${pkgname%-git}.sh"
)
sha256sums=('SKIP'
            'a774c2f54fbbeeaac3cefc0f7250796d30c86d27f0fd40b7eaf9c0fdb021623d')
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
_get_app_dir() {
    find "${srcdir}" -type f -name "resources.pak" -exec dirname {} + | head -n 1
}
_set_build_env() {
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    export HOME="${srcdir}/.electron-gyp"
    export electronDist="/usr/lib/electron${_electronversion}"
    mkdir -p "${srcdir}/.electron-gyp"
    if [[ "$(curl -s ipinfo.io/country)" == *"CN"* ]]; then
        {
            export ELECTRON_MIRROR="https://registry.npmmirror.com/-/binary/electron/"
            export ELECTRON_BUILDER_BINARIES_MIRROR="https://registry.npmmirror.com/-/binary/electron-builder-binaries/"
            export NODEJS_ORG_MIRROR="https://npmmirror.com/mirrors/node"
            export YARN_CACHE_FOLDER="${srcdir}/.yarn/cache"
            export YARN_GLOBAL_FOLDER="${srcdir}/.yarn/global"
            export YARN_NETWORK_CONCURRENCY=32
            sed -i '/^npmRegistryServer:/d' .yarnrc.yml
            echo 'npmRegistryServer: "https://registry.npmmirror.com"' >> .yarnrc.yml
        }
        find ./ -type f -name "yarn.lock" -exec sed -i "s/registry.yarnpkg.com/registry.npmmirror.com/g" {} +
    fi
}
_get_electron_version() {
    _elec_ver=$(find "${srcdir}" -maxdepth 5 -name "package.json" ! -path "*/node_modules/*" \
        -exec grep -l '"electron"' {} + | xargs -I{} jq -r '(.devDependencies.electron // .dependencies.electron) // empty' {} 2>/dev/null | head -1)
    [[ -z "${_elec_ver}" ]] && return 1
    echo -e "The electron version is: \033[1;31m${_elec_ver%%.*}\033[0m"
}
prepare() {
    cd "${srcdir}/${pkgname//-/.}"
    _get_electron_version
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-git}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${pkgname%-git}/g
    " -i "${srcdir}/${pkgname%-git}.sh"
    gendesk -q -f -n \
        --pkgname="${pkgname%-git}" \
        --pkgdesc="${pkgdesc}" \
        --categories="Development" \
        --name="${pkgname%-git}" \
        --exec="${pkgname%-git} %U"
    _set_build_env
    _ensure_local_nvm
    sed -i "s/\"electron\": \"[^\"]*\"/\"electron\": \"${SYSTEM_ELECTRON_VERSION}\"/g" package.json
    _yarnver=`grep "yarn@" package.json | awk '{print $2}' | sed "s/\"//g;s/yarn@//g;s/,//g"`
    corepack enable yarn
    echo y | yarn version "${_yarnver}"
    NODE_ENV=development    yarn install
    NODE_ENV=development    yarn add -D @electron-forge/plugin-local-electron
}
build() {
    cd "${srcdir}/${pkgname//-/.}"
    _set_build_env
    _ensure_local_nvm
    sed -i -e "/^[[:space:]]*packagerConfig:[[:space:]]*{/a\\
        electronDist: \"${electronDist}\"," forge.config.*
    NODE_ENV=production     yarn run package
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-git}"
    local _app_dir=$(_get_app_dir)
    cp -a "${_app_dir}/resources/". "${pkgdir}/usr/lib/${pkgname%-git}/"
    install -Dm644 "${srcdir}/${pkgname//-/.}/public/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-git}.png"
    install -Dm644 "${srcdir}/${pkgname//-/.}/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname//-/.}/package.json" "${pkgdir}/usr/share/licenses/${pkgname}"
}
