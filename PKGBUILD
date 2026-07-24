# Maintainer: Uyanide <pywang0608@foxmail.com>

pkgname=voicefox-git
_pkgname="${pkgname%-git}"
pkgver=0.8.r0.g28e82c1
pkgrel=2
pkgdesc="A TUI music player that supports both streaming and local tracks"
arch=("x86_64")
url="https://github.com/emoeem/voicefox"
license=("MIT")
options=(!lto) # ring's cc-compiled asm breaks with makepkg's -flto
depends=(
	"glibc"
	"libgcc"
	"openssl"
	"mpv"
	"nodejs"
)
makedepends=(
	"git"
	"rust"
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

package() {
	cd "${_pkgname}"

	install -Dm755 -t "${pkgdir}/usr/bin" target/release/voicefox
	install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}
