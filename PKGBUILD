# Maintainer: shtrophci <aur at shtrophic dot net>

pkgname=attic
pkgver=0.2.0
pkgrel=1
pkgdesc="personal webarchive"
arch=(x86_64 aarch64)
url=https://git.sr.ht/~shtrophic/attic
license=(AGPL-3.0-or-later)

depends=(glibc gcc-libs openssl)
makedepends=(cargo)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
	"$pkgname-$pkgver.tar.gz.asc::$url/archive/$pkgver.tar.gz.asc")
sha256sums=('2ba38212a528e208fe0ae3209252e1d4e2b49ee423c9f1b7b3f00c96a9641c17'
            'SKIP')
validpgpkeys=(10F1CC925057D456798EBF9C1B3EB6FE2D338B4A)

prepare() {
	cd "$pkgname-$pkgver"

	sed -i 's|/path/to/content|/var/lib/attic|' attic.service

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
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
