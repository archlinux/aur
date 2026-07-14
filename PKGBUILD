# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=pupu-git
_pkgname=PuPu
pkgver=0.1.8.r0.g327097b
_electronversion=40
_nodeversion=20
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
    'python312'
)
source=(
    "${pkgname//-/.}::git+${url}.git"
    "unchain::git+https://github.com/haoxiang-xu/unchain.git"
    "${pkgname%-git}.sh"
)
sha256sums=('SKIP'
            'SKIP'
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
_set_build_env() {
    export ELECTRON_DIST="/usr/lib/electron${_electronversion}"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    export HOME="${srcdir}/.electron-gyp"
    export NPM_CONFIG_CACHE="${srcdir}/.npm_cache"
    export NPM_CONFIG_MAXSOCKETS=32
    if [[ "$(curl -s ipinfo.io/country)" == *"CN"* ]]; then
        {
            export NPM_CONFIG_REGISTRY="https://registry.npmmirror.com"
            export NODEJS_ORG_MIRROR="https://npmmirror.com/mirrors/node"
            export ELECTRON_MIRROR="https://npmmirror.com/mirrors/electron/"
            export ELECTRON_BUILDER_BINARIES_MIRROR="https://npmmirror.com/mirrors/electron-builder-binaries/"
        }
        find ./ -type f -name "package-lock.json" -exec sed -i "s/registry.npmjs.org/registry.npmmirror.com/g" {} +
    fi
}
_get_app_dir() {
    find "${srcdir}" -type f -name "resources.pak" -exec dirname {} + | head -n 1
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
    _set_build_env
    _ensure_local_nvm
    sed -i "s/sys.version_info\[:2\] == (3, 12)/sys.version_info[0] == 3 and sys.version_info[1] >= 12/g" unchain_runtime/scripts/build_unchain_server.sh
    sed -i "s/sys.version_info\[:2\] == (3, 12)/sys.version_info[0] == 3 and sys.version_info[1] >= 12/g" scripts/init_python312_venv.sh
    find src -type f -exec sed -i "s/process.resourcesPath/\'\/usr\/lib\/${pkgname%-git}\'/g" {} +
    sed -i "s/\"electron\": \"[^\"]*\"/\"electron\": \"${SYSTEM_ELECTRON_VERSION}\"/g" package.json
    NODE_ENV=development    npm install
}
build() {
    cd "${srcdir}/${pkgname//-/.}"
    _set_build_env
    _ensure_local_nvm
    export PUPU_BUILD_VERSION="$(node -p "require('./package.json').version")"
    export UNCHAIN_SOURCE_PATH="${srcdir}/unchain"
    rm -rf "${srcdir}/.venv"
    python3.12 -m venv "${srcdir}/.venv"
    source "${srcdir}/.venv/bin/activate"
    python -m pip install --upgrade pip
    python -m pip install -r unchain_runtime/server/requirements.txt -e ../unchain pyinstaller
    export UNCHAIN_BUILD_VENV="${srcdir}/.venv"
    export UNCHAIN_BUILD_SKIP_INSTALL=1
    NODE_ENV=production     npm run build:unchain:linux
    NODE_ENV=production     npm run build:web
    NODE_ENV=production     npm exec -c "electron-builder --linux dir -c.electronDist=${ELECTRON_DIST}"
}

package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-git}"
	local _app_dir=$(_get_app_dir)
	cp -a "${_app_dir}/resources/"* "${pkgdir}/usr/lib/${pkgname%-git}/"
    _icon_sizes=(192 512)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/${pkgname//-/.}/public/logo${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}x${_icons}/apps/${pkgname%-git}.png"
    done
    install -Dm644 "${srcdir}/${pkgname//-/.}/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname//-/.}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
