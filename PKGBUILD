# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Matt Coffin <mcoffin13 at gmail.com>
pkgname=wl-clipboard-rs
pkgver=0.4.1
pkgrel=3
epoch=
pkgdesc="A safe Rust reimplementation of the Wayland command-line copy/paste utilities"
arch=('x86_64')
url="https://github.com/YaLTeR/wl-clipboard-rs"
license=('MIT' 'APACHE')
depends=('gcc-libs')
makedepends=('git' 'cargo')
provides=('wl-clipboard')
conflicts=('wl-clipboard')
source=("${pkgname}::git+git://github.com/YaLTeR/wl-clipboard-rs.git#tag=v${pkgver}" Cargo.lock)
sha512sums=('SKIP'
            'c74a50b361fd470843e44b704eec2dc63933b4090e32fcf5b6df8b3d455f69a9d46c4eb27c884ea06f787141129d1f160c90a793654f3eaf3052172ff5e7b652')

prepare() {
	cp "$srcdir"/Cargo.lock "$srcdir"/"$pkgname"/
}

build() {
	cd "$pkgname"
	CARGO_INCREMENTAL=0 cargo build --release --locked
}

check() {
	cd "$pkgname"
	CARGO_INCREMENTAL=0 cargo test --release --locked
}

package() {
	if [ ! -d "$pkgdir/usr/bin" ]; then
		mkdir -p "$pkgdir/usr"
	fi
	CARGO_INCREMENTAL=0 cargo install --path "$pkgname" --root "$pkgdir/usr" --bins --frozen --offline

	local _f
	for _f in "$pkgdir"/usr/{.crates.toml,.crates2.json}; do
		[ ! -e "$_f" ] || rm "$_f"
	done

	cd "$pkgname"

	install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -D -m 644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE-APACHE LICENSE-MIT
}
