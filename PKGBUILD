# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Matt Coffin <mcoffin13 at gmail.com>
pkgname=wl-clipboard-rs
pkgver=0.6.0
pkgrel=1
epoch=
pkgdesc="A safe Rust reimplementation of the Wayland command-line copy/paste utilities"
arch=('x86_64')
url="https://github.com/YaLTeR/wl-clipboard-rs"
license=('MIT' 'APACHE')
depends=('gcc-libs')
makedepends=('git' 'cargo')
provides=('wl-clipboard')
conflicts=('wl-clipboard')
source=("${pkgname}::git+https://github.com/YaLTeR/wl-clipboard-rs.git#tag=v${pkgver}" Cargo.lock)
sha512sums=('SKIP'
            '5e3b8aa2b757c166edcea1b13f45827ffd84a07c9b75a58918679bc82d3f37a7f29eb4ef3d595bcb42a74c26bb9e1d38b2bb93319a25bd6eb16752d891a5f5bc')

prepare() {
	cp "$srcdir"/Cargo.lock "$srcdir"/"$pkgname"/
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
