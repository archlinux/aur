# Maintainer: Dan Griffiths <me at evertiro dot com>

pkgname=astra-airlock
pkgver=2.0.0
pkgrel=1
pkgdesc='A beautiful m3expressive greetd frontend based on Caelestia'
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
makedepends=('cargo' 'qt6-shadertools')
optdepends=(
	'caelestia-cli: dynamic color scheme syncing with Caelestia'
	'cage: kiosk compositor, if not using Hyprland'
	'hyprland: kiosk compositor, if not using Cage'
	'wlr-randr: the monitor flags'
)
conflicts=('astra-airlock-bin' 'astra-airlock-git')
options=('!lto')
install=astra-airlock.install
source=("https://github.com/AstraSuite/Airlock/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('f87f4461d3c6b92ad752fe536dd441160c318debbd0a587033186eeace007d31')

prepare() {
	cd "${pkgname}-${pkgver}"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
	cd "${pkgname}-${pkgver}"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	# The release tarball has no git history to read the version from
	export AIRLOCK_VERSION="${pkgver}"
	cargo build --frozen --release
}

check() {
	cd "${pkgname}-${pkgver}"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	export AIRLOCK_VERSION="${pkgver}"
	cargo test --frozen --release
}

package() {
	cd "${pkgname}-${pkgver}"
	install -Dm755 target/release/astra-airlock "${pkgdir}/usr/bin/astra-airlock"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
