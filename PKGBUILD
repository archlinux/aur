# Maintainer: éclairevoyant
# Contributor: Atif Chowdhury <iftakhar dot awal at gmail dot com>

_pkgname=eww
pkgname="$_pkgname-git"
pkgver=0.5.0.r9.g149727c
pkgrel=1
pkgdesc="ElKowar's wacky widgets"
arch=(x86_64)
url="https://github.com/elkowar/$_pkgname"
license=(MIT)
depends=(gtk3 gtk-layer-shell libdbusmenu-glib libdbusmenu-gtk3)
makedepends=(cargo git)
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url.git")
b2sums=('SKIP')

prepare() {
	cd $_pkgname
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

pkgver() {
	git -C $_pkgname describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd $_pkgname
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release
}

package() {
	cd $_pkgname
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -d "$pkgdir/etc/xdg/$_pkgname/"
	cp -r examples/eww-bar "$pkgdir/etc/xdg/$_pkgname/"
	install -Dm755 target/release/$_pkgname -t "$pkgdir/usr/bin/"
}
