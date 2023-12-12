# Maintainer: Ivan Molodetskikh <yalterz@gmail.com>
pkgname=wl-clipboard-rs-git
pkgver=0.8.0.r1.gbe851408e
pkgrel=1
pkgdesc="A safe Rust reimplementation of the Wayland command-line copy/paste utilities"
arch=('x86_64')
url="https://github.com/YaLTeR/wl-clipboard-rs"
license=('MIT' 'APACHE-2.0')
depends=('gcc-libs')
makedepends=('git' 'cargo')
provides=('wl-clipboard')
conflicts=('wl-clipboard')
source=("$pkgname::git+https://github.com/YaLTeR/wl-clipboard-rs")
sha1sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
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
