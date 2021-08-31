# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=rm-improved-git
pkgver=0.13.1.r13.g11f0b8d
pkgrel=1
pkgdesc='A safe and ergonomic alternative to rm'
arch=('x86_64' 'aarch64')
url='https://github.com/nivekuil/rip'
license=('GPL3')
depends=('gcc-libs')
makedepends=('cargo' 'git')
provides=('rm-improved')
conflicts=('rm-improved')
source=("$pkgname::git+$url")
sha512sums=('SKIP')

pkgver() {
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

check() {
	export RUSTUP_TOOLCHAIN=stable
	cd "$pkgname"
	cargo test --frozen --all-features
}

package() {
	cd "$pkgname"
	install -Dm 755 target/release/rip -t "$pkgdir/usr/bin/"
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
