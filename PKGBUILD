# Maintainer: éclairevoyant
# Contributor: Atif Chowdhury <iftakhar dot awal at gmail dot com>

_pkgname=eww
pkgname="$_pkgname-git"
pkgver=0.6.0.r8.g4d55e9a
pkgrel=1
pkgdesc="ElKowar's wacky widgets"
arch=(x86_64)
url="https://github.com/elkowar/$_pkgname"
license=(MIT)
depends=(gtk3 gtk-layer-shell libdbusmenu-glib libdbusmenu-gtk3)
makedepends=(cargo git)
provides=("$_pkgname")
conflicts=("$_pkgname")
source=(
	"git+$url.git"
	"eww-lockfile.patch::https://raw.githubusercontent.com/NixOS/nixpkgs/8b14399f5e10211f569b3b8321988c1fb7c7ba2e/pkgs/by-name/ew/eww/lockfile.patch"
)
b2sums=('SKIP'
        'a2d953b7cea414cceb3beb6dbb8a17a7503d2b5a0d38fd1a235dbe3edae56d66c3f42003b3fab7633c233056cb556925e57f6f218f0eb0fb445a5873c884d7a5')

prepare() {
	cd $_pkgname
	patch -Np1 -i "$srcdir/eww-lockfile.patch"
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
