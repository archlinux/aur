# Maintainer: Uyanide <pywang0608@foxmail.com>

pkgname=voicefox
pkgver=0.3.9
pkgrel=1
epoch=1
_tag="v${pkgver}"
_srcdir="${pkgname}-${_tag#v}"
pkgdesc="A TUI music player for Netease/Bilibili/QQ/Kugou/... and local tracks"
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
	"${pkgname}-${pkgver}-${pkgrel}.tar.gz::$url/archive/refs/tags/${_tag}.tar.gz"
)
sha512sums=('5fba8ddce954cfb92ef2651321ca8212456ceaa8fd7195502a51b7186c286c45f6fc9f2cbed0c95633cd9669de5669674270645fd4800dba00c54a731ac079ed')

prepare() {
	cd "${_srcdir}"

	export RUSTUP_TOOLCHAIN=stable

	# Upstream often doesn't update this
	sed -i "s/^version = .*/version = \"${pkgver}\"/" Cargo.toml
	cargo update --workspace --offline

	cargo fetch --locked --target "$(rustc --print host-tuple)"
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
}

package() {
	cd "${_srcdir}"

	install -Dm755 -t "${pkgdir}/usr/bin" target/release/voicefox
	install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
	install -Dm644 -t "${pkgdir}/usr/share/applications" assets/voicefox.desktop
	install -Dm644 icons/512.png "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${pkgname}.png"
	install -Dm644 icons/1024.png "${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/${pkgname}.png"
}
