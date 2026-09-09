# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=simpletodo-git
_pkgname=Simpletodo
pkgver=1.3.0.r5.g759bf10
_electronversion=27
_nodeversion=20
pkgrel=1
pkgdesc="A Simpletodo app. Redefine productivity. Keep tasks in check, move completed items, and organize projects—all while staying focused on what’s next."
arch=('any')
url="https://simpletodo.app/"
_ghurl="https://github.com/Simpletodo-app/simpletodo.app"
license=('MIT')
provides=("${pkgname%-git}=${pkgver%.r*}")
conflicts=("${pkgname%-git}")
depends=(
    "electron${_electronversion}"
    'nodejs'
)
makedepends=(
    'npm'
    'nvm'
    'git'
    'curl'
    'gendesk'
    'yarn'
    'jq'
    'zip'
)
options=(
    '!strip'
    '!emptydirs'
)
source=(
    "${pkgname//-/.}::git+${_ghurl}"
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
_get_electron_version() {
    _elec_ver=$(find "${srcdir}" -maxdepth 5 -name "package.json" ! -path "*/node_modules/*" \
        -exec grep -l '"electron"' {} + | xargs -I{} jq -r '(.devDependencies.electron // .dependencies.electron) // empty' {} 2>/dev/null | head -1)
    [[ -z "${_elec_ver}" ]] && return 1
    echo -e "The electron version is: \033[1;31m${_elec_ver%%.*}\033[0m"
}
_set_build_env() {
    export ELECTRON_DIST="/usr/lib/electron${_electronversion}"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    export HOME="${srcdir}/.electron-gyp"
    mkdir -p "${srcdir}/.electron-gyp"
    if [[ "$(curl -s ipinfo.io/country)" == *"CN"* ]]; then
        {
            export YARN_REGISTRY="https://registry.npmmirror.com"
            export ELECTRON_MIRROR="https://registry.npmmirror.com/-/binary/electron/"
            export ELECTRON_BUILDER_BINARIES_MIRROR="https://registry.npmmirror.com/-/binary/electron-builder-binaries/"
            export NODEJS_ORG_MIRROR="https://npmmirror.com/mirrors/node"
            export YARN_CACHE_FOLDER="${srcdir}/.yarn/cache"
            export YARN_PLUGINS_FOLDER="${srcdir}/.yarn/plugins"
            export YARN_GLOBAL_FOLDER="${srcdir}/.yarn/global"
            export YARN_USE_HARDLINKS=true
            # export YARN_BUILD_FROM_SOURCE=true
            export YARN_LINK_WORKSPACE_PACKAGES=true
            export YARN_FETCH_RETRIES=3
            export YARN_FETCH_RETRY_TIMEOUT=10000
            export YARN_NETWORK_CONCURRENCY=32
        }
        find ./ -type f -name "yarn.lock" -exec sed -i "s/registry.yarnpkg.com/registry.npmmirror.com/g" {} +
    fi
}
prepare() {
    cd "${srcdir}/${pkgname//-/.}"
    _get_electron_version
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-git}/g
        s/@runname@/app/g
        s/@cfgdirname@/${_pkgname}/g
    " "${srcdir}/${pkgname%-git}.sh"
    gendesk -q -f -n \
        --pkgname="${pkgname%-git}" \
        --pkgdesc="${pkgdesc}" \
        --categories="Utility" \
        --name="${_pkgname}" \
        --exec="${pkgname%-git} %U"
    _ensure_local_nvm
    _set_build_env
    sed -i "s/\/app\/images/.\/src\/app\/images/g" src/main.ts
    sed -i "s/\"electron\": \"[^\"]*\"/\"electron\": \"${SYSTEM_ELECTRON_VERSION}\"/g" package.json
    NODE_ENV=development    yarn install --cache-folder "${srcdir}/.yarn_cache"
    local _v="${SYSTEM_ELECTRON_VERSION}"
	local _zd="${srcdir}/electron-zips"
	local _zf="${_zd}/electron-v${_v}-linux-x64.zip"
	install -Dm755 -d "${_zd}"
	( cd "${ELECTRON_DIST}" && zip -r -q -0 "${_zf}" . )
	sed -i "/packagerConfig:[[:space:]]*{/a\\    electronZipDir: '${_zd}'," forge.config.*
}
build() {
    cd "${srcdir}/${pkgname//-/.}"
    _ensure_local_nvm
    _set_build_env
    NODE_ENV=production     yarn run package
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-git}"
	local _app_dir=$(_get_app_dir)
	cp -a "${_app_dir}/resources/"* "${pkgdir}/usr/lib/${pkgname%-git}/"
    _icon_sizes=(16x16 24x24 32x32 48x48 64x64 128x128 256x256 1024x1024)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/${pkgname//-/.}/src/app/images/appicons/icons/png/${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-git}.png"
    done
    install -Dm644 "${srcdir}/${pkgname//-/.}/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname//-/.}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}