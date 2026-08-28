# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=mineradio-tauri-git
_pkgname=MineRadio-Tauri
pkgver=r644.a1c5f07
_nodeversion=20
pkgrel=1
pkgdesc="A film lens, particle vision and lyrics stage as the core of the immersive music player."
arch=('any')
url="https://github.com/zzstar101/Mineradio-Tauri"
license=('GPL-3.0-only')
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
source=("${pkgname%-git}.git::git+${url}.git")
sha256sums=('SKIP')
pkgver() {
    cd "${srcdir}/${pkgname%-git}.git"
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
_set_build_env() {
	export CARGO_HOME="${srcdir}/.cargo"
    export HOME="${srcdir}/.electron-gyp"
    if [[ "$(curl -s ipinfo.io/country)" == *"CN"* ]]; then
        export BUN_CONFIG_REGISTRY="https://registry.npmmirror.com"
        export npm_config_registry="https://registry.npmmirror.com"
        export BUN_INSTALL_DISABLE_DEFAULT_REGISTRY_FALLBACK=1
        export npm_config_nodejs_org_mirror="https://npmmirror.com/mirrors/node"
        export NVM_NODEJS_ORG_MIRROR="https://npmmirror.com/mirrors/node"
        export npm_config_electron_mirror="https://npmmirror.com/mirrors/electron/"
        export BUN_BINARY_MIRROR_OVERRIDE="https://npmmirror.com/-/binary/"
        export RUSTUP_DIST_SERVER="https://mirrors.aliyun.com/rustup"
		export RUSTUP_UPDATE_ROOT="https://mirrors.aliyun.com/rustup/rustup"
        find ./ -type f -name "package-lock.json" -exec sed -i "s/registry.npmjs.org/registry.npmmirror.com/g" {} +
    fi
}
prepare() {
    cd "${srcdir}/${pkgname%-git}.git"
    gendesk -q -f -n \
        --pkgname="${pkgname%-git}" \
        --pkgdesc="${pkgdesc}" \
        --categories="AudioVideo;Audio;Player;GTK;" \
        --name="${_pkgname}" \
        --exec="${pkgname%-git} %U"
    _set_build_env
    _ensure_local_nvm
    git submodule update --depth=1 --init --recursive
    sed -i 's|"active": true,|"active": false,|' apps/desktop/src-tauri/tauri.conf.json
    # Override rust-toolchain.toml to use stable instead of non-existent 1.95.0
    sed -i 's/channel = "1.95.0"/channel = "stable"/' rust-toolchain.toml
    rustup default stable
    #bun install
}
build() {
    cd "${srcdir}/${pkgname%-git}.git"
    _set_build_env
    _ensure_local_nvm
    #bun run build
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.git/apps/desktop/src-tauri/target/release/${pkgname%-git}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/${pkgname%-git}.git/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname%-git}.git/apps/desktop/src-tauri/icons/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-git}.png"
    install -Dm644 "${srcdir}/${pkgname%-git}.git/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}