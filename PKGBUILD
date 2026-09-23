# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=musicat-git
_pkgname=Musicat
pkgver=0.17.2.r33.ge7f29f2
_nodeversion=24
pkgrel=1
pkgdesc="A sleek desktop music player and tagger for offline music 🪕 With experimental features like map view, GPT analysis, artist toolkit."
arch=(
    'aarch64'
    'x86_64'
)
url="https://github.com/basharovV/musicat"
license=('GPL-3.0-only')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}=${pkgver%.r*}")
depends=(
    'gtk3'
    'alsa-lib'
    'webkit2gtk-4.1'
)
makedepends=(
    'bun'
    'git'
    'gendesk'
    'rustup'
    'clang'
)
source=(
    "${pkgname//-/.}::git+${url}.git"
)
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
	export ELECTRON_DIST="/usr/lib/electron${_electronversion}"
	export ELECTRON_OVERRIDE_DIST_PATH="${ELECTRON_DIST}"
	export ELECTRON_SKIP_BINARY_DOWNLOAD=1
	export ELECTRON_BUILDER_OFFLINE=true
	export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/^v//')"
	export HOME="${srcdir}/.home"
	export XDG_CACHE_HOME="${HOME}/.cache"
	export XDG_CONFIG_HOME="${HOME}/.config"
	export XDG_DATA_HOME="${HOME}/.local/share"
	export BUN_INSTALL_CACHE_DIR="${HOME}/.bun/cache"
	export BUN_INSTALL_GLOBAL_DIR="${HOME}/.bun/global"
	export BUN_INSTALL_BIN="${HOME}/.bun/bin"
	export BUN_CONFIG_SKIP_SAVE_LOCKFILE=1
	export BUN_CONFIG_SKIP_LOAD_LOCKFILE=1
	export BUN_DISABLE_DOTENV=1
	export DO_NOT_TRACK=1
	export BUN_JOBS="$(nproc)"
    export CARGO_HOME="${HOME}/.cargo"
	export CARGO_NET_GIT_FETCH_WITH_CLI=true
	export CARGO_NET_RETRY=5
	export CARGO_HTTP_MULTIPLEXING=false
	export CARGO_INCREMENTAL=0
	export CARGO_TERM_COLOR=never
	export CARGO_PROFILE_RELEASE_STRIP=symbols
	mkdir -p "${HOME}" "${BUN_INSTALL_CACHE_DIR}" "${BUN_INSTALL_GLOBAL_DIR}" "${BUN_INSTALL_BIN}" "${CARGO_HOME}"
}
prepare() {
    cd "${srcdir}/${pkgname//-/.}"
    gendesk -q -f -n \
        --pkgname="${pkgname%-git}" \
        --pkgdesc="${pkgdesc}" \
        --categories="AudioVideo" \
        --name="${_pkgname}" \
        --exec="${pkgname%-git} %U"
    _ensure_local_nvm
    _set_build_env
    cp src-tauri/icons/128x128@2x.png src-tauri/icons/256x256.png
    export NODE_ENV=development
    git submodule update --init --recursive --depth 1
    bun install
    rustup toolchain install stable
    rustup default stable
}
build() {
    cd "${srcdir}/${pkgname//-/.}"
    export NODE_ENV=production
    case "${CARCH}" in
        x86_64)  export TAURI_ENV_TARGET_TRIPLE="x86_64-unknown-linux-gnu" ;;
        aarch64) export TAURI_ENV_TARGET_TRIPLE="aarch64-unknown-linux-gnu" ;;
    esac
    bun run build:pvr:linux
    bun run tauri build --no-bundle
}
package() {
    install -Dm755 "${srcdir}/${pkgname//-/.}/src-tauri/target/release/${_pkgname}" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm755 "${srcdir}/${pkgname//-/.}/src-tauri/target/release/pvr" -t "${pkgdir}/usr/bin"
    for _icons in 32x32 128x128 256x256;do
        install -Dm644 "${srcdir}/${pkgname//-/.}/src-tauri/icons/${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-git}.png"
    done
    install -Dm644 "${srcdir}/${pkgname//-/.}/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm755 -d "${pkgdir}/usr/lib/${_pkgname}"
    cp -a "${srcdir}/${pkgname//-/.}/src-tauri/target/release/resources" "${pkgdir}/usr/lib/${_pkgname}"
    install -Dm644 "${srcdir}/${pkgname//-/.}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}