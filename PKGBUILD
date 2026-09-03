# Maintainer: Uyanide <pywang0608@foxmail.com>

pkgname=voicefox
pkgver=0.3.8
pkgrel=1
epoch=1
#_tag="v${pkgver}"
_tag="704a97bffffbc2f5cbedae9f91ba65abb5a26897" # Temporary workaround: v0.3.8 is referring to a wrong commit
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
	# "${pkgname}-${pkgver}-${pkgrel}.tar.gz::$url/archive/refs/tags/${_tag}.tar.gz"
	"${pkgname}-${pkgver}.zip::$url/archive/${_tag}.zip"
)
sha512sums=('75b63172f96842692a2e2d0d23baca0d12b3e99ce1c9641a52ed96375dd1b1bf80d535346c130d7174301ba68823f09c11b21abe28b8928aa393e0a05e66b809')

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
