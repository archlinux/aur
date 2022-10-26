# Maintainer: Chinmay Dalal <00foahcd7@mozmail.com>

pkgname=waylevel-git
pkgver=1.0.0.r3.g328b64f
pkgrel=1
pkgdesc=' A tool to print Wayland toplevels status and info '
url="https://git.sr.ht/~shinyzenith/waylevel"
arch=('x86_64')
license=('BSD')
makedepends=('cargo' 'git')
provides=("${pkgname%-git}")
source=("git+$url")
sha512sums=('SKIP')

pkgver()  {
	git -C "$pkgname" describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$pkgname"
	cargo update
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cd "$pkgname"
	cargo build --release --frozen --all-features
}

package() {
	cd "$pkgname"
	install -D -t "$pkgdir/usr/bin" target/release/waylevel
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
