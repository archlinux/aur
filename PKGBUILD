# Maintainer: Caleb Maclennan <caleb@aleque.com>

pkgname=vixi-git
pkgver=0.0.0.r156.g66d9520
pkgrel=1
pkgdesc='A vim like client for the xi backend'
arch=(x86_64)
url="https://github.com/Peltoche/${pkgname%-git}"
license=(Apache)
makedepends=(cargo
             git)
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

prepare() {
	cd "$pkgname"
	# Upstream Cargo.lock file is not kept in sync on Git HEAD
	cargo update
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

pkgver() {
	cd "$pkgname"
	git tag | grep -Fq 'v0.0.0' || git tag 'v0.0.0' 0473838
	git describe --long --tags --abbrev=7 --match='v[0-9]*' |
		sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$pkgname"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features
}

check() {
	cd "$pkgname"
	export RUSTUP_TOOLCHAIN=stable
	cargo test --frozen --all-features
}

package() {
	cd "$pkgname"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/${pkgname%-git}"
}
