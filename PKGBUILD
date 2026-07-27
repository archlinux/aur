# Maintainer: Uyanide <pywang0608@foxmail.com>

pkgname=voicefox
pkgver=1.1
_pkgver=1,1
__pkgver=1-1
pkgrel=1
pkgdesc="A TUI music player for Netease/Bilibili/QQ/Kugou/... and local tracks"
arch=("x86_64")
url="https://github.com/emoeem/voicefox"
license=("MIT")
options=(!lto) # ring's cc-compiled asm breaks with makepkg's -flto
depends=(
	"glibc"
	"hicolor-icon-theme"
	"libgcc"
	"openssl"
	"mpv"
)
makedepends=(
	"rust"
)
optdepends=(
	"kitty: support for displaying cover image in tmux"
	"nodejs>=23.5.0: support for custom JS music source"
)
source=(
	"${pkgname}-${pkgver}.tar.gz::$url/archive/refs/tags/${_pkgver}.tar.gz"
)
sha512sums=('ffeebd389fd575184c5bb9ebab8f6bde77b326b6cf2842e5772815d55106f471c63335d261e7593056a2c8d7c179ac94d2d496cca5fd5a9a60fe7bc0028804c5')

prepare() {
	cd "${pkgname}-${__pkgver}"

	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
	cd "${pkgname}-${__pkgver}"

	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --release --frozen --package voicefox-app
}

check() {
	cd "${pkgname}-${__pkgver}"

	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo test --release --frozen --workspace
}

package() {
	cd "${pkgname}-${__pkgver}"

	install -Dm755 -t "${pkgdir}/usr/bin" target/release/voicefox
	install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
	install -Dm644 -t "${pkgdir}/usr/share/applications" assets/voicefox.desktop
	install -Dm644 icons/1.png "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${pkgname}.png"

}
