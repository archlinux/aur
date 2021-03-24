# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Matt Coffin <mcoffin13 at gmail.com>
pkgname=wl-clipboard-rs
pkgver=0.4.1
pkgrel=2
epoch=
pkgdesc="A safe Rust reimplementation of the Wayland command-line copy/paste utilities"
arch=('x86_64')
url="https://github.com/YaLTeR/wl-clipboard-rs"
license=('MIT' 'APACHE')
depends=('gcc-libs')
makedepends=('git' 'cargo')
provides=('wl-clipboard')
conflicts=('wl-clipboard')
source=("https://github.com/YaLTeR/wl-clipboard-rs/archive/v${pkgver}.tar.gz")
sha512sums=('b1c80b09c2216be92f780e31d1b56e00c69df137aa6ac9bb15d3d90140970087caf8ed614f906172db6474b3a80a92ecf7f9420612453cc97883e62d08306795')

build() {
	cd "$pkgname-$pkgver"
	cargo build --release
}

check() {
	cd "$pkgname-$pkgver"
	cargo test
}

package() {
	if [ ! -d "$pkgdir/usr/bin" ]; then
		mkdir -p "$pkgdir/usr"
	fi
	cargo install --path "$pkgname-$pkgver" --root "$pkgdir/usr" --bins

	local _f
	for _f in "$pkgdir"/usr/{.crates.toml,.crates2.json}; do
		[ ! -e "$_f" ] || rm "$_f"
	done

	cd "$pkgname-$pkgver"

	install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -D -m 644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE-APACHE LICENSE-MIT
}
