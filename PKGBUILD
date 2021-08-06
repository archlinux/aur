# Maintainer: Caleb Maclennan <caleb@aleque.com>

pkgname=scribl-git
pkgver=0.2.5.r108.g4a1ceb4
pkgrel=1
pkgdesc='make simple instructional videos'
arch=(x86_64)
url="https://github.com/jneem/${pkgname%-git}"
license=(Apache)
depends=(gst-plugins-base-libs
         gtk3)
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
	git describe --long --tags --abbrev=7 --match='flatpak-v[0-9]*' |
		sed 's/flatpak-v//;s/\([^-]*-g\)/r\1/;s/-/./g'
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
	install -Dm755 -t "$pkgdir/usr/bin" "target/release/${pkgname%-git}"
}
