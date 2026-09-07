# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=bili-music
_pkgname='Bili Music'
_zhsname='午夜黑胶'
pkgver=0.5.0
_nodeversion=20
pkgrel=1
pkgdesc="A no login, no disk B station music player. Use Bilibili as your music library, listen to music without login, do not have to download.一个免登录、不落盘的 B 站音乐播放器。把哔哩哔哩当作你的曲库，听歌不必登录，不必下载。"
arch=('any')
url="https://github.com/Jmiao11/bili-music"
license=('MIT')
provides=("${pkgname%-git}=${pkgver%.r*}")
conflicts=("${pkgname%-git}")
depends=(
    'gtk3'
    'gdk-pixbuf2'
    'webkit2gtk-4.1'
    'libappindicator'
)
makedepends=(
    'git'
    'curl'
    'rustup'
    'gendesk'
    'librsvg'
)
options=(
    '!lto'
)
source=(
    "${pkgname}-${pkgver}::git+${url}.git#tag=v${pkgver}"
)
sha256sums=('ad2688bd017719de76c0ac2ee3dc113603e344dcecdc5ac18f6479e1829d28a5')
_set_build_env() {
    export HOME="${srcdir}"
    export CARGO_HOME="${srcdir}/.cargo"
    if [[ "$(curl -s ipinfo.io/country)" == *"CN"* ]]; then
        export RUSTUP_DIST_SERVER="https://mirrors.aliyun.com/rustup"
        export RUSTUP_UPDATE_ROOT="https://mirrors.aliyun.com/rustup/rustup"
    fi
}
prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    _set_build_env
    gendesk -q -f -n \
        --pkgname="${pkgname}" \
        --pkgdesc="${pkgdesc}" \
        --categories="AudioVideo" \
        --name="${_pkgname}" \
        --custom=Name[zh_CN]="${_zhsname}" \
        --exec="${pkgname} %U"
    rustup default stable
    cargo install tauri-cli
}
build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    _set_build_env
    cargo tauri build
}
package() {
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}/target/release/"{"${pkgname}",guest_playurl_verify} -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/design/app-icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
