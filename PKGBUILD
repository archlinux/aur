# Maintainer: Caleb Maclennnan <caleb@alerque.com>

# TODO:
# * upstream 0.0.0 released to crates.io but not tagged,
#   remove forced tag on ba1f37f when rpository gets tagged

pkgname=sear-git
pkgver=0.0.0.r87.gea67ae4
pkgrel=1
pkgdesc='Signed/Encrypted ARchive'
arch=(x86_64)
url="https://github.com/iqlusioninc/${pkgname%-git}"
license=(Apache)
makedepends=(cargo
             git)
provides=("${pkgname%-git}=$pkgver")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

prepare() {
	cd "$pkgname"
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

pkgver() {
	cd "$pkgname"
	git tag -f 0.0.0 ba1f37f 2>&1 >/dev/null ||:
	git describe --long --tags --always --abbrev=7 HEAD |
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
	install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
}
