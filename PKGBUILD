# Maintainer: éclairevoyant
# Contributor: Atif Chowdhury <iftakhar dot awal at gmail dot com>

_pkgname=eww
pkgbase="$_pkgname-git"
pkgname=($_pkgname-{x11,wayland}-git)
pkgver=0.4.0.r28.ge762068
pkgrel=2
pkgdesc="ElKowar's wacky widgets"
arch=(x86_64)
url="https://github.com/elkowar/$_pkgname"
license=(MIT)
depends=(gtk3 gtk-layer-shell)
makedepends=(cargo-nightly git)
provides=("$_pkgname")
conflicts=("$_pkgname")
install=$pkgbase.install
source=("git+$url.git?signed")
b2sums=('SKIP')
validpgpkeys=(
	'B558974128820CB473BD9807E321AD71B1D1F27F' # Leon Kowarschick <5300871+elkowar@users.noreply.github.com>
	'5DE3E0509C47EA3CF04A42D34AEE18F83AFDEB23' # GitHub (web-flow commit signing) <noreply@github.com>
)

prepare() {
	cd $_pkgname
	export RUSTUP_TOOLCHAIN=nightly
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

pkgver() {
	git -C $_pkgname describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd $_pkgname
	export RUSTUP_TOOLCHAIN=nightly

	export CARGO_TARGET_DIR=target_x11
	cargo build --frozen --release --no-default-features --features=x11

	export CARGO_TARGET_DIR=target_wayland
	cargo build --frozen --release --no-default-features --features=wayland
}

_pkg() {
	cd $_pkgname
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname/"
	install -d "$pkgdir/etc/xdg/$_pkgname/"
	cp -r examples/eww-bar "$pkgdir/etc/xdg/$_pkgname/"
}

package_eww-wayland-git() {
	pkgdesc+=" (Wayland backend)"
	depends=(gtk3 gtk-layer-shell)
	_pkg
	install -Dm755 target_wayland/release/$_pkgname -t "$pkgdir/usr/bin/"
}

package_eww-x11-git() {
	pkgdesc+=" (X11 backend)"
	depends=(gtk3)
	_pkg
	install -Dm755 target_x11/release/$_pkgname -t "$pkgdir/usr/bin/"
}
