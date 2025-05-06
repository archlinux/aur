# Maintainer: Shane Blackthorne <arch@blackthorne.dev>

pkgname=iwmenu
pkgver=0.2.0
pkgrel=1
pkgdesc="A launcher-driven wifi manager for Linux"
arch=('x86_64')
url="https://github.com/e-tho/iwmenu"
license=('GPL-3.0-or-later')
depends=('iwd' 'dbus')
makedepends=('cargo')
optdepends=('dmenu: launcher for options navigation via stdin'
	'rofi: launcher for options navigation via stdin'
	'fuzzel: launcher for options navigation via stdin'
	'walker: launcher for options navigation via stdin'
	'nerd-fonts: for font-based icons (default mode)'
)
conflicts=($pkgname-git $pkgname-bin)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

prepare() {
	cd "$pkgname-$pkgver"

	export RUSTUP_TOOLCHAIN="stable"
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
