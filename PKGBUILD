# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=sigma-file-manager-git
_pkgname=Sigma-File-Manager
_flatpakname=com.sigmafilemanager.app
pkgver=2.2.0.r5.gc6916c2
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
    'ccache'
    'sccache'
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
    export HOME="${srcdir}/.electron-gyp"
    export CARGO_HOME="${srcdir}/.cargo"
    export NPM_CONFIG_CACHE="${srcdir}/.npm_cache"
    export NPM_CONFIG_MAXSOCKETS=32
    if [[ "$(curl -s ipinfo.io/country)" == *"CN"* ]]; then
        {
            export NPM_CONFIG_REGISTRY="https://registry.npmmirror.com"
            export NODEJS_ORG_MIRROR="https://npmmirror.com/mirrors/node"
            export RUSTUP_DIST_SERVER="https://mirrors.ustc.edu.cn/rust-static"
            export RUSTUP_UPDATE_ROOT="https://mirrors.ustc.edu.cn/rust-static/rustup"
        }
        find ./ -type f -name "package-lock.json" -exec sed -i "s/registry.npmjs.org/registry.npmmirror.com/g" {} +
    fi
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
	_set_build_env
    _ensure_local_nvm
    sed -i "s/${_flatpakname}/${pkgname%-git}/g" "flatpak/com.${pkgname%-git}.app.metainfo.xml"
    sed -i "s/\"active\"\: true\,/\"active\"\: false\,/g" src-tauri/tauri.conf.json
    rustup default stable
    NODE_ENV=development    npm install
}
build() {
    cd "${srcdir}/${pkgname%-git}.git"
    _set_build_env
    _ensure_local_nvm
    NODE_ENV=production     npm run sync-version
    NODE_ENV=production     npm run tauri:build:linux
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.git/src-tauri/target/release/${pkgname%-git}" -t "${pkgdir}/usr/bin"
    _icon_sizes=(32x32 64x64 128x128)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/${pkgname%-git}.git/src-tauri/icons/${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-git}.png"
    done
    install -Dm644 "${srcdir}/${pkgname%-git}.git/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname%-git}.git/flatpak/com.${pkgname%-git}.app.metainfo.xml" -t "${pkgdir}/usr/share/metainfo/${pkgname%-git}.metainfo.xml"
    install -Dm644 "${srcdir}/${pkgname%-git}.git/LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
