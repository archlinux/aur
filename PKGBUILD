# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=switchhosts-git
_pkgname=SwitchHosts
pkgver=5.0.3.r2.ga43172f
_nodeversion=24
pkgrel=1
pkgdesc="An app for managing hosts file,and switch hosts quickly !"
arch=('any')
url="https://switchhosts.app/"
_ghurl="https://github.com/oldj/SwitchHosts"
license=('Apache-2.0')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}=${pkgver%.r*}")
depends=(
    'gtk3'
    'gdk-pixbuf2'
    'webkit2gtk-4.1'
    'libappindicator'
    'libayatana-appindicator'
)
makedepends=(
    'gendesk'
    'nvm'
    'npm'
    'jq'
    'git'
    'librsvg'
    'patchelf'
)
source=("${pkgname//-/.}::git+${_ghurl}.git")
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
_ensure_local_nvm() {
    local NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install "${_nodeversion}"
    nvm use "${_nodeversion}"
}
_get_app_dir() {
	find "$(_get_project_dir)" -type d -name "release" -exec test -d "{}/.fingerprint" -a -d "{}/deps" \; -print -quit 2>/dev/null
}
_set_build_env() {
    export HOME="${srcdir}/.home"
    export XDG_CACHE_HOME="${HOME}/.cache"
    export XDG_CONFIG_HOME="${HOME}/.config"
    export XDG_DATA_HOME="${HOME}/.local/share"
    export npm_config_cache="${HOME}/.npm_cache"
    export COREPACK_NPM_REGISTRY="${COREPACK_NPM_REGISTRY:-${NPM_CONFIG_REGISTRY:-https://registry.npmjs.org}}"
    export COREPACK_HOME="${HOME}/.corepack"
    export npm_config_audit=false
    export CARGO_HOME="${HOME}/.cargo"
    export CARGO_NET_GIT_FETCH_WITH_CLI=true
    export CARGO_NET_RETRY=5
    export CARGO_HTTP_MULTIPLEXING=false
    export CARGO_INCREMENTAL=0
    export CARGO_TERM_COLOR=never
    export CARGO_PROFILE_RELEASE_STRIP=symbols
    export AWS_LC_SYS_CFLAGS="-O0"
    mkdir -p "${HOME}" "${npm_config_cache}" "${COREPACK_HOME}" "${CARGO_HOME}"
}
prepare() {
    cd "$(_get_project_dir)"
    gendesk -q -f -n \
        --pkgdesc="${pkgdesc}" \
        --categories="Utility" \
        --pkgname="${pkgname%-git}" \
        --name="${_pkgname}" \
        --exec="${pkgname%-git} %U"
    _ensure_local_nvm
    _set_build_env
    jq '.bundle.active = false' src-tauri/tauri.conf.json > tmp.json && mv tmp.json src-tauri/tauri.conf.json
    cp src-tauri/icons/128x128@2x.png src-tauri/icons/256x256.png
    rustup update stable
    rustup default stable
    export NODE_ENV=development
    npm install --legacy-peer-deps
}
build() {
    cd "$(_get_project_dir)"
    _ensure_local_nvm
    _set_build_env
    export NODE_ENV=production
    npm run tauri:build
}
package() {
    install -Dm755 "$(_get_app_dir)/"{"${pkgname%-git}",swh_helper} -t "${pkgdir}/usr/bin"
    install -Dm644 "$(_get_project_dir)/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    _icon_sizes=(32x32 64x64 128x128 256x256)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "$(_get_project_dir)/src-tauri/icons/${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-git}.png"
    done
}
