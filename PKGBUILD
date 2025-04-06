# Maintainer: fossdd <fossdd@pwned.life>
# Maintainer: nullcoder <nullcoder@disroot.org>

pkgname=redlib
pkgver=0.36.0
pkgrel=1
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
sha256sums=('cb5f474d2b38bfd5b14587af20459447f433188f72db1cd8f22178aecf753b0c')

prepare() {
	cd $pkgname-$pkgver
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
