# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=switchhosts-git
_pkgname=SwitchHosts
pkgver=5.0.1.r34.g2d0de55
_nodeversion=22
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
    'curl'
    'git'
    'librsvg'
    'patchelf'
)
source=("${pkgname//-/.}::git+${_ghurl}.git")
sha256sums=('SKIP')
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
	export XDG_CACHE_HOME="${srcdir}/.cache"
	export XDG_CONFIG_HOME="${srcdir}/.config"
	export XDG_DATA_HOME="${srcdir}/.local/share"
	export npm_config_cache="${srcdir}/.npm_cache"
	export npm_config_maxsockets=32
	export npm_config_audit=false
	export npm_config_fund=false
	export npm_config_progress=false
	export NODE_OPTIONS="--max-old-space-size=4096"
	export npm_config_node_options="--max-old-space-size=4096"
    export HOME="${srcdir}/.home"
	export CARGO_HOME="${srcdir}/.cargo"
	export CARGO_TARGET_DIR="${srcdir}/target"
	export CARGO_NET_OFFLINE=true
	export CARGO_NET_GIT_FETCH_WITH_CLI=true
	export CARGO_NET_RETRY=5
	export CARGO_HTTP_MULTIPLEXING=false
	export CARGO_BUILD_JOBS="$(nproc)"
	export CARGO_INCREMENTAL=0
	export CARGO_TERM_COLOR=never
	export CARGO_PROFILE_RELEASE_STRIP=symbols
	export CARGO_PROFILE_RELEASE_DEBUG=0
	mkdir -p "${HOME}" "${CARGO_HOME}" "${CARGO_TARGET_DIR}"
}
prepare() {
    cd "${srcdir}/${pkgname//-/.}"
    gendesk -q -f -n \
        --pkgdesc="${pkgdesc}" \
        --categories="Utility" \
        --pkgname="${pkgname%-git}" \
        --name="${_pkgname}" \
        --exec="${pkgname%-git} %U"
    _set_build_env
    _ensure_local_nvm
    sed -i "s/\"active\"\: true\,/\"active\"\: false\,/g" src-tauri/tauri.conf.json
    cp src-tauri/icons/128x128@2x.png src-tauri/icons/256x256.png
    rustup default stable
    export NODE_ENV=development
    npm install --legacy-peer-deps
    # Pre-download all Rust dependencies for offline build
    export CARGO_NET_OFFLINE=false
    (cd src-tauri && cargo fetch)
}
build() {
    cd "${srcdir}/${pkgname//-/.}"
    _set_build_env
    _ensure_local_nvm
    export NODE_ENV=production
    npm run tauri:build
}
package() {
    install -Dm755 "${srcdir}/target/release/"{"${pkgname%-git}",swh_helper} -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/${pkgname//-/.}/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    _icon_sizes=(32x32 64x64 128x128 256x256)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/${pkgname//-/.}/src-tauri/icons/${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-git}.png"
    done
}