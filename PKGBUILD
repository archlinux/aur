pkgname='gaypanel-git'
pkgver=0.1.0
pkgrel=1
pkgdesc='Panel for Wayland compositors - latest build from source'
arch=(any)
url='https://codeberg.org/pastthepixels/gaypanel'
source=("git+$url.git")
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
)
optdepends=(
	'niri: niri workspaces widget'
	'power-profiles-daemon: ppd widget'
)
sha256sums=('SKIP')

pkgver() {
	sed -nr 's/^version \= "(.*)"/\1/p' gaypanel/Cargo.toml
}

build() {
	cd gaypanel
	
	# Build with default features (the only feature is `niri`) if niri is found,
	# otherwise build without niri-ipc support because it's gonna crash and complain.
	#
	# This has the downside of the niri workspaces widget just Not Working if users
	# start without niri and then switch to it, but... I don't really know what to do
	# since I can only do something about the panel crashing because something something
	# niri-ipc at compile time. For now. I guess...
	if !command -v niri >/dev/null 2>&1
	then
		cargo build --release --no-default-features
	else
		cargo build --release
	fi
}

package() {
	install -Dm 0755 gaypanel/target/release/gaypanel $pkgdir/usr/bin/gaypanel
}

