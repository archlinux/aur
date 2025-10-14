pkgname=mullvad-socks-git
pkgver=vcs
pkgrel=1
pkgdesc="Filter Mullvad's SOCKS5 proxies by country, city, weight and online status."
url='https://github.com/APT37/mullvad-socks'
arch=('x86_64')
makedepends=('git' 'cargo')
license=('MIT-0')
source=("$pkgname::git+$url")
sha256sums=('SKIP')
options=('!lto')
provides=('mullvad-socks')
conflicts=('mullvad-socks' 'mullvad-socks-bin')

pkgver() {
	date +%Y%m%d
}

prepare() {
	cd $pkgname
	cargo fetch
}

build() {
	cd $pkgname
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --release --offline
}

package() {
	cd $pkgname
	install -Dm755 'target/release/mvs-cli' -t "$pkgdir/usr/bin"
	install -Dm755 'target/release/mvs-web' -t "$pkgdir/usr/bin"
	install -Dm644 'LICENSE' -t "$pkgdir/usr/share/licenses/$pkgname"
}
