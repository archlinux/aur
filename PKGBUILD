# Maintainer: éclairevoyant
# Contributor: Atif Chowdhury <iftakhar dot awal at gmail dot com>

_pkgname=eww
pkgname="$_pkgname-git"
pkgver=0.5.0.r2.g7bfd47e
pkgrel=1
pkgdesc="ElKowar's wacky widgets"
arch=(x86_64)
url="https://github.com/elkowar/$_pkgname"
license=(MIT)
depends=(gtk3 gtk-layer-shell)
makedepends=(cargo git)
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url.git?signed")
b2sums=('SKIP')
validpgpkeys=(
	'9EFD181455D31DD0F42DA932862BA3D7D7760F13' # Leon Kowarschick <5300871+elkowar@users.noreply.github.com>
	'968479A1AFF927E37D1A566BB5690EEEBB952194' # GitHub (web-flow commit signing) <noreply@github.com>
)

prepare() {
	cd $_pkgname
	export RUSTUP_TOOLCHAIN=stable
	cargo update
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
