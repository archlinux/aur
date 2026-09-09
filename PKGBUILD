# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=stoat-desktop-git
_pkgname=Stoat
_debname="chat.stoat.${_pkgname}Desktop"
pkgver=1.5.3.r3.g68cfeb5
_electronversion=43
_nodeversion=26
pkgrel=1
pkgdesc="Stoat for Desktop."
arch=(
    'aarch64'
    'x86_64'
)
url="https://stoat.chat/"
_ghurl="https://github.com/stoatchat/for-desktop"
license=('AGPL-3.0-only')
provides=("${pkgname%-git}=${pkgver%.r*}")
conflicts=("${pkgname%-git}")
depends=(
    "electron${_electronversion}"
    'libpipewire'
)
makedepends=(
    'git'
    'curl'
    'jq'
    'zip'
    'pnpm'
    'nvm'
)
source=(
    "${pkgname%-git}.git::git+${_ghurl}.git"
    "${pkgname%-git}.sh"
)
sha256sums=('SKIP'
            'a774c2f54fbbeeaac3cefc0f7250796d30c86d27f0fd40b7eaf9c0fdb021623d')
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
_get_app_dir() {
    find "${srcdir}" -type f -name "resources.pak" -exec dirname {} + | head -n 1
}
_set_build_env() {
    export ELECTRON_DIST="/usr/lib/electron${_electronversion}"
    export ELECTRON_OVERRIDE_DIST_PATH="/usr/lib/electron${_electronversion}"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    export HOME="${srcdir}/.electron-gyp"
    export ELECTRON_ZIP_DIR="/usr/lib/electron${_electronversion}"
    {
        export PNPM_LINK_WORKSPACE_PACKAGES=true
        export PNPM_FETCH_RETRY_MAXTIMEOUT=10000
        export PNPM_CACHE_DIR="${srcdir}/.pnpm_cache"
        export PNPM_STORE_DIR="${srcdir}/.pnpm_store"
        export PNPM_VIRTUAL_STORE_DIR="${srcdir}/.pnpm_store"
        export PNPM_SHAMEFULLY_HOIST=true
        export PNPM_VIRTUAL_STORE_DIR_MAX_LENGTH=80
        export PNPM_NODE_LINKER=hoisted
        export PNPM_NETWORK_CONCURRENCY=32
    }
    if [[ "$(curl -s ipinfo.io/country)" == *"CN"* ]]; then
        {
            export pnpm_config_registry="https://registry.npmmirror.com"
            export npm_config_registry="https://registry.npmmirror.com"
            export NPM_CONFIG_ELECTRON_MIRROR="https://registry.npmmirror.com/-/binary/electron/"
            export NPM_CONFIG_ELECTRON_BUILDER_BINARIES_MIRROR="https://registry.npmmirror.com/-/binary/electron-builder-binaries/"
            export NODEJS_ORG_MIRROR="https://npmmirror.com/mirrors/node"
        }
    fi
}
_get_electron_version() {
    _elec_ver=$(find "${srcdir}" -maxdepth 5 -name "package.json" ! -path "*/node_modules/*" \
        -exec grep -l '"electron"' {} + | xargs -I{} jq -r '(.devDependencies.electron // .dependencies.electron) // empty' {} 2>/dev/null | head -1)
    [[ -z "${_elec_ver}" ]] && return 1
    echo -e "The electron version is: \033[1;31m${_elec_ver%%.*}\033[0m"
}
prepare() {
    cd "${srcdir}/${pkgname%-git}.git"
    _get_electron_version
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-git}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${pkgname%-git}/g
    " "${srcdir}/${pkgname%-git}.sh"
    _ensure_local_nvm
    _set_build_env
    sed -i "s/Icon=${_debname}/Icon=${pkgname%-git}/g" "${_debname}.desktop"
    sed -i "s/${_debname}/${pkgname%-git}/g" "${_debname}.metainfo.xml"
    sed -i "s/\"electron\": \"[^\"]*\"/\"electron\": \"${SYSTEM_ELECTRON_VERSION}\",\n    \"@electron\/packager\": \"*\"/g" package.json
    git -c submodule."assets".update=checkout submodule update --init assets
    NODE_ENV=development    pnpm install
    local _v="${SYSTEM_ELECTRON_VERSION}"
	local _zd="${srcdir}/electron-zips"
	local _zf="${_zd}/electron-v${_v}-linux-x64.zip"
	install -Dm755 -d "${_zd}"
	( cd "${ELECTRON_DIST}" && zip -r -q -0 "${_zf}" . )
	sed -i "/packagerConfig:[[:space:]]*{/a\\    electronZipDir: '${_zd}'," forge.config.*
}
build() {
    cd "${srcdir}/${pkgname%-git}.git"
    _ensure_local_nvm
    _set_build_env
    NODE_ENV=production     pnpm run package
    local _app_dir=$(_get_app_dir)
    #rm -rf \
    #    "${_app_dir}/resources/app.asar.unpacked/node_modules/@electron-internal/extract-zip/"{*darwin*,*win32*} \
    #    "${_app_dir}/resources/app.asar.unpacked/node_modules/bufferutil/prebuilds/"{darwin-*,win32-*} \
    #    "${_app_dir}/resources/app.asar.unpacked/node_modules/utf-8-validate/prebuilds/"{darwin-*,win32-*}
    #case "${CARCH}" in
    #    aarch64)
    #        rm -rf "${_app_dir}/resources/app.asar.unpacked/node_modules/@electron-internal/extract-zip/"*x64*
    #        ;;
    #    x86_64)
    #        rm -rf "${_app_dir}/resources/app.asar.unpacked/node_modules/@electron-internal/extract-zip/"*arm*
    #        ;;
    #esac
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-git}"
	local _app_dir=$(_get_app_dir)
	cp -a "${_app_dir}/resources/"* "${pkgdir}/usr/lib/${pkgname%-git}/"
    install -Dm644 "${srcdir}/${pkgname%-git}.git/assets/desktop/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-git}.png"
    install -Dm644 "${srcdir}/${pkgname%-git}.git/${_debname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-git}.desktop"
    install -Dm644 "${srcdir}/${pkgname%-git}.git/${_debname}.metainfo.xml" "${pkgdir}/usr/share/metainfo/${pkgname%-git}.metainfo.xml"
    install -Dm644 "${srcdir}/${pkgname%-git}.git/README.md" -t "${pkgdir}/usr/share/doc/${pkgname%-git}"
}
