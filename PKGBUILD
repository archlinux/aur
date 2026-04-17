# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=supremum-git
_pkgname=Supremum
pkgver=r172.d2c23d4
_nodeversion=25
pkgrel=1
pkgdesc="Simple, lightweight, but powerful AI code editor for the AI era."
arch=("any")
url="https://github.com/HybridTalentComputing/Supremum"
license=('GPL-3.0-or-later')
provides=("${pkgname%-git}=${pkgver%.r*}")
conflicts=("${pkgname%-git}")
depends=(
    'gtk3'
    'gdk-pixbuf2'
    'webkit2gtk-4.1'
)
makedepends=(
    'nvm'
    'git'
    'curl'
    'rustup'
    'bun'
    'gendesk'
)
source=(
    "${pkgname//-/.}::git+${url}.git"
)
sha256sums=('SKIP')
pkgver() {
    cd "${srcdir}/${pkgname//-/.}"
    set -o pipefail
    git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/v//' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}
_ensure_local_nvm() {
    local NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install "${_nodeversion}"
    nvm use "${_nodeversion}"
}
prepare() {
    cd "${srcdir}/${pkgname//-/.}"
    local HOME="${srcdir}/.electron-gyp"
    export CARGO_HOME="${srcdir}/.cargo"
    rm -rf bunfig.toml bun.lockb || true
    if [[ "$(curl -s ipinfo.io/country)" == *"CN"* ]]; then
        export NPM_CONFIG_REGISTRY="https://registry.npmmirror.com"
        export BUN_REGISTRY_MIRROR="https://registry.npmmirror.com"
        export BUN_BINARY_MIRROR_OVERRIDE="https://registry.npmmirror.com/-/binary/"
        export BUN_INSTALL_REWRITE="https://registry.npmjs.org/*=https://registry.npmmirror.com/\$1"
        export BUN_INSTALL_NO_CACHE=1
        export BUN_INSTALL_DISABLE_DEFAULT_REGISTRY_FALLBACK=1
        export BUN_CACHE_DIR="${srcdir}/.bun_cache"
        export RUSTUP_DIST_SERVER="https://rsproxy.cn"
        export RUSTUP_UPDATE_ROOT="https://rsproxy.cn/rustup"
    fi
    _ensure_local_nvm
    gendesk -q -f -n \
        --pkgname="${pkgname%-git}" \
        --pkgdesc="${pkgdesc}" \
        --categories="Development" \
        --name="${_pkgname}" \
        --exec="${pkgname%-git}"
    sed -i "s/\"active\"\: true\,/\"active\"\: false\,/g" src-tauri/tauri.conf.json
    rustup default stable
    bun install
}
build() {
	cd "${srcdir}/${pkgname//-/.}"
    _ensure_local_nvm
    bun run tauri build
}
package() {
    install -Dm755 "${srcdir}/${pkgname//-/.}/src-tauri/target/release/${_pkgname}" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm644 "${srcdir}/${pkgname//-/.}/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    _icon_sizes=(32x32 64x64 128x128)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/${pkgname//-/.}/src-tauri/icons/${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-git}.png"
    done
}