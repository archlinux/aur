# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=bili-music
_pkgname='Bili Music'
_zhsname='午夜黑胶'
pkgver=0.4.0
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
)
makedepends=(
    'git'
    'curl'
    'rustup'
    'gendesk'
)
options=(
    '!lto'
)
source=(
    "${pkgname}-${pkgver}::git+${url}.git#tag=v${pkgver}"
)
sha256sums=('89a8f96b3ed6e78ff4e1de1851008320d2f810dc2fa836c12bb7711c1844ec64')
_set_build_env() {
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
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}/target/release/${pkgname}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/design/app-icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
