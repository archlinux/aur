# Maintainer: Uyanide <pywang0608@foxmail.com>

pkgname=voicefox
pkgver=0.3.12
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
sha512sums=('fd8f419e4bb7cdb6fb85802dacea924882358b80e3b81a7c5c904946ba23f69e0ba707df3e6cba27d7b66ebfded4d86c3da68005e202ed233d510871f5865804')

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
