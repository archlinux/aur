# Maintainer: Uyanide <pywang0608@foxmail.com>

pkgname=voicefox
pkgver=0.8.1
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
sha512sums=('53426e807e5fbd2b6f0151c9cc150398ab6b51c65cba505b4d4f994a9d48b9f0070e50e62453665e69c1172b5c97fd26529291c782aff7135983c3943736b034')

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
	# flaky upstream test: evicts by atime but only staggers mtime, so coarse-clock ties fall back to readdir order
	cargo test --frozen --workspace -- --skip cover_cache::tests::sweep_evicts_down_to_the_limit_by_oldest_access

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
