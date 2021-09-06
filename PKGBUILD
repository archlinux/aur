# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=gradient-git
pkgver=0.2.0.r3.g1884b6d
pkgrel=1
pkgdesc="CLI tool for playing with color gradients"
arch=('x86_64')
url="https://github.com/mazznoer/gradient-rs"
license=('MIT' 'Apache')
depends=('gcc-libs')
makedepends=('cargo' 'git')
provides=('gradient')
conflicts=('gradient')
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
	git -C "$pkgname" describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

prepare() {
	cd "$pkgname"
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cd "$pkgname"
	cargo build --release --frozen --all-features
}

check() {
	export RUSTUP_TOOLCHAIN=stable
	cd "$pkgname"
	cargo test --frozen --all-features
}

package() {
	cd "$pkgname"
	install -Dm 755 target/release/gradient -t "$pkgdir/usr/bin/"
	install -Dm 644 LICENSE-{APACHE,MIT} -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
