# Maintainer: éclairevoyant
# Contributor: Atif Chowdhury <iftakhar dot awal at gmail dot com>

_pkgname=eww
pkgname="$_pkgname-git"
pkgver=0.4.0.r47.ga9a35c1
pkgrel=1
pkgdesc="ElKowar's wacky widgets"
arch=(x86_64)
url="https://github.com/elkowar/$_pkgname"
license=(MIT)
depends=(gtk3 gtk-layer-shell)
makedepends=(cargo-nightly git)
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url.git?signed")
b2sums=('SKIP')
validpgpkeys=(
	'94E8F34BCE4F4BA8ED9B29BD50E76B4711E4C3E4' # Leon Kowarschick <5300871+elkowar@users.noreply.github.com>
	'5DE3E0509C47EA3CF04A42D34AEE18F83AFDEB23' # GitHub (web-flow commit signing) <noreply@github.com>
)

prepare() {
	cd $_pkgname
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
