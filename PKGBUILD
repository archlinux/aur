# Maintainer: Shane Blackthorne <arch@blackthorne.dev>

pkgname=iwmenu
pkgver=0.2.0
pkgrel=1
pkgdesc="Launcher-driven Wi-Fi manager for Linux"
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
sha256sums=('7be3ce6c2cddd3bc5fef7a0ca935fba0490b8e621e2e8188b4e88a85af1c8351')

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
