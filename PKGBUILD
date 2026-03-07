
# Maintainer: Matt Coffin <mcoffin13 at gmail.com>
pkgname=wl-clipboard-rs
pkgver=0.9.3
pkgrel=1
pkgdesc="A safe Rust reimplementation of the Wayland command-line copy/paste utilities"
arch=('x86_64')
url="https://github.com/YaLTeR/wl-clipboard-rs"
license=('MIT' 'APACHE-2.0')
depends=('gcc-libs')
makedepends=('git' 'cargo')
provides=('wl-clipboard')
conflicts=('wl-clipboard')
source=("${pkgname}::git+https://github.com/YaLTeR/wl-clipboard-rs.git#tag=v${pkgver}")
b2sums=('0d9b48937cb2d4a33c4bc46b97a4a935f80c646ebe0136a41efa6d393c6b37f43815726146f867402b9d0f400c04656a173ba56ed880d7d2a8a5f115a932c77d')

prepare() {
	[ ! -e "$srcdir"/Cargo.lock ] || cp "$srcdir"/Cargo.lock "$srcdir"/"$pkgname"/
}

build() {
	cd "$pkgname/wl-clipboard-rs-tools"
	CARGO_INCREMENTAL=0 cargo build --release --locked
}

check() {
	cd "$pkgname/wl-clipboard-rs-tools"
	CARGO_INCREMENTAL=0 cargo test --release --locked
}

package() {
	if [ ! -d "$pkgdir/usr/bin" ]; then
		mkdir -p "$pkgdir/usr"
	fi
	CARGO_INCREMENTAL=0 cargo install --path "$pkgname/wl-clipboard-rs-tools" --root "$pkgdir/usr" --bins --frozen --offline

	local _f
	for _f in "$pkgdir"/usr/{.crates.toml,.crates2.json}; do
		[ ! -e "$_f" ] || rm "$_f"
	done

	cd "$pkgname"

	install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -D -m 644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE-APACHE LICENSE-MIT
}
