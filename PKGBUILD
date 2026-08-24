# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Butui Hu <hot123tea123@gmail.com>
pkgname=motrix-git
_debname="app.${pkgname%-git}.native"
_pkgname=Motrix
pkgver=2.0.0.beta.25.r0.g804891b
_electronversion=43
_nodeversion=24
pkgrel=1
pkgdesc="A full-featured download manager that supports downloading HTTP, FTP, BitTorrent, Magnet, etc.(Use system-wide electron)"
arch=(
    'aarch64'
    'armv7h'
    'x86_64'
)
url="https://motrix.app/"
_ghurl="https://github.com/agalwood/Motrix"
_giteeurl="https://gitee.com/mirrors/motrix"
license=('MIT')
provides=("${pkgname%-git}=${pkgver}")
conflicts=(
    "${pkgname%-git}"
    "${pkgname%-git}-bin"
)
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'git'
    'pnpm'
    'npm'
    'nvm'
    'curl'
    'jq'
    'rustup'
)
optdepends=(
    'ffmpeg'
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
_get_app_dir() {
    find "${srcdir}" -type f -name "resources.pak" -exec dirname {} + | head -n 1
}
_set_build_env() {
    export ELECTRON_DIST="/usr/lib/electron${_electronversion}"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    export HOME="${srcdir}/.electron-gyp"
    export CARGO_HOME="${srcdir}/.cargo"
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
            export NPM_CONFIG_ELECTRON_MIRROR="https://registry.npmmirror.com/-/binary/electron/"
            export NPM_CONFIG_ELECTRON_BUILDER_BINARIES_MIRROR="https://registry.npmmirror.com/-/binary/electron-builder-binaries/"
            export NODEJS_ORG_MIRROR="https://npmmirror.com/mirrors/node"
            export RUSTUP_DIST_SERVER="https://mirrors.aliyun.com/rustup"
            export RUSTUP_UPDATE_ROOT="https://mirrors.aliyun.com/rustup/rustup"
        }
    fi
}
_get_electron_version() {
    _elec_ver=$(find "${srcdir}" -maxdepth 5 -name "package.json" ! -path "*/node_modules/*" \
        -exec grep -l '"electron"' {} + | xargs -I{} jq -r '(.devDependencies.electron // .dependencies.electron) // empty' {} 2>/dev/null | head -1)
    [[ -z "${_elec_ver}" ]] && return 1
    echo -e "The electron version is: \033[1;31m${_elec_ver%%.*}\033[0m"
}
_ensure_local_nvm() {
    local NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install "${_nodeversion}"
    nvm use "${_nodeversion}"
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
    _set_build_env
    _ensure_local_nvm
    sed -i -e "
        s/Exec=start-${pkgname%-git}/Exec=${pkgname%-git}/g
        s/Icon=${_debname}/Icon=${pkgname%-git}/g
    " "flatpak/${_debname}.desktop"
    sed -i "s/${_debname}/${pkgname%-git}/g" "flatpak/${_debname}.metainfo.xml"
    # Replace process.resourcesPath with system-wide install path in source files
    # Only replace property access patterns, not string literals
    local _rp="'/usr/lib/${pkgname%-git}'"
    find src -type f -name '*.ts' -exec sed -i \
        -e "s|: process\.resourcesPath,|: ${_rp},|g" \
        -e "s|path\.join(process\.resourcesPath,|path.join(${_rp},|g" \
        -e "s|path\.join(process\.resourcesPath |path.join(${_rp} |g" \
        -e "s|(process\.resourcesPath |(${_rp} |g" \
        {} +
    rustup default stable
    sed -i "s/\"electron\": \"[^\"]*\"/\"electron\": \"${SYSTEM_ELECTRON_VERSION}\"/g" package.json
    MOTRIX_SKIP_ENGINE_FETCH=1 pnpm install
    node node_modules/electron/install.js
}
build() {
    cd "${srcdir}/${pkgname//-/.}"
    _set_build_env
    _ensure_local_nvm
    # Determine target architecture
    case "${CARCH}" in
        x86_64)  _arch="x64" ;;
        aarch64) _arch="arm64" ;;
        armv7h)  _arch="armv7l" ;;
        *)       _arch="x64" ;;
    esac
    pnpm run fetch:engine --platform linux --arch "${_arch}"
    pnpm run build:builtin
    # Install the musl Rust target required by the upstream build configuration
    # (CI uses x86_64-unknown-linux-musl / aarch64-unknown-linux-musl)
    case "${CARCH}" in
        x86_64)  rustup target add x86_64-unknown-linux-musl ;;
        aarch64) rustup target add aarch64-unknown-linux-musl ;;
    esac
    pnpm run build:native-host -- --platform linux --arch "${_arch}"
    pnpm run build:electron
    pnpm run stage:electron -- --platform linux --arch "${_arch}"
    pnpm exec electron-builder --linux dir -c.electronDist="${ELECTRON_DIST}"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-git}"
	local _app_dir=$(_get_app_dir)
	cp -a "${_app_dir}/resources/"* "${pkgdir}/usr/lib/${pkgname%-git}/"
    rm -rf "${pkgdir}/usr/lib/${pkgname%-git}/default_app.asar"
    install -Dm644 "${srcdir}/${pkgname//-/.}/flatpak/${_debname}.desktop" \
        "${pkgdir}/usr/share/applications/${pkgname%-git}.desktop"
    install -Dm644 "${srcdir}/${pkgname//-/.}/flatpak/${_debname}.metainfo.xml" \
        "${pkgdir}/usr/share/metainfo/${pkgname%-git}.metainfo.xml"
    install -Dm644 "${srcdir}/${pkgname//-/.}/build/256x256.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-git}.png"
    install -Dm644 "${srcdir}/${pkgname//-/.}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
