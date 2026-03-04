# Maintainer: Oskar Roesler <oskar@oskar-roesler.de>

pkgname=bzmenu
pkgver=0.4.0
pkgrel=1
pkgdesc="Launcher-driven Bluetooth manager for Linux"
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
sha256sums=('d38db4f9d530126ab7d0fc4487f25b2da0b3b7e17ffc2635e92151d9f4a4253f')

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
