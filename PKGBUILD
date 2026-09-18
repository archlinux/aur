# Maintainer: Niko <aurpkgs@niko.lgbt>

pkgname='gaypanel'
pkgver=1.0.0
pkgrel=3
pkgdesc='Panel for Wayland compositors'
arch=('x86_64' 'i686' 'aarch64' 'armv7')
url='https://codeberg.org/pastthepixels/gaypanel'
source=(
	"$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
	"0001-fix-client-toolkit.patch"
)
license=('GPL-3.0-only')
makedepends=(
	# For building
	'rust'
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
)
optdepends=(
	'power-profiles-daemon: ppd widget'
)
sha256sums=('5a9f9d2279b917217c8b098b85c2c0c4487feb799e4e296e27300ae5981e444f'
            '7d00e50698dcddfd881a2fb1877951f8e62ea069e702833a312db99d6098e381')

prepare() {
	cd "${srcdir}/${pkgname}"
	patch -p1 -i ../0001-fix-client-toolkit.patch

	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target host-tuple
}

build() {
	cd "${srcdir}/${pkgname}"
	cargo build --frozen --release --no-default-features
}

package() {
	cd "${srcdir}/${pkgname}"
	install -Dm 0755 target/release/gaypanel ${pkgdir}/usr/bin/gaypanel
}

