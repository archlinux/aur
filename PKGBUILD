# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=siyuan-git
pkgver=3.8.3.r0.g8641553
_electronversion=44
_nodeversion=24
pkgrel=1
pkgdesc="An open-source, privacy-first, self-hosted knowledge workspace where humans and AI agents work together 开源、隐私优先、自托管的知识工作空间，让人与智能体在此协作"
arch=('x86_64')
url="https://b3log.org/siyuan"
_ghurl="https://github.com/siyuan-note/siyuan"
license=('AGPL-3.0-only')
conflicts=(
    "${pkgname%-git}"
    "${pkgname%-git}-note"
)
provides=(
    "${pkgname%-git}"
)
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'gendesk'
    'git'
    'nvm'
    'npm'
    'go'
    'curl'
    'pnpm'
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
	export ELECTRON_DIST="/usr/lib/electron${_electronversion}"
	export ELECTRON_OVERRIDE_DIST_PATH="${ELECTRON_DIST}"
	export ELECTRON_SKIP_BINARY_DOWNLOAD=1
	_ev="$(electron${_electronversion} -v)"
	export SYSTEM_ELECTRON_VERSION="${_ev#v}"
	export XDG_CACHE_HOME="${srcdir}/.cache"
	export XDG_CONFIG_HOME="${srcdir}/.config"
	export XDG_DATA_HOME="${srcdir}/.local/share"
	export XDG_STATE_HOME="${srcdir}/.local/state"
	export PNPM_CACHE_DIR="${srcdir}/.pnpm_cache"
	export PNPM_STORE_DIR="${srcdir}/.pnpm_store"
	export PNPM_GLOBAL_DIR="${srcdir}/.pnpm/global"
	export PNPM_GLOBAL_BIN_DIR="${srcdir}/.pnpm/bin"
	export PNPM_STATE_DIR="${srcdir}/.pnpm/state"
	export PNPM_CONFIG_MINIMUM_RELEASE_AGE=0
	export PNPM_NODE_LINKER=hoisted
	export PNPM_FETCH_RETRIES=3
	export PNPM_FETCH_RETRY_MAXTIMEOUT=10000
	export PNPM_UPDATE_NOTIFIER=false
	export PNPM_NO_COLOR=true
	export PNPM_NO_PROGRESS=true
	export pnpm_config_platform=linux
	export pnpm_config_arch="${CARCH}"
	export COREPACK_HOME="${srcdir}/.corepack"
	export NODE_OPTIONS="--max-old-space-size=4096"
	export npm_config_node_options="--max-old-space-size=4096"
    export GOPATH="${srcdir}/go"
	export GOMODCACHE="${GOPATH}/pkg/mod"
	export GOBIN="${GOPATH}/bin"
	export GOCACHE="${srcdir}/go-build"
	export GOENV="${srcdir}/go/env"
	export XDG_CONFIG_HOME="${srcdir}/.config"
	export XDG_CACHE_HOME="${srcdir}/.cache"
	export CGO_ENABLED=1
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	export GOTOOLCHAIN=local
	export GOWORK=off
	mkdir -p "${GOMODCACHE}" "${GOBIN}" "${GOCACHE}" "${XDG_CONFIG_HOME}" "${XDG_CACHE_HOME}" "$(dirname "${GOENV}")"
	: > "${GOENV}"
}
_get_electron_version() {
    _elec_ver=$(find "${srcdir}" -maxdepth 5 -name "package.json" ! -path "*/node_modules/*" \
        -exec grep -l '"electron"' {} + | xargs -I{} jq -r '(.devDependencies.electron // .dependencies.electron) // empty' {} 2>/dev/null | head -1)
    [[ -z "${_elec_ver}" ]] && return 1
    echo -e "The electron version is: \033[1;31m${_elec_ver%%.*}\033[0m"
}
prepare() {
    cd "${srcdir}/${pkgname//-/.}/app"
    _get_electron_version
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-git}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/SiYuan-Electron/g
    " "${srcdir}/${pkgname%-git}.sh"
    _set_build_env
    _ensure_local_nvm
    gendesk -q -f -n \
        --pkgname="${pkgname%-git}" \
        --pkgdesc="${pkgdesc}" \
        --categories="Office" \
        --name="${pkgname%-git}" \
        --exec="${pkgname%-git} %U" \
        --custom="Name[zh_CN]=思源笔记"
    sed -i "/build:mobile/d;s/\"electron\": \"\([^\"]*\)\"/\"electron\": \"${SYSTEM_ELECTRON_VERSION}\"/g" package.json
    NODE_ENV=development    pnpm install --no-frozen-lockfile
}
build() {
    _set_build_env
    _ensure_local_nvm
    cd "${srcdir}/${pkgname//-/.}/app"
    NODE_ENV=production     pnpm run build
    cd "${srcdir}/${pkgname//-/.}/kernel"
    case "${CARCH}" in
        aarch64)
            _CFG_FILE=electron-builder-linux-arm64.yml
            _KERNEL_DIR=kernel-linux-arm64
            ;;
        x86_64)
            _CFG_FILE=electron-builder-linux.yml
            _KERNEL_DIR=kernel-linux
            ;;
    esac
    go build --tags fts5 -o "../app/${_KERNEL_DIR}/SiYuan-Kernel" -v -ldflags "-s -w -X github.com/siyuan-note/siyuan/kernel/util.Mode=prod"
    cd "${srcdir}/${pkgname//-/.}/app"
    NODE_ENV=production pnpm -c exec "electron-builder --linux dir -c.electronDist=${ELECTRON_DIST} --config ${_CFG_FILE} "
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-git}"
	local _app_dir=$(find "${srcdir}" -type f -name "resources.pak" -exec dirname {} + | head -n 1)
	cp -a "${_app_dir}/resources/"* "${pkgdir}/usr/lib/${pkgname%-git}/"
    icon_sizes=(16x16 32x32 48x48 64x64 128x128 256x256 512x512)
    for _icons in "${icon_sizes[@]}";do
        install -Dm644 "${srcdir}/${pkgname//-/.}/app/src/assets/icon/${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-git}.png"
    done
    install -Dm644 "${srcdir}/${pkgname//-/.}/app/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
}