# Maintainer: fossdd <fossdd@pwned.life>

pkgname=redlib
pkgver=0.31.0
pkgrel=2
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
)
sha256sums=(
	'SKIP'
)

prepare() {
	cd $pkgname-$pkgver
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
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
