# Maintainer: shtrophci <aur at shtrophic dot net>

pkgname=attic
pkgver=0.2.0
pkgrel=4
pkgdesc="personal webarchive"
arch=(x86_64 aarch64)
url=https://git.sr.ht/~shtrophic/attic
license=(AGPL-3.0-or-later)

depends=(glibc gcc-libs openssl)
makedepends=(cargo)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
	"$pkgname-$pkgver.tar.gz.asc::$url/archive/$pkgver.tar.gz.asc"
	sysusers.conf)
sha256sums=('2ba38212a528e208fe0ae3209252e1d4e2b49ee423c9f1b7b3f00c96a9641c17'
            'SKIP'
            'cc4a7514bfa3b9de6ac4ba0b79d80c2f2ae0827b756e397bd2675a09b89eaea2')
validpgpkeys=(10F1CC925057D456798EBF9C1B3EB6FE2D338B4A)

backup=("etc/$pkgname.env")
install="$pkgname.install"

prepare() {
	cd "$pkgname-$pkgver"

	sed -i 's|/path/to/content|/var/lib/attic|' attic.service attic.env

	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$pkgname-$pkgver"

	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release
}

package() {
	cd "$pkgname-$pkgver"

	install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"

	install -Dm644 "$pkgname.service" -t "$pkgdir/usr/lib/systemd/system"
	install -Dm644 "$srcdir/sysusers.conf" "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
	install -Dm600 "$pkgname.env" -t "$pkgdir/etc"
	
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
