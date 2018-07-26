# Maintainer: Ward Segers <w@rdsegers.be>

pkgname=nordselect
pkgver=0.3.0
pkgrel=1
pkgdesc="Select the ideal NordVPN server"
arch=('any')
url="https://github.com/editicalu/nordselect"
license=('MIT')
depends=('curl')
makedepends=('cargo')
provides=('nordselect')
source=("https://github.com/editicalu/$pkgname/archive/$pkgver.tar.gz")
sha512sums=("a10cc86810a9af4653bd3e9cc85332ee791bd178a971252ef02ba68d77900c79af526728fc70efe0ade003e47f9a46ffe6267acb077dc2294e7bba85ee14bc28")
validpgpkeys=("CC0B7CE9604A8A91F0D70B778489DB248465FDD7")

build() {
	cd "$pkgname-$pkgver"
	cargo build --release
}

check() {
	cd "$pkgname-$pkgver"
	cargo test
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 target/release/nordselect "$pkgdir/usr/bin/nordselect"
}

post_install() {
	# Allow ping functionality
	# This crate uses liboping, a non-standard way to ping. This is prohibited by Linux by default.
	setcap cap_net_raw+ep /usr/bin/nordselect
}
