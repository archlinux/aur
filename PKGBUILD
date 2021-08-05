# Maintainer: Caleb Maclennan <caleb@aleque.com>

pkgname=ufostroker-git
pkgver=0.0.0.r8.g2fd58b2
pkgrel=1
pkgdesc='Add path effects to open glyphs in a UFO file'
arch=(x86_64)
url="https://github.com/simoncozens/${pkgname%-git}"
license=(Apache)
makedepends=(cargo-nightly
             fontconfig
             freetype2
             git)
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "${pkgname%-git}"
	git tag | grep -Fq '0.0.0' || git tag '0.0.0' d4a63044
	git describe --long --tags --abbrev=7 --match='[0-9]*' |
		sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "${pkgname%-git}"
	cargo fetch --locked --target x86_64-unknown-linux-gnu
}

build() {
	cd "${pkgname%-git}"
	export RUSTUP_TOOLCHAIN=nightly
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features
}

check() {
	cd "${pkgname%-git}"
	export RUSTUP_TOOLCHAIN=nightly
	cargo test --frozen --all-features
}

package() {
	cd "${pkgname%-git}"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/${pkgname%-git}"
}
