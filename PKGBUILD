# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=jlivertool
_pkgname=JLiverTool
pkgver=3.0.10
pkgrel=1
pkgdesc="Simple Bilibili Danmaku Tool.Bilibili 弹幕机."
arch=('any')
url="http://jlivertool.xinrea.cn/"
_ghurl="https://github.com/Xinrea/JLiverTool"
license=('MIT')
provides=("${pkgname}")
conflicts=("${pkgname}")
depends=(
    'xdotool'
    'gdk-pixbuf2'
    'gtk3'
    'openssl'
    'libxkbcommon-x11'
)
makedepends=(
    'curl'
    'git'
    'rustup'
)
source=("${pkgname}-${pkgver}::git+${_ghurl}#tag=v${pkgver}")
sha256sums=('d83c0ad3daca71698a7d78d64252a9ed2d58c0b4459397ed1c56a56ebc3172bf')
_set_build_env() {
	export CARGO_HOME="${srcdir}/.cargo"
	if [[ "$(curl -s ipinfo.io/country)" == *"CN"* ]]; then
		export RUSTUP_DIST_SERVER=https://mirrors.ustc.edu.cn/rust-static
		export RUSTUP_UPDATE_ROOT=https://mirrors.ustc.edu.cn/rust-static/rustup
        export NPM_CONFIG_REGISTRY="https://registry.npmmirror.com"
	fi
}
prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    _set_build_env
    rustup default stable
}
build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    _set_build_env
    cargo build --release -p "${pkgname}"
}
package() {
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}/target/release/${pkgname}" -t  "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/icons/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/linux/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
