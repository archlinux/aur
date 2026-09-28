# Maintainer: Uyanide <pywang0608@foxmail.com>

pkgname=voicefox
pkgver=0.3.19
pkgrel=1
epoch=1
_tag="v${pkgver}"
_srcdir="${pkgname}-${_tag#v}"
pkgdesc="Rust + ratatui + libmpv 驱动的键盘优先终端音乐播放器：多音源、歌词、本地音乐、下载、收藏与歌单。"
arch=("x86_64" "aarch64")
url="https://github.com/emoeem/voicefox"
license=("MIT")
options=(!lto !debug) # ring's cc-compiled asm breaks with makepkg's -flto
depends=(
	"glibc"
	"hicolor-icon-theme"
	"libgcc"
	"openssl"
	"mpv"
)
makedepends=(
	"cargo"
)
optdepends=(
	"nodejs>=23.5.0: support for custom JS music source"
)
source=(
	"${pkgname}-${pkgver}.tar.gz::$url/archive/refs/tags/${_tag}.tar.gz"
)
sha512sums=('f5378177e9a5a73dfd989bb6f19757f6f5591fb9a759305a399dca4ffce3a9eadf5aff00749dd3539bdb85dd444a8c3587ba99f034a4af4b607e25525eab652c')

prepare() {
	cd "${_srcdir}"

	export RUSTUP_TOOLCHAIN=stable

	cargo fetch --locked --target host-tuple
}

build() {
	cd "${_srcdir}"

	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --release --frozen --package voicefox-app
}

check() {
	cd "${_srcdir}"

	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo test --frozen --workspace

	target/release/voicefox --check-libmpv
}

package() {
	cd "${_srcdir}"

	install -Dm755 -t "${pkgdir}/usr/bin" target/release/voicefox
	install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
	install -Dm644 -t "${pkgdir}/usr/share/applications" assets/voicefox.desktop
	install -Dm644 icons/512.png "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${pkgname}.png"
	install -Dm644 icons/1024.png "${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/${pkgname}.png"
}
