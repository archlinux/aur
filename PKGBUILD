# Maintainer: edwloef
# Maintainer: may

pkgname=mayland-git
_pkgname=mayland
pkgver=r171.dd61f1a
pkgrel=1
pkgdesc="a bad wayland compositor"
arch=('x86_64')
url="https://github.com/m4rch3n1ng/mayland"
license=('GPL-3.0-or-later')
depends=(
	'gcc-libs'
	'glib2'
	'glibc'
	'libcap'
	'libdisplay-info'
	'libdrm'
	'libevdev'
	'libffi'
	'libinput'
	'libx11'
	'libxcb'
	'libxkbcommon'
	'llvm-libs'
	'mesa'
	'seatd'
	'wayland'
)
optdepends=(
	'kitty: the default terminal emulator'
)
makedepends=('cargo')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+https://github.com/m4rch3n1ng/mayland.git")
sha256sums=(SKIP)

pkgver() {
	cd "${_pkgname}"
	
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${_pkgname}"
	
	export RUSTUP_TOOLCHAN=stable
	cargo fetch --locked
}

build() {
	cd "${_pkgname}"
	
	export RUSTUP_TOOLCHAIN=stable
	cargo build --release --frozen
}

package() {
	cd "${_pkgname}"

	install -Dm755 "target/release/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "resources/mayland.desktop" "${pkgdir}/usr/share/wayland-sessions/mayland.desktop"
	install -Dm644 "resources/mayland.mf" "${pkgdir}/usr/share/mayland/mayland.mf"
}
