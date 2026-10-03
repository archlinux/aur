# Maintainer: Supernovatux <thulashitharan.d at gmail dot com>
_pkgname=crab-on-desk
pkgname="${_pkgname}-git"
pkgver=r0.0000000
pkgrel=1
pkgdesc="A rust based pet for coding agents."
arch=('x86_64')
url="https://github.com/Supernovatux/${_pkgname}"
license=('AGPL-3.0-or-later')
depends=('gcc-libs' 'glibc' 'wayland' 'libglvnd' 'libxkbcommon')
makedepends=('git' 'rustup' 'cmake' 'clang')
optdepends=('crab-on-desk-themes: Themes from rullerzhou-afk/clawd-on-desk forted for this proj'
            'hyprland: cursor tracking (roam, dizzy, eye tracking), permission prompt placement and focusing the terminal from it'
            'kwin: cursor tracking (roam, dizzy, eye tracking) and permission prompt placement on KDE Plasma'
            'xdg-desktop-portal: system accent colour and light/dark scheme in the settings and permission windows'
            'claude-code: the agent whose hooks drive the pet')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
	cd "${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${_pkgname}"
	export RUSTUP_TOOLCHAIN=nightly
	rustup toolchain install nightly --profile minimal
	cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
	cd "${_pkgname}"
	export RUSTUP_TOOLCHAIN=nightly
	make CARGO_FLAGS=--frozen
}

package() {
	cd "${_pkgname}"
	export RUSTUP_TOOLCHAIN=nightly
	make PREFIX=/usr DESTDIR="${pkgdir}" CARGO_FLAGS=--frozen install
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
