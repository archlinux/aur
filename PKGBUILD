# Maintainer: éclairevoyant
# Contributor: Will Elliott <troutcobbler at gmail dot com>

pkgbase=eww
pkgname=(eww-{wayland,x11})
pkgver=0.4.0
pkgrel=4
pkgdesc="Standalone widget system made in Rust"
url='https://github.com/elkowar/eww'
arch=(x86_64)
license=(MIT)
makedepends=(cargo-nightly git)
depends=(gtk3 gtk-layer-shell)
provides=(eww)
conflicts=(eww)
install=$pkgbase.install
source=("git+$url?signed#commit=d58d91de78d2b9984a1bbb8314be197bc0e283dc")
b2sums=('SKIP')
validpgpkeys=(
	'B558974128820CB473BD9807E321AD71B1D1F27F' # Leon Kowarschick <5300871+elkowar@users.noreply.github.com>
	'94E8F34BCE4F4BA8ED9B29BD50E76B4711E4C3E4' # Leon Kowarschick <5300871+elkowar@users.noreply.github.com>
	'5DE3E0509C47EA3CF04A42D34AEE18F83AFDEB23' # GitHub (web-flow commit signing) <noreply@github.com>
)

prepare() {
	cd $pkgbase
	cargo update
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
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
