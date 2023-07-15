# Maintainer: éclairevoyant
# Contributor: Atif Chowdhury <iftakhar dot awal at gmail dot com>

_pkgname=eww
pkgbase="$_pkgname-git"
pkgname=($_pkgname-{x11,wayland}-git)
pkgver=0.4.0.r34.g25e50ed
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
source=("git+$url.git?signed"
        0001-comply-with-rust-lang-rfcs-2140.patch)
b2sums=('SKIP'
        '1696d841f15794b4a0a5af350f46a958d4230b89c1560ba8a9b7139507f145751c288f9e696227948c1e9fb235961d1bca1e29004c8d5e9f3c5b4ef6b58e1970')
validpgpkeys=(
	'94E8F34BCE4F4BA8ED9B29BD50E76B4711E4C3E4' # Leon Kowarschick <5300871+elkowar@users.noreply.github.com>
	'5DE3E0509C47EA3CF04A42D34AEE18F83AFDEB23' # GitHub (web-flow commit signing) <noreply@github.com>
)

prepare() {
	cd $_pkgname

	patch -Np1 -i "$srcdir/0001-comply-with-rust-lang-rfcs-2140.patch"

	export RUSTUP_TOOLCHAIN=nightly
	cargo update
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
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
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
