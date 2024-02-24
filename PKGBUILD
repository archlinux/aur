# Maintainer: éclairevoyant
# Contributor: Will Elliott <troutcobbler at gmail dot com>

pkgbase=eww
pkgname=(eww-{wayland,x11})
pkgver=0.5.0
pkgrel=1
pkgdesc="Standalone widget system made in Rust"
url='https://github.com/elkowar/eww'
arch=(x86_64)
license=(MIT)
makedepends=(cargo git)
depends=(gtk3 gtk-layer-shell)
provides=(eww)
conflicts=(eww)
install=$pkgbase.install
source=("git+$url?signed#commit=387d344690903949121040f8a892f946e323c472")
b2sums=('SKIP')
validpgpkeys=(
	'9EFD181455D31DD0F42DA932862BA3D7D7760F13' # Leon Kowarschick <5300871+elkowar@users.noreply.github.com>
	'968479A1AFF927E37D1A566BB5690EEEBB952194' # GitHub (web-flow commit signing) <noreply@github.com>
)

prepare() {
	cd $pkgbase
	cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd $pkgbase

	export CARGO_TARGET_DIR=target_wayland
	cargo build --frozen --release --no-default-features --features=wayland

	export CARGO_TARGET_DIR=target_x11
	cargo build --frozen --release --no-default-features --features=x11
}

_pkg() {
	cd $pkgbase
	install -vDm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -vd "$pkgdir/etc/xdg/$pkgbase/"
	cp -vr examples/eww-bar "$pkgdir/etc/xdg/$pkgbase/"
}

package_eww-wayland() {
	pkgdesc+=" (Wayland backend)"
	depends=(gtk3 gtk-layer-shell)
	_pkg
	install -vDm755 target_wayland/release/$pkgbase -t "$pkgdir/usr/bin/"
}

package_eww-x11() {
	pkgdesc+=" (X11 backend)"
	depends=(gtk3)
	_pkg
	install -vDm755 target_x11/release/$pkgbase -t "$pkgdir/usr/bin/"
}
