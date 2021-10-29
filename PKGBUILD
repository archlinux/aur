# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=octofetch-git
pkgver=0.3.1.r2.gd584513
pkgrel=1
pkgdesc="GitHub stats fetch tool"
arch=('x86_64')
url="https://github.com/azur1s/octofetch"
license=('unknown')
depends=('gcc-libs' 'openssl')
makedepends=('cargo' 'git')
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
	git -C "$pkgname" describe --long --tags | sed 's/-/.r/;s/-/./'
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
	install -D "target/release/${pkgname%-git}" -t "$pkgdir/usr/bin/"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
