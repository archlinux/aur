# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Pylogmon <pylogmon@outlook.com>
_pkgname=pot
pkgname="${_pkgname}-translation-git"
_debname="com.${_pkgname}_app.${_pkgname}"
pkgver=3.0.5.r31.gb483f2f
_nodeversion=21
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
    'rust'
    'curl'
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
build() {
    sed -i "s/@runname@/${_pkgname}/" "${srcdir}/${pkgname%-git}.sh"
    _ensure_local_nvm
    cd "${srcdir}/${pkgname%-git}.git"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    export CARGO_HOME="${srcdir}/.cargo"
    HOME="${srcdir}/.electron-gyp"
    {
        echo -e '\n'
        #echo 'build_from_source=true'
        echo 'link-workspace-packages=true'
        echo 'fetch-retry-maxtimeout=10000'
        echo "cache-dir="${srcdir}"/.pnpm_cache"
        echo "store-dir="${srcdir}"/.pnpm_store"
    } >> .npmrc
    if [[ "$(curl -s ipinfo.io/country)" == *"CN"* ]]; then
        export RUSTUP_DIST_SERVER=https://mirrors.ustc.edu.cn/rust-static
	    export RUSTUP_UPDATE_ROOT=https://mirrors.ustc.edu.cn/rust-static/rustup
        {
            echo 'registry=https://registry.npmmirror.com'
            echo 'disturl=https://registry.npmmirror.com/-/binary/node/'
        } >> .npmrc
    fi
    find src-tauri -type f -name "*.json" -exec sed -i "s/icon.ico/icon.png/" {} \;
    sed -i "s/#openssl/openssl={version=\"0.10\",features=[\"vendored\"]}/" src-tauri/Cargo.toml
    NODE_ENV=development    pnpm install --force
    NODE_ENV=production     pnpm tauri build -b deb
    sed -i "s/${_debname}/${pkgname%-git}/" "${_debname}.metainfo.xml"
    sed -e "
        s/Exec=${_pkgname}/Exec=${pkgname%-git}/
        s/Icon=${_pkgname}/Icon=${pkgname%-git}/
        s/Name=${_pkgname}/Name=${pkgname%-git}/
        s/Comment=Pot App/Comment=${pkgdesc}/
    " -i "src-tauri/target/release/bundle/deb/${_pkgname}_${pkgver%.r*}_amd64/data/usr/share/applications/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm755 "${srcdir}/${pkgname%-git}.git/src-tauri/target/release/bundle/deb/${_pkgname}_${pkgver%.r*}_amd64/data/usr/bin/${_pkgname}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/${pkgname%-git}.git/src-tauri/target/release/bundle/deb/${_pkgname}_${pkgver%.r*}_amd64/data/usr/share/applications/${_pkgname}.desktop" \
        "${pkgdir}/usr/share/applications/${pkgname%-git}.desktop"
    _icon_sizes=(32x32 128x128 256x256@2 512x512)
    for _icon_sizes in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/${pkgname%-git}.git/src-tauri/target/release/bundle/deb/${_pkgname}_${pkgver%.r*}_amd64/data/usr/share/icons/hicolor/${_icon_sizes}/apps/${_pkgname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icon_sizes//@2/}/apps/${pkgname%-git}.png"
    done
    install -Dm644 "${srcdir}/${pkgname%-git}.git/public/icon.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname%-git}.svg"
    install -Dm644 "${srcdir}/${pkgname%-git}.git/${_debname}.metainfo.xml" "${pkgdir}/usr/share/metainfo/${pkgname%-git}.metainfo.xml"
}