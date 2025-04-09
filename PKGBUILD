# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=tauview-git
_pkgname=Tauview
pkgver=0.0.14.r1.gc9efd92
_nodeversion=20
pkgrel=1
pkgdesc="Minimalist image viewer based on Leaflet.js and Tauri."
arch=("any")
url="https://github.com/sprout2000/tauview"
license=('MIT')
provides=("${pkgname%-git}=${pkgver%.r*}")
conflicts=("${pkgname%-git}")
depends=(
    'gtk3'
    'gdk-pixbuf2'
    'webkit2gtk'
)
makedepends=(
    'npm'
    'nvm'
    'git'
    'curl'
    'rust'
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
    _ensure_local_nvm
    cd "${srcdir}/${pkgname//-/.}"
    export CARGO_HOME="${srcdir}/.cargo"
    local HOME="${srcdir}/.electron-gyp"
    #echo 'build_from_source=true' >> .npmrc
    echo "cache=${srcdir}/.npm_cache" >> .npmrc
    if [[ "$(curl -s ipinfo.io/country)" == *"CN"* ]]; then
        echo 'registry=https://registry.npmmirror.com' >> .npmrc
        echo 'disturl=https://registry.npmmirror.com/-/binary/node/' >> .npmrc
        export RUSTUP_DIST_SERVER=https://mirrors.ustc.edu.cn/rust-static
        export RUSTUP_UPDATE_ROOT=https://mirrors.ustc.edu.cn/rust-static/rustup
        sed -i "s/github.com/ghproxy.net\/https:\/\/github.com/" src-tauri/Cargo.toml
    fi
    NODE_ENV=development    npm install
}
build() {
    cd "${srcdir}/${pkgname//-/.}"
    sed -i "s/targets\"\: \"all/targets\"\: \"deb/g" src-tauri/tauri.conf.json
    NODE_ENV=production     npm run tauri build
}
package() {
    cd "${srcdir}/${pkgname//-/.}/src-tauri/target/release/bundle/deb/${pkgname%-git}_"*/data
    install -Dm755 usr/bin/"${pkgname%-git}" -t "${pkgdir}/usr/bin"
    install -Dm644 usr/share/applications/"${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    _icon_sizes=(32x32 128x128 256x256@2)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 usr/share/icons/hicolor/"${_icons}/apps/${pkgname%-git}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/${pkgname//-/.}/LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}