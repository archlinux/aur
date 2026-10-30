# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=nvm-desktop-git
_pkgname='NVM Desktop'
pkgver=4.5.0.r0.g809e35c
_nodeversion=24
pkgrel=1
pkgdesc="A version management desktop client for the Nodejs."
arch=('any')
url="https://github.com/1111mp/nvm-desktop"
_nvmdurl="https://github.com/1111mp/nvmd-command"
license=('MIT')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}=${pkgver%.r*}")
depends=(
    'webkit2gtk-4.1'
    'gtk3'
    'libayatana-indicator'
    'libappindicator'
)
makedepends=(
    'gendesk'
    'npm'
    'nvm'
    'pnpm'
    'git'
    'rust'
    'librsvg'
    'patchelf'
)
source=(
    "${pkgname%-git}.git::git+${url}"
    "nvmd.git::git+${_nvmdurl}"
)
sha256sums=('SKIP')
_get_project_dir() {
    find "${srcdir}" -name "src-tauri" -type d ! -path "*/node_modules/*" 2>/dev/null | \
        while read -r tauri_dir; do
            [ -f "${tauri_dir}/Cargo.toml" ] || continue
            local dir="${tauri_dir}"
            until [ -f "${dir}/package.json" ] || [ "$dir" = "${srcdir}" ] || [ "$dir" = "/" ]; do
                dir="$(dirname "$dir")"
            done
            [ -f "${dir}/package.json" ] && { echo "$dir"; return; }
        done
}
pkgver() {
    cd "$(_get_project_dir)"
    set -o pipefail
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/v//g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}
_get_nvmd_dir() {
    find "${srcdir}" -type d -name "crates" \
        -exec test -f "{}/../Cargo.toml" -a -f "{}/../Cargo.lock" -a ! -f "{}/../tauri.conf.json" \; \
        -printf "%h\n" -quit 2>/dev/null
}
_ensure_local_nvm() {
    local NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install "${_nodeversion}"
    nvm use "${_nodeversion}"
}
_set_rust_build_env() {
    export HOME="${srcdir}/.home"
    export CARGO_HOME="${HOME}/.cargo"
    export CARGO_NET_GIT_FETCH_WITH_CLI=true
    export CARGO_NET_RETRY=5
    export CARGO_HTTP_MULTIPLEXING=false
    export CARGO_INCREMENTAL=0
    export CARGO_TERM_COLOR=never
    export CARGO_PROFILE_RELEASE_STRIP=symbols
    mkdir -p "${HOME}" "${CARGO_HOME}"
}
_set_pnpm_build_env() {
    export HOME="${srcdir}/.home"
    export XDG_CACHE_HOME="${HOME}/.cache"
    export XDG_CONFIG_HOME="${HOME}/.config"
    export XDG_DATA_HOME="${HOME}/.local/share"
    export XDG_STATE_HOME="${HOME}/.local/state"
    export PNPM_HOME="${HOME}/.pnpm/bin"
    export pnpm_config_cache_dir="${HOME}/.pnpm_cache"
    export pnpm_config_store_dir="${HOME}/.pnpm_store"
    export pnpm_config_global_dir="${HOME}/.pnpm/global"
    export pnpm_config_state_dir="${HOME}/.pnpm/state"
    export pnpm_config_node_linker=hoisted
    export pnpm_config_minimum_release_age=0
    export pnpm_config_update_notifier=false
    export COREPACK_NPM_REGISTRY="${COREPACK_NPM_REGISTRY:-${NPM_CONFIG_REGISTRY:-https://registry.npmjs.org}}"
    export COREPACK_HOME="${HOME}/.corepack"
    mkdir -p "${HOME}" "${PNPM_HOME}" "${pnpm_config_cache_dir}" "${pnpm_config_store_dir}" "${pnpm_config_global_dir}" "${pnpm_config_state_dir}" "${COREPACK_HOME}"
    export PATH="${PNPM_HOME}:${PATH}"
    local _pnpmver=""
    local _pkgjson="$(_get_project_dir)/package.json"
    if [ -f "${_pkgjson}" ]; then
        _pnpmver="$(grep -o '"packageManager"[^,]*' "${_pkgjson}" 2>/dev/null | grep -oE 'pnpm@[^"+]+' | head -n1 | sed 's/^pnpm@//')"
        if [ -z "${_pnpmver}" ]; then
            _pnpmver="$(grep -oE '"pnpm"[[:space:]]*:[[:space:]]*"[^"]+"' "${_pkgjson}" 2>/dev/null | grep -oE '[0-9][0-9.]*' | head -n1)"
        fi
    fi
    if [ -n "${_pnpmver}" ]; then
        npm install -g "pnpm@${_pnpmver}" --prefix "${HOME}/.pnpm" \
            --registry "${COREPACK_NPM_REGISTRY}"
    fi
}
prepare() {
    cd "$(_get_project_dir)"
    gendesk -f -n -q \
        --pkgname="${pkgname%-git}" \
        --pkgdesc="${pkgdesc}" \
        --categories="Development" \
        --name="${pkgname%-git}" \
        --exec="${pkgname%-git} %U"
    _ensure_local_nvm
    _set_rust_build_env
    _set_pnpm_build_env
    rustup toolchain install stable
    rustup default stable
    cd "$(_get_nvmd_dir)"
    cargo build --release
    install -Dm755 target/release/nvmd -t "$(_get_project_dir)/src-tauri/resources"
    cd "$(_get_project_dir)"
    jq '.bundle.active = false' src-tauri/tauri.conf.json > tmp.json && mv tmp.json src-tauri/tauri.conf.json
    cp "src-tauri/icons/128x128@2x.png" "src-tauri/icons/256x256.png"
    export NODE_ENV=development
    pnpm install
}
build() {
    cd "$(_get_project_dir)"
    _ensure_local_nvm
    _set_rust_build_env
    _set_pnpm_build_env
    export NODE_ENV=production
    pnpm run build
}
package() {
    install -Dm755 "$(_get_project_dir)/src-tauri/target/release/${pkgname%-git}" -t "${pkgdir}/usr/bin"
    install -Dm755 "$(_get_nvmd_dir)/target/release/nvmd" -t "${pkgdir}/usr/lib/${_pkgname//-/ }/resources"
    install -Dm644 "$(_get_project_dir)/src-tauri/icons/icon.png" -t "${pkgdir}/usr/lib/${_pkgname//-/ }/icons"
    install -Dm644 "$(_get_project_dir)/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    _icon_sizes=(32x32 64x64 128x128 256x256)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "$(_get_project_dir)/src-tauri/icons/${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons//@2/}/apps/${pkgname%-git}.png"
    done
    install -Dm644 "$(_get_project_dir)/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
