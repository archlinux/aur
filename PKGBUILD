# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=musicat-git
_pkgname=Musicat
pkgver=0.9.0.r0.gff9f49a
_nodeversion=18
pkgrel=1
pkgdesc="A sleek desktop music player and tagger for offline music 🪕 With experimental features like map view, GPT analysis, artist toolkit."
arch=('any')
url="https://github.com/basharovV/musicat"
license=('GPL-3.0-only')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}=${pkgver%.r*}")
depends=(
    'gtk3'
    'alsa-lib'
    'webkit2gtk-4.1'
)
makedepends=(
    'npm'
    'git'
    'gendesk'
    'cmake'
    'gcc'
    'rust'
    'curl'
)
source=(
    "${pkgname//-/.}::git+${url}.git"
)
sha256sums=('SKIP')
pkgver() {
    cd "${srcdir}/${pkgname//-/.}"
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/v//g'
}
_ensure_local_nvm() {
    local NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install "${_nodeversion}"
    nvm use "${_nodeversion}"
}
build() {
    _ensure_local_nvm
    cd "${srcdir}/${pkgname//-/.}"
    export npm_config_build_from_source=true
    export npm_config_cache="${srcdir}/.npm_cache"
    export CARGO_HOME="${srcdir}/.cargo"
    HOME="${srcdir}/.electron-gyp"
    export CARGO_HOME="${srcdir}/.cargo"
    if [[ "$(curl -s ipinfo.io/country)" == *"CN"* ]]; then
        echo 'registry=https://registry.npmmirror.com' >> .npmrc
		echo 'disturl=https://registry.npmmirror.com/-/binary/node/' >> .npmrc
        export RUSTUP_DIST_SERVER=https://mirrors.ustc.edu.cn/rust-static
        export RUSTUP_UPDATE_ROOT=https://mirrors.ustc.edu.cn/rust-static/rustup
        sed "s/github.com/github.moeyy.xyz\/https:\/\/github.com/" -i src-tauri/Cargo.toml
    fi
    sed -e "
        s/\"app\"/\"${pkgname%-git}\"/
        s/\"A Tauri App\"/\"${pkgdesc}\"/
    " -i src-tauri/Cargo.toml
    sed "/cli-win32-x64-msvc/d" -i package.json
    NODE_ENV=development    npm install
    NODE_ENV=production     npx tauri build -b deb
}
package() {
    install -Dm755 "${srcdir}/${pkgname//-/.}/src-tauri/target/release/bundle/deb/${_pkgname}_${pkgver%.r*}_"*/data/usr/bin/"${pkgname%-git}" -t "${pkgdir}/usr/bin"
    for _icons in 32x32 128x128 256x256@2;do
        install -Dm644 "${srcdir}/${pkgname//-/.}/src-tauri/target/release/bundle/deb/${_pkgname}_${pkgver%.r*}_"*/data/usr/share/icons/hicolor/"${_icons}"/apps/"${pkgname%-git}".png \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/${pkgname//-/.}/src-tauri/target/release/bundle/deb/${_pkgname}_${pkgver%.r*}_"*/data/usr/share/applications/"${pkgname%-git}".desktop \
        -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname//-/.}/src-tauri/target/release/bundle/deb/${_pkgname}_${pkgver%.r*}_"*/data/usr/lib/"${pkgname%-git}"/resources/log4rs.yml \
        -t "${pkgdir}/usr/lib/${pkgname%-git}/resources"
    install -Dm644 "${srcdir}/${pkgname//-/.}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}