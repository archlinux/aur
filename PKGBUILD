# Maintainer: Ward Segers <w@rdsegers.be>

pkgname=nordselect
pkgver=0.3.2
pkgrel=1
pkgdesc="Select the ideal NordVPN server"
arch=('any')
url="https://github.com/editicalu/nordselect"
license=('MIT')
depends=('curl')
makedepends=('cargo')
provides=('nordselect')
source=("https://github.com/editicalu/$pkgname/archive/$pkgver.tar.gz")
sha512sums=("800c34b334821f3a1c0c22e9ffb2f94a26aa7dad6ca7bf182b6644b85c80fe3e163111fdc5025d111e08a29a13d136d5d98a05688162212006b45902cb5081aa")
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
