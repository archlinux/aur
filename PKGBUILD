# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=edex
pkgname="${_appname}-ui-git"
_pkgname='eDex-UI'
pkgver=r613.008a438
_nodeversion=22
pkgrel=1
pkgdesc="A rewrite of project edex-ui using Tauri."
arch=("any")
url="https://github.com/zluo01/edex-ui"
license=('GPL-3.0-or-later')
provides=("${pkgname%-git}=${pkgver%.r*}")
conflicts=("${pkgname%-git}")
depends=(
    'gtk3'
    'gdk-pixbuf2'
    'webkit2gtk-4.1'
)
makedepends=(
    'npm'
    'nvm'
    'git'
    'curl'
    'rust'
    'gendesk'
)
source=(
    "${pkgname%-git}.git::git+${url}.git"
)
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
prepare() {
    _ensure_local_nvm
    gendesk -q -f -n --pkgname="${pkgname%-git}" --pkgdesc="${pkgdesc}" --categories="Utility;System" --name="${_pkgname}" --exec="${pkgname%-git}"
    cd "${srcdir}/${pkgname%-git}.git"
    export CARGO_HOME="${srcdir}/.cargo"
    local HOME="${srcdir}/.electron-gyp"
    #echo 'build_from_source=true' >> .npmrc
    echo "cache=${srcdir}/.npm_cache" >> .npmrc
    if [[ "$(curl -s ipinfo.io/country)" == *"CN"* ]]; then
        echo 'registry=https://registry.npmmirror.com' >> .npmrc
        echo 'disturl=https://registry.npmmirror.com/-/binary/node/' >> .npmrc
        export RUSTUP_DIST_SERVER=https://mirrors.ustc.edu.cn/rust-static
        export RUSTUP_UPDATE_ROOT=https://mirrors.ustc.edu.cn/rust-static/rustup
    fi
    sed -i -e "
        s/date\": \"2.1.0/date\": \"2.0.24/g
        s/keyboard\": \"1.3.0/keyboard\": \"1.2.8/g
    " package.json
    NODE_ENV=development    npm install --legacy-peer-deps
}
build() {
    cd "${srcdir}/${pkgname%-git}.git"
    sed -i -e "s/\"targets\": \"all\"/\"targets\": \"deb\"/g" src-tauri/tauri.conf.json
    NODE_ENV=production     npm run build
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.git/src-tauri/target/release/bundle/deb/${_appname}_"*/data/usr/bin/"${_appname}" \
        "${pkgdir}/usr/bin/${pkgname%-git}"
    _icon_sizes=(32x32 128x128 256x256)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/${pkgname%-git}.git/src-tauri/target/release/bundle/deb/${_appname}_"*/data/usr/share/icons/hicolor/"${_icons}/apps/${_appname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-git}.png"
    done
    install -Dm644 "${srcdir}/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname%-git}.git/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}