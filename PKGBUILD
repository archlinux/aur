# Maintainer: Uyanide <pywang0608@foxmail.com>

pkgname=voicefox-git
_pkgname="${pkgname%-git}"
pkgver=1.0.r0.g2dc5664
pkgrel=2
pkgdesc="A TUI music player for Netease/Bilibili/QQ/Kugou/... and local tracks"
arch=("x86_64")
url="https://github.com/emoeem/voicefox"
license=("MIT")
options=(!lto) # ring's cc-compiled asm breaks with makepkg's -flto
depends=(
	"glibc"
	"libgcc"
	"openssl"
	"mpv"
)
makedepends=(
	"git"
	"rust"
)
optdepends=(
	"kitty: support for displaying cover image in tmux"
	"nodejs>=23.5.0: support for custom JS music source"
)
provides=("voicefox=${pkgver}")
conflicts=("voicefox" "voicefox-bin")
source=(
	"${_pkgname}::git+${url}.git"
)
sha512sums=('SKIP')

pkgver() {
	cd "${_pkgname}"

	local _describe
	if _describe=$(git describe --long --tags 2>/dev/null); then
		printf "%s" "${_describe}" | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
	else
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	fi
}

prepare() {
	cd "${_pkgname}"

	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
	cd "${_pkgname}"

	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --release --frozen --package voicefox-app
}

check() {
	cd "${_pkgname}"

	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo test --release --frozen --workspace
}

package() {
	cd "${_pkgname}"

	install -Dm755 -t "${pkgdir}/usr/bin" target/release/voicefox
	install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}
