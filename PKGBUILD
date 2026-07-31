# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=bili-music
_pkgname='Bili Music'
_zhsname='午夜黑胶'
pkgver=0.3.3
_nodeversion=20
pkgrel=1
pkgdesc="A desktop music player based on Tauri v2 + Rust, which uses the music area of Bilibili as a music library to listen to songs."
arch=('any')
url="https://github.com/Jmiao11/bili-music"
license=('LicenseRef-PolyForm-Strict-License-1.0.0')
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
source=(
    "${pkgname}-${pkgver}::git+${url}.git#tag=v${pkgver}"
)
sha256sums=('69f3fe9b4e1e366aee8a58bea885d57ef708358598f93cec23be8e0a0f467106')
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
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}