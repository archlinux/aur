# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Pylogmon <pylogmon@outlook.com>
_pkgname=pot
pkgname="${_pkgname}-translation-git"
pkgver=2.7.9.r7.gd6ff01c
_nodeversion=18
pkgrel=1
pkgdesc="一个跨平台的划词翻译软件 | A cross-platform software for text translation."
arch=('x86_64')
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
    'gendesk'
    'rust>=1.69.0'
    'base-devel'
)
source=(
    "${pkgname%-git}.git::git+${_ghurl}.git"
    "${pkgname%-git}.sh"
)
sha256sums=('SKIP'
            '44a5d65890e900259c4c9047d799ed8bf66c3baae9d5366ab9ad975f33d653d7')
pkgver() {
    cd "${srcdir}/${pkgname%-git}.git"
    git describe --long --tags --exclude='*[a-z][a-z]*' | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}
_ensure_local_nvm() {
    export NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install "${_nodeversion}"
    nvm use "${_nodeversion}"
}
build() {
    sed "s|@runname@|${_pkgname}|g" -i "${srcdir}/${pkgname%-git}.sh"
    _ensure_local_nvm
    gendesk -q -f -n --pkgname="${_pkgname}-translation-git" --categories="Office" --name="${pkgname%-git}" --exec="${pkgname%-git} %U"
    cd "${srcdir}/${pkgname%-git}.git"
    HOME="${srcdir}/.electron-gyp"
    pnpm config set store-dir "${srcdir}/.pnpm_store"
    pnpm config set cache-dir "${srcdir}/.pnpm_cache"
    pnpm config set link-workspace-packages true
    export CARGO_HOME="${srcdir}/.cargo"
    if [ `curl -s ipinfo.io/country | grep CN | wc -l ` -ge 1 ];then
        echo 'registry="https://registry.npmmirror.com/"' >> .npmrc
        echo 'electron_mirror="https://registry.npmmirror.com/-/binary/electron/"' >> .npmrc
        echo 'electron_builder_binaries_mirror="https://registry.npmmirror.com/-/binary/electron-builder-binaries/"' >> .npmrc
        export RUSTUP_DIST_SERVER=https://mirrors.ustc.edu.cn/rust-static
	    export RUSTUP_UPDATE_ROOT=https://mirrors.ustc.edu.cn/rust-static/rustup
    else
        echo "Your network is OK."
    fi
    sed "s|icon.ico|icon.png|g" -i src-tauri/tauri.linux.conf.json
    sed "s|icon.ico|icon.png|g" -i src-tauri/webview.arm64.json
    sed "s|icon.ico|icon.png|g" -i src-tauri/webview.x64.json
    sed "s|icon.ico|icon.png|g" -i src-tauri/webview.x86.json
    pnpm install --force
    #仅输出deb
    pnpm tauri build -b deb
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm755 "${srcdir}/${pkgname%-git}.git/src-tauri/target/release/bundle/deb/${_pkgname}_${pkgver%.r*}_amd64/data/usr/bin/${_pkgname}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname%-git}.git/src-tauri/icons/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-git}.png"
}