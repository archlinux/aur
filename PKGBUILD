# Maintainer: Niko <aurpkgs@niko.lgbt>
_basepkg="gaypanel"

pkgname="${_basepkg}-git"
pkgver=1.0.0.r68.g41dc42f
pkgrel=1
pkgdesc='Panel for Wayland compositors - latest git'
arch=('x86_64' 'i686' 'aarch64' 'armv7')
url='https://codeberg.org/pastthepixels/gaypanel'
provides=("${_basepkg}")
conflicts=("${_basepkg}")
source=("${_basepkg}::git+${url}.git")
license=('GPL-3.0-only')
makedepends=(
	# For building
	'cargo'
	'clang'
	'git'
)
depends=(
	# Networks/bluetooth
	'networkmanager'
	'bluez'
	# Sound
	'alsa-lib'
	# GTK
	'gtk4-layer-shell'
	'blueprint-compiler'
	'libadwaita'
	'adwaita-icon-theme'
	# Wayland
	'libxkbcommon'
	# DBus
	'dbus'
	# Rust needs glibc
	'glibc'
	# It was either OpenSSL or aws-lc and the latter seems to not know what "AVX2" is
	'openssl'
)
optdepends=(
	'power-profiles-daemon: ppd widget'
)
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_basepkg}"
	git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "${srcdir}/${_basepkg}"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target host-tuple
}

build() {
	cd "${srcdir}/${_basepkg}"

	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target	
	cargo build --frozen --release --no-default-features
}

package() {
	cd "${srcdir}/${_basepkg}"

	install -Dm0755 target/release/gaypanel ${pkgdir}/usr/bin/gaypanel
}
