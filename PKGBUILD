# Maintainer: Uyanide <pywang0608@foxmail.com>

pkgname=voicefox-git
_pkgname="${pkgname%-git}"
pkgver=0.8.r0.g28e82c1
pkgrel=1
pkgdesc="A TUI music player that supports both streaming and local tracks"
arch=("x86_64")
url="https://github.com/emoeem/voicefox"
license=("MIT")
options=(!lto)
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
provides=("voicefox")
conflicts=("voicefox" "voicefox-bin")
source=(
	"git+${url}.git"
)
sha512sums=('SKIP')

pkgver() {
	cd "${_pkgname}"
    git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' \
        || printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${_pkgname}"

	cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
	cd "${_pkgname}"

	cargo build --release --frozen
}

package() {
	cd "${_pkgname}"

	install -Dm755 -t "${pkgdir}/usr/bin" target/release/voicefox
	install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}
