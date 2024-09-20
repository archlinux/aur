# Maintainer: fossdd <fossdd@pwned.life>
# Maintainer: nullcoder <nullcoder@disroot.org>

pkgname=redlib
pkgver=0.35.1
pkgrel=3
pkgdesc="Private front-end for Reddit"
url='https://github.com/redlib-org/redlib'
license=(AGPL-3.0)
arch=(x86_64)
depends=()
makedepends=(cargo git)
backup=("etc/$pkgname.conf")
options=('!lto')
source=(
	"$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.zip"
	"revert-hyper-rustls-0.24.2.patch::https://github.com/redlib-org/redlib/commit/793047f63f0f603e342c919bbfc469c7569276fa.patch"
)
sha256sums=(
	'0704b696a41f4a666fb899ed447cbdd5773024a314a62cc7234c81b8d44d77d5'
	'fd4884a37de41c64eebbffdea9605f1443b2c69b75e732ffa39647f11b1c7530'
)

prepare() {
	cd $pkgname-$pkgver
	patch --forward --strip=1 --input=$srcdir/revert-hyper-rustls-0.24.2.patch
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd $pkgname-$pkgver
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --release --all-features
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 "target/release/$pkgname" -t "$pkgdir/usr/bin/"
	install -Dm644 'LICENSE' -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 'README.md' -t "$pkgdir/usr/share/doc/$pkgname/"
	install -Dm644 "contrib/$pkgname.service" -t "$pkgdir/usr/lib/systemd/system/"
	install -Dm644 "contrib/$pkgname.conf" -t "$pkgdir/etc/"
}
