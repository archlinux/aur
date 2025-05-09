# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=text-vision-git
_pkgname=TextVision
_builded_name=tauri-svelte-app
pkgver=1.0.1.r11.g84fb866
_nodeversion=20
pkgrel=1
pkgdesc="A project that uses OCR to extract text from images."
arch=('any')
url="https://ap73mka.github.io/TextVision/"
_ghurl="https://github.com/Ap73MKa/TextVision"
license=('MIT')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}=${pkgver%.r*}")
depends=(
    'gtk3'
    'webkit2gtk-4.1'
)
makedepends=(
    'gendesk'
    'bun'
    'nvm'
    'git'
    'curl'
    'rust'
)
source=(
    "${pkgname%-git}.git::git+${_ghurl}"
)
sha256sums=('SKIP')
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
prepare() {
    cd "${srcdir}/${pkgname%-git}.git"
    _ensure_local_nvm
    gendesk -q -f -n --pkgname="${pkgname%-git}" --pkgdesc="${pkgdesc}" --categories="Utility" --name="${pkgname%-git}" --exec="${pkgname%-git}"
    HOME="${srcdir}/.electron-gyp"
    export CARGO_HOME="${srcdir}/.cargo"
    if [ -f bunfig.toml ]; then
        rm -rf bunfig.toml
    fi
        if [ -f bun.lockb ];then
        rm -rf bun.lockb
    fi
    if [[ "$(curl -s ipinfo.io/country)" == *"CN"* ]]; then
        {
            echo '[install]'
            echo 'registry = "https://registry.npmmirror.com"'
        } >> bunfig.toml
        export RUSTUP_DIST_SERVER=https://mirrors.ustc.edu.cn/rust-static
        export RUSTUP_UPDATE_ROOT=https://mirrors.ustc.edu.cn/rust-static/rustup
    fi
    sed -i "36s/\/\>/\>\<\/textarea\>/g" apps/desktop/src/widgets/image-viewer/image-viewer.svelte
    sed -i "37s/\<div \/\>/\<div\>\<\/div\>/g" apps/desktop/src/widgets/image-viewer/image-viewer.svelte
    sed -i "42s/on\:transform/ontransform/g" apps/desktop/src/widgets/image-viewer/image-viewer.svelte
    NODE_ENV=development    bun install
}
build() {
    cd "${srcdir}/${pkgname%-git}.git"
    sed -i "s/targets\"\: \"all/targets\"\: \"deb/g" apps/desktop/src-tauri/tauri.conf.json
    NODE_ENV=production     bun run build-desk
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.git/apps/desktop/src-tauri/target/release/bundle/deb/${_builded_name}_"*/data/usr/bin/"${_builded_name}" \
        "${pkgdir}/usr/bin/${pkgname%-git}"
    icon_sizes=(32x32 128x128 256x256@2)
    for _icons in "${icon_sizes[@]}";do
        install -Dm644 "${srcdir}/${pkgname%-git}.git/apps/desktop/src-tauri/target/release/bundle/deb/${_builded_name}_"*/data/usr/share/icons/hicolor/"${_icons}"/apps/"${_builded_name}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons//@2/}/apps/${pkgname%-git}.png"
    done
    install -Dm644 "${srcdir}/${pkgname%-git}.git/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname%-git}.git/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}