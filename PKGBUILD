# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Matt Coffin <mcoffin13 at gmail.com>
pkgname=wl-clipboard-rs
pkgver=0.7.0
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
b2sums=('SKIP'
        'e9963c5516aa4b8c787c16ce03ee75608872226b4ed1da3785c30d109ba27a4f1ebcc1e65020342a64783ff2faeacab5794253941dbe004e1ea2e194eedebc74')

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
