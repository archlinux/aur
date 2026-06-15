# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Pylogmon <pylogmon@outlook.com>
_pkgname=pot
pkgname="${_pkgname}-translation-git"
_debname="com.${_pkgname}_app.${_pkgname}"
pkgver=3.0.7.r13.gb9c97b6
_nodeversion=22
pkgrel=1
pkgdesc="A cross-platform software for text translation.一个跨平台的划词翻译软件"
arch=(
    'aarch64'
    'armv7h'
    'i686'
    'x86_64'
)
url="https://pot.pylogmon.com/"
_ghurl="https://github.com/pot-app/pot-desktop"
license=('GPL-3.0-only')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
depends=(
    'gdk-pixbuf2'
    'gtk3'
    'openssl'
    'cairo'
    'libxcb'
    'pango'
    'webkit2gtk'
    'libsoup'
    'bzip2'
    'tessdata'
    'tesseract'
)
makedepends=(
    'nvm'
    'pnpm'
    'npm'
    'git'
    'rust'
    'curl'
    'gendesk'
)
source=(
    "${pkgname%-git}.git::git+${_ghurl}.git"
    "${pkgname%-git}.sh"
)
sha256sums=('SKIP'
            'ee36c7f3eedf44465a8d50d263dcb0da274961586ae847ab59dcb7a70850c712')
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
_set_env() {
    local HOME="${srcdir}/.electron-gyp"
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
			export NPM_CONFIG_REGISTRY="https://registry.npmmirror.com"
			export NODEJS_ORG_MIRROR="https://npmmirror.com/mirrors/node"
            export RUSTUP_DIST_SERVER="https://rsproxy.cn"
            export RUSTUP_UPDATE_ROOT="https://rsproxy.cn/rustup"
		}
	fi
}
prepare() {
    cd "${srcdir}/${pkgname%-git}.git"
    sed -i "s/@runname@/${_pkgname}/g" "${srcdir}/${pkgname%-git}.sh"
    gendesk -q -f -n \
        --pkgname="${pkgname%-git}" \
        --pkgdesc="${pkgdesc}" \
        --categories="Office" \
        --name="${_pkgname}" \
        --exec="${pkgname%-git}"
    _ensure_local_nvm
    _set_env
    find src-tauri -type f -name "*.json" -exec sed -i "s/icon\.ico/icon\.png/g" {} \;
    rustup default stable
    rustup toolchain install stable
    NODE_ENV=development    pnpm install --force || true
    sed -i "s/esbuild: set this to true or false/esbuild: true/; s/tesseract.js: set this to true or false/tesseract.js: true/" pnpm-workspace.yaml
    NODE_ENV=development    pnpm install --force
}
build() {
    cd "${srcdir}/${pkgname%-git}.git"
    _ensure_local_nvm
    _set_env
    rustup default stable
    NODE_ENV=production     pnpm run build
    # patch wry for webkit2gtk-rs 0.18+ SettingsExt trait
    WRYSRC=$(find "${CARGO_HOME}/registry/src" -path "*/wry-0.24.*/src/webview/webkitgtk/mod.rs" 2>/dev/null | head -1)
    if [ -n "$WRYSRC" ]; then
        grep -q "SettingsExt" "$WRYSRC" 2>/dev/null || \
            sed -i '/^use gdk::/a use webkit2gtk::SettingsExt;' "$WRYSRC"
    fi
    cd src-tauri
    cargo build --release --features custom-protocol
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm755 "${srcdir}/${pkgname%-git}.git/src-tauri/target/release/${_pkgname}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/${pkgname%-git}.git/${pkgname%-git}.desktop" \
        "${pkgdir}/usr/share/applications/${pkgname%-git}.desktop"
    install -Dm644 "${srcdir}/${pkgname%-git}.git/src-tauri/icons/icon.png" \
        "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname%-git}.png"
    install -Dm644 "${srcdir}/${pkgname%-git}.git/public/icon.svg" \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname%-git}.svg"
    install -Dm644 "${srcdir}/${pkgname%-git}.git/${_debname}.metainfo.xml" \
        "${pkgdir}/usr/share/metainfo/${pkgname%-git}.metainfo.xml"
}