# Maintainer: Shane Blackthorne <arch@blackthorne.dev>

pkgname=bzmenu
pkgver=0.2.0
pkgrel=1
pkgdesc="A launcher-driven bluetooth manager for Linux"
arch=('x86_64')
url="https://github.com/e-tho/bzmenu"
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'bluez' 'dbus')
makedepends=('cargo')
optdepends=('dmenu: launcher for options navigation via stdin'
	'rofi: launcher for options navigation via stdin'
	'fuzzel: launcher for options navigation via stdin'
	'walker: launcher for options navigation via stdin'
	'nerd-fonts: for font-based icons (default mode)'
)
conflicts=($pkgname-git $pkgname-bin)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('138cb80c18c836e3708cd1f2bcaf556086d8bb0df278fc51f044071480afaa8b')

prepare() {
	cd "$pkgname-$pkgver"

	export RUSTUP_TOOLCHAIN=stable
    	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$pkgname-$pkgver"

	export RUSTUP_TOOLCHAIN="stable"
	export CARGO_TARGET_DIR="target"

	cargo build --frozen --release 
}

package() {
	cd "$pkgname-$pkgver"

	install -Dm755 -t "${pkgdir}/usr/bin" "target/release/$pkgname" 
}
