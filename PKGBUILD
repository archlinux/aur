# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=sneaky-reader-git
_pkgname='Sneaky Reader'
pkgver=r23.c01e4a5
_nodeversion=22
pkgrel=1
pkgdesc="A desktop app that lets you read books sneakily at work. 摸鱼看小说工具"
arch=('any')
url="https://github.com/macaujack/sneaky-reader"
license=('WTFPL')
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
    'rust'
    'npm'
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
    cd "${srcdir}/${pkgname%-git}.git"
    export CARGO_HOME="${srcdir}/.cargo"
    HOME="${srcdir}/.electron-gyp"
    {
        echo -e '\n'	
        #echo 'build_from_source=true'
        echo "cache=${srcdir}/.npm_cache"
    } >> .npmrc
    if [[ "$(curl -s ipinfo.io/country)" == *"CN"* ]]; then
        {
            echo 'registry=https://registry.npmmirror.com'
        } >> .npmrc
        find ./ -type f -name "package-lock.json" -exec sed -i "s/registry.npmjs.org/registry.npmmirror.com/g" {} +
        export RUSTUP_DIST_SERVER=https://mirrors.ustc.edu.cn/rust-static
	    export RUSTUP_UPDATE_ROOT=https://mirrors.ustc.edu.cn/rust-static/rustup
        sed -i "s/https:\/\/github.com\/macaujack/https:\/\/github.moeyy.xyz\/https:\/\/github.com\/macaujack/g" src-tauri/Cargo.toml
    fi
    NODE_ENV=development    npm install
}
build() {
    cd "${srcdir}/${pkgname%-git}.git"
    sed -i "s/targets\": \"all/targets\": \"deb/g" src-tauri/tauri.conf.json
    NODE_ENV=production     npm run tauri build
    sed -i -e "
        s/Categories=/Categories=Utility/g
        s/Comment=A Tauri App/Comment=${pkgdesc}/g
        s/Name=${pkgname%-git}/Name=${_pkgname}/g
    " "${srcdir}/${pkgname%-git}.git/src-tauri/target/release/bundle/deb/${pkgname%-git}_"*/data/usr/share/applications/"${pkgname%-git}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.git/src-tauri/target/release/bundle/deb/${pkgname%-git}_"*/data/usr/bin/"${pkgname%-git}" \
        -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/${pkgname%-git}.git/src-tauri/target/release/bundle/deb/${pkgname%-git}_"*/data/usr/share/applications/"${pkgname%-git}.desktop" \
        -t "${pkgdir}/usr/share/applications"
    for _icons in 32x32 128x128 256x256@2;do
        install -Dm644 "${srcdir}/${pkgname%-git}.git/src-tauri/target/release/bundle/deb/${pkgname%-git}_"*/data/usr/share/icons/hicolor/"${_icons}/apps/${pkgname%-git}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/${pkgname%-git}.git/package.json" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}