# Maintainer: Dan Griffiths <me at evertiro dot com>

pkgname=astra-airlock-git
_pkgname=Airlock
pkgver=2.0.0.r1.g17408f9
pkgrel=1
pkgdesc='A beautiful m3expressive greetd frontend based on Caelestia (git version)'
arch=('x86_64' 'aarch64')
url='https://github.com/AstraSuite/Airlock'
license=('GPL-3.0-only')
depends=(
	'glibc'
	'greetd'
	'libgcc'
	'libstdc++'
	'qt6-base'
	'qt6-declarative'
	'qt6-m3shapes-git'
)
makedepends=('cargo' 'git' 'qt6-shadertools')
optdepends=(
	'caelestia-cli: dynamic color scheme syncing with Caelestia'
	'cage: kiosk compositor, if not using Hyprland'
	'hyprland: kiosk compositor, if not using Cage'
	'wlr-randr: the monitor flags'
)
provides=('astra-airlock')
conflicts=('astra-airlock' 'astra-airlock-bin')
options=('!lto')
install=astra-airlock.install
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
	cd "${_pkgname}"
	git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
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
	cargo build --frozen --release
}

check() {
	cd "${_pkgname}"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo test --frozen --release
}

package() {
	cd "${_pkgname}"
	install -Dm755 target/release/astra-airlock "${pkgdir}/usr/bin/astra-airlock"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
