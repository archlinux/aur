# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=jlivertool
_pkgname=JLiverTool
pkgver=3.2.1
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
source=("${pkgname}-${pkgver}.tar.gz::${_ghurl}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('808ce949861c7600bc08a5688dd785605a4b0a0433a3e9e61c61d1d634d72c34')
_get_project_dir() {
	local d
	while IFS= read -r d; do
		[ -f "$d/Cargo.toml" ] && { echo "$d"; return; }
	done < <(find "${srcdir}" -maxdepth 1 -mindepth 1 -type d ! -name '.*')
}
_set_build_env() {
	export HOME="${srcdir}/.home"
	export CARGO_HOME="${HOME}/.cargo"
	export CARGO_NET_GIT_FETCH_WITH_CLI=true
	export CARGO_NET_RETRY=5
	export CARGO_HTTP_MULTIPLEXING=false
	export CARGO_INCREMENTAL=0
	export CARGO_TERM_COLOR=never
	export CARGO_PROFILE_RELEASE_STRIP=symbols
	mkdir -p "${HOME}" "${CARGO_HOME}"
}
prepare() {
    cd "$(_get_project_dir)"
    _set_build_env
    sed -i 's/channel = ".*"/channel = "stable"/' rust-toolchain.toml
    rustup update stable
    rustup default stable
}
build() {
    cd "$(_get_project_dir)"
    _set_build_env
    cargo build --release -p "${pkgname}"
}
package() {
    install -Dm755 "$(_get_project_dir)/target/release/${pkgname}" -t  "${pkgdir}/usr/bin"
    install -Dm644 "$(_get_project_dir)/icons/icon.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${pkgname}.png"
    install -Dm644 "$(_get_project_dir)/linux/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "$(_get_project_dir)/LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}