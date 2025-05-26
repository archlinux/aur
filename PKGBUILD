# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=musicat
_pkgname=Musicat
pkgver=0.12.0
_nodeversion=20
pkgrel=2
pkgdesc="A sleek desktop music player and tagger for offline music 🪕 With experimental features like map view, GPT analysis, artist toolkit."
arch=(
    'aarch64'
    'x86_64'
)
url="https://github.com/basharovV/musicat"
license=('GPL-3.0-only')
conflicts=("${pkgname}")
depends=(
    'gtk3'
    'alsa-lib'
    'webkit2gtk-4.1'
)
makedepends=(
    'npm'
    'gendesk'
    'git'
    'rust'
    'curl'
)
source=(
    "${pkgname}-${pkgver}::git+${url}#tag=v${pkgver}"
)
sha256sums=('083648b4157c4025c2b1bb2d88f7e06dd0b438d38595bdeed32cb5fe6dbc4354')
_ensure_local_nvm() {
    local NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install "${_nodeversion}"
    nvm use "${_nodeversion}"
}
prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    _ensure_local_nvm
    export npm_config_build_from_source=true
    export npm_config_cache="${srcdir}/.npm_cache"
    export CARGO_HOME="${srcdir}/.cargo"
    HOME="${srcdir}/.electron-gyp"
    export CARGO_HOME="${srcdir}/.cargo"
    if [[ "$(curl -s ipinfo.io/country)" == *"CN"* ]]; then
        {
            echo 'registry=https://registry.npmmirror.com'
            echo 'disturl=https://registry.npmmirror.com/-/binary/node/'
        } >> .npmrc
        export RUSTUP_DIST_SERVER="https://mirrors.ustc.edu.cn/rust-static"
        export RUSTUP_UPDATE_ROOT="https://mirrors.ustc.edu.cn/rust-static/rustup"
        find ./ -type f -name "package-lock.json" -exec sed -i "s/registry.npmjs.org/registry.npmmirror.com/g" {} +
        sed "s/github.com/github.moeyy.xyz\/https:\/\/github.com/" -i src-tauri/Cargo.toml
    fi
    sed -i 's/targets": "all/targets": "deb/g' src-tauri/tauri.conf.json
    NODE_ENV=development    npm install
}
build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    NODE_ENV=production     npx tauri build
}
package() {
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}/src-tauri/target/release/bundle/deb/${_pkgname}_${pkgver}_"*/data/usr/bin/"${_pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    for _icons in 32x32 128x128 256x256@2;do
        install -Dm644 "${srcdir}/${pkgname}-${pkgver}/src-tauri/target/release/bundle/deb/${_pkgname}_${pkgver}_"*/data/usr/share/icons/hicolor/"${_icons}"/apps/"${_pkgname}".png \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname}.png"
    done
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/src-tauri/target/release/bundle/deb/${_pkgname}_${pkgver}_"*/data/usr/share/applications/"${_pkgname}".desktop \
        "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/src-tauri/target/release/bundle/deb/${_pkgname}_${pkgver}_"*/data/usr/lib/"${_pkgname}"/resources/*.yml \
        -t "${pkgdir}/usr/lib/${_pkgname}/resources"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}