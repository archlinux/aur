# Maintainer: edwloef

pkgname=mayland-git
_pkgname=mayland
pkgver=r161.dbe04c3
pkgrel=1
pkgdesc="a bad wayland compositor"
arch=('x86_64')
url="https://github.com/m4rch3n1ng/mayland"
license=('GPL-3.0-or-later')
depends=('expat' 'gcc-libs' 'glib2' 'glibc' 'icu' 'libcap' 'libdisplay-info' 'libdrm' 'libedit' 'libelf' 'libevdev' 'libffi' 'libgudev' 'libinput' 'libpciaccess' 'libwacom' 'libx11' 'libxau' 'libxcb' 'libxdmcp' 'libxkbcommon' 'libxml2' 'libxshmfence' 'llvm-libs' 'lm_sensors' 'mesa' 'mtdev' 'ncurses' 'pcre2' 'seatd' 'systemd-libs' 'wayland' 'xz' 'zlib' 'zstd')
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
