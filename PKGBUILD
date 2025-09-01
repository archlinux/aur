# Maintainer: coffebar i8ehkvien@mozmail.com
#
# shellcheck disable=SC2034

pkgname=hyprland-per-window-layout
pkgver=2.17
pkgrel=1
pkgdesc='Per window keyboard layout (language) for Hyprland wayland compositor'
arch=('x86_64')
url="https://github.com/coffebar/$pkgname"
license=('GPL')
makedepends=(cargo git)
depends=()
_commit=539771c
source=("git+$url#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname" || return 1
	git describe --tags | sed 's/^v//;s/-/+/g'
}

prepare() {
	cd "$pkgname" || return 1
	export RUSTUP_TOOLCHAIN=stable
	test -f /usr/bin/rustup && /usr/bin/rustup update --no-self-update $RUSTUP_TOOLCHAIN
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$pkgname" || return 1
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release
}

package() {
	cd "$pkgname" || return 1
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
