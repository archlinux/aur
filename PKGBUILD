# Maintainer: Igor Tolmachev <me@igorek.dev>
pkgname=v2rs
pkgver=0.5.2
pkgrel=1
pkgdesc="A small CLI for managing xray proxy"
arch=('x86_64')
url="https://git.igorek.dev/igorechek06/v2rs"
license=('GPL-3.0-or-later')
depends=('xray' 'iproute2')
makedepends=('cargo')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('ab591781d9e7128f293555eafadababf2330deb4b78257f8ef48e34b875122dc')

prepare() {
	cd "$pkgname"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target host-tuple
}

build() {
	cd "$pkgname"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features
}

package() {
	cd "$pkgname"
	install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 "$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
}
