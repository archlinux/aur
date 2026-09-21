# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=sigma-file-manager-git
_pkgname=Sigma-File-Manager
_flatpakname=com.sigmafilemanager.app
pkgver=ms.store.2.2.0.r17.gfed49ce
_nodeversion=24
pkgrel=1
pkgdesc="A free, open-source, quickly evolving, modern file manager (explorer / browser) app."
arch=('x86_64')
url="https://github.com/aleksey-hoffman/sigma-file-manager"
license=('GPL-3.0-or-later')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
depends=(
    'webkit2gtk-4.1'
    'gtk3'
)
makedepends=(
    'gendesk'
    'git'
    'nvm'
    'npm'
    'python'
    'rustup'
)
source=(
    "${pkgname%-git}.git::git+${url}.git"
)
sha256sums=('SKIP')
pkgver() {
    cd "${srcdir}/${pkgname%-git}.git"
    set -o pipefail
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/v//g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}
_set_build_env() {
	export HOME="${srcdir}/.home"
	export XDG_CACHE_HOME="${srcdir}/.cache"
	export XDG_CONFIG_HOME="${srcdir}/.config"
	export XDG_DATA_HOME="${srcdir}/.local/share"
	export npm_config_cache="${srcdir}/.npm_cache"
	export COREPACK_NPM_REGISTRY="${COREPACK_NPM_REGISTRY:-${NPM_CONFIG_REGISTRY:-https://registry.npmjs.org}}"
	export COREPACK_HOME="${srcdir}/.corepack"
	export npm_config_audit=false
	export CARGO_HOME="${srcdir}/.cargo"
	export CARGO_NET_GIT_FETCH_WITH_CLI=true
	export CARGO_NET_RETRY=5
	export CARGO_HTTP_MULTIPLEXING=false
	export CARGO_INCREMENTAL=0
	export CARGO_TERM_COLOR=never
	export CARGO_PROFILE_RELEASE_STRIP=symbols
	mkdir -p "${HOME}" "${npm_config_cache}" "${COREPACK_HOME}" "${CARGO_HOME}"
}
_ensure_local_nvm() {
    local NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install "${_nodeversion}"
    nvm use "${_nodeversion}"
}
prepare() {
    cd "${srcdir}/${pkgname%-git}.git"
    gendesk -q -f -n \
        --pkgname="${pkgname%-git}" \
        --pkgdesc="${pkgdesc}" \
        --categories="Utility" \
        --name="${_pkgname}" \
        --exec="${pkgname%-git} %U"
	_ensure_local_nvm
    _set_build_env
    sed -i "s/${_flatpakname}/${pkgname%-git}/g" "flatpak/com.${pkgname%-git}.app.metainfo.xml"
    sed -i "s/\"active\"\: true\,/\"active\"\: false\,/g" src-tauri/tauri.conf.json
    cp src-tauri/icons/128x128@2x.png src-tauri/icons/256x256.png
    rustup default stable
    export NODE_ENV=development
    npm install
}
build() {
    cd "${srcdir}/${pkgname%-git}.git"
    _ensure_local_nvm
    _set_build_env
    export NODE_ENV=production
    npm run sync-version
    npm run tauri:build:linux
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.git/src-tauri/target/release/${pkgname%-git}" -t "${pkgdir}/usr/bin"
    _icon_sizes=(32x32 64x64 128x128 256x256)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/${pkgname%-git}.git/src-tauri/icons/${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-git}.png"
    done
    install -Dm644 "${srcdir}/${pkgname%-git}.git/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname%-git}.git/flatpak/com.${pkgname%-git}.app.metainfo.xml" -t "${pkgdir}/usr/share/metainfo/${pkgname%-git}.metainfo.xml"
    install -Dm644 "${srcdir}/${pkgname%-git}.git/LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}