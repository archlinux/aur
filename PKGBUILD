
# Maintainer: Matt Coffin <mcoffin13 at gmail.com>
pkgname=wl-clipboard-rs
pkgver=0.9.0
pkgrel=1
pkgdesc="A safe Rust reimplementation of the Wayland command-line copy/paste utilities"
arch=('x86_64')
url="https://github.com/YaLTeR/wl-clipboard-rs"
license=('MIT' 'APACHE-2.0')
depends=('gcc-libs')
makedepends=('git' 'cargo')
provides=('wl-clipboard')
conflicts=('wl-clipboard')
source=("${pkgname}::git+https://github.com/YaLTeR/wl-clipboard-rs.git#tag=v${pkgver}" Cargo.lock)
b2sums=('SKIP'
        '4fe2d3c1e1f39a4726712fd51eacb62b4619f9b69b3f323aeab2db0ae34b56e942421424ffe71e07816062290ffa5a92c39d962f43559d5b501e44e6a052a547')

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
