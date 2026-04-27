# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=pupu-git
_pkgname=PuPu
pkgver=0.1.5.r61.g49c4192
_electronversion=40
_nodeversion=24
pkgrel=1
pkgdesc="A simple and easy to use UI for the Ollama.(Use system-wide electron)"
arch=('any')
url="https://github.com/haoxiang-xu/PuPu"
license=('MIT')
provides=("${pkgname%-git}=${pkgver%.r*}")
conflicts=("${pkgname%-git}")
depends=(
    "electron${_electronversion}"
    'ollama'
    'python'
    'python-numpy'
    'python-flask'
    'python-httpx'
    'python-werkzeug'
    'python-openai'
)
makedepends=(
    'npm'
    'nvm'
    'git'
    'curl'
    'gendesk'
    'jq'
)
source=(
    "${pkgname//-/.}::git+${url}.git"
    "unchain::git+https://github.com/haoxiang-xu/unchain.git"
    "${pkgname%-git}.sh"
)
sha256sums=('SKIP'
            'SKIP'
            '0386164f4c9dff659cf8d7a5b015dd62754927824a5dfe1000003e7b7d963020')
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
    _elec_ver=$(jq -r '.devDependencies["electron"] // .dependencies["electron"]' "${srcdir}/${pkgname//-/.}/package.json" | tr -d '^')
    _main_ver=$(echo "${_elec_ver}" | cut -d. -f1)
    echo -e "The electron version is: \033[1;31m${_main_ver}\033[0m"
}
prepare() {
    cd "${srcdir}/${pkgname//-/.}"
    _get_electron_version
    sed -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-git}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${pkgname%-git}/g
    " -i "${srcdir}/${pkgname%-git}.sh"
    gendesk -q -f -n \
        --pkgname="${pkgname%-git}" \
        --pkgdesc="${pkgdesc}" \
        --categories="Utility" \
        --name="${_pkgname}" \
        --exec="${pkgname%-git} %U"
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    local HOME="${srcdir}/.electron-gyp"
    export NPM_CONFIG_CACHE="${srcdir}/.npm_cache"
    export NPM_CONFIG_MAXSOCKETS=32
    if [[ "$(curl -s ipinfo.io/country)" == *"CN"* ]]; then
        {
            export NPM_CONFIG_REGISTRY="https://registry.npmmirror.com"
            export NPM_CONFIG_ELECTRON_MIRROR="https://registry.npmmirror.com/-/binary/electron/"
            export NPM_CONFIG_ELECTRON_BUILDER_BINARIES_MIRROR="https://registry.npmmirror.com/-/binary/electron-builder-binaries/"
        }
        find ./ -type f -name "package-lock.json" -exec sed -i "s/registry.npmjs.org/registry.npmmirror.com/g" {} +
    fi
    _ensure_local_nvm
    sed -i "s/sys.version_info\[:2\] == (3, 12)/sys.version_info[0] == 3 and sys.version_info[1] >= 12/g" unchain_runtime/scripts/build_unchain_server.sh
    sed -i "s/sys.version_info\[:2\] == (3, 12)/sys.version_info[0] == 3 and sys.version_info[1] >= 12/g" scripts/init_python312_venv.sh
    find src -type f -exec sed -i "s/process.resourcesPath/\'\/usr\/lib\/${pkgname%-git}\'/g" {} +
    sed -i "s/\"electron\": \"[^\"]*\"/\"electron\": \"${SYSTEM_ELECTRON_VERSION}\"/g" package.json
    NODE_ENV=development    npm install
}
build() {
    cd "${srcdir}/${pkgname//-/.}"
    _ensure_local_nvm
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export PUPU_VERSION_PREPARED=1
    local electronDist="/usr/lib/electron${_electronversion}"
    NODE_ENV=production     npm run build:unchain:linux
    NODE_ENV=production     npm run build:web
    NODE_ENV=production     npm exec -c "electron-builder --linux dir -c.electronDist=${electronDist}"
}

package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
    cd "${srcdir}/${pkgname//-/.}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-git}"
    local _resources="dist/linux-unpacked/resources"
    cp -a "${_resources}/." "${pkgdir}/usr/lib/${pkgname%-git}/"
    _icon_sizes=(192 512)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/${pkgname//-/.}/public/logo${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}x${_icons}/apps/${pkgname%-git}.png"
    done
    install -Dm644 "${srcdir}/${pkgname//-/.}/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname//-/.}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}